import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/constants/endpoints.dart';
import 'package:movies_app/constants/setup_locator.dart';
import 'package:movies_app/models/params/get_movies_params.dart';
import 'package:movies_app/models/responses/get_movies_responses.dart';
import 'package:movies_app/stores/movies_store.dart';
import 'package:movies_app/ui/detail_movie/detail_movie_page.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final _moviesStore = getIt<MoviesStore>();

  final RefreshController _refreshControllerMovies = RefreshController();

  final PagingController<int, ItemMovieResponses> _pagingMoviesController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingMoviesController.addPageRequestListener(
      (pageKey) async => _fetchMovies(pageKey: pageKey),
    );
  }

  Future<void> _fetchMovies({required int pageKey}) async {
    if (mounted) {
      try {
        final responses = await _moviesStore.getMovies(
          GetMoviesParams(
            page: pageKey,
            withGenres: _moviesStore.selectedGenres.map((e) => e.id).toList().toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", "|"),
          ),
        );

        try {
          final isLastPage = pageKey >= responses.totalPages;
          if (isLastPage) {
            _pagingMoviesController.appendLastPage(responses.results);
          } else {
            final nextPageKey = pageKey + 1;
            _pagingMoviesController.appendPage(responses.results, nextPageKey);
          }
        } catch (error) {
          _pagingMoviesController.error = error;
        }

        _refreshControllerMovies.refreshCompleted();
        setState(() {});
      } catch (error) {
        debugPrint("Exception $error");
        _pagingMoviesController.error = error;

        _refreshControllerMovies.refreshCompleted();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Movie List by Genres"),
        ),
        body: SafeArea(
          child: Column(children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _moviesStore.selectedGenres.length,
                itemBuilder: (context, index) {
                  final currentIdxData = _moviesStore.selectedGenres[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(
                        currentIdxData.name,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      selectedColor: Colors.red,
                      selected: _moviesStore.selectedGenres.contains(currentIdxData),
                      onSelected: (value) {},
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: PagedGridView<int, ItemMovieResponses>(
                pagingController: _pagingMoviesController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                builderDelegate: PagedChildBuilderDelegate<ItemMovieResponses>(
                  itemBuilder: (context, item, index) => GridTile(
                    child: InkResponse(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMoviePage(movieId: item.id)));
                      },
                      enableFeedback: true,
                      child: Image.network(
                        "${Endpoints.imageBaseUrl}w185${item.posterPath}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      );
    });
  }
}
