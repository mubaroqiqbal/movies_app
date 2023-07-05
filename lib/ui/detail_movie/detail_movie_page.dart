import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/constants/endpoints.dart';
import 'package:movies_app/constants/setup_locator.dart';
import 'package:movies_app/models/responses/detail_movie_responses.dart';
import 'package:movies_app/models/responses/get_movie_videos_responses.dart';
import 'package:movies_app/stores/movies_store.dart';
import 'package:movies_app/ui/detail_movie/widgets/trailer_webview.dart';
import 'package:movies_app/ui/reviews/review_page.dart';

class DetailMoviePage extends StatefulWidget {
  final int movieId;

  const DetailMoviePage({super.key, required this.movieId});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  late final _moviesStore = getIt<MoviesStore>();

  late final DetailMovieResponses data;
  late final GetMovieVideosResponses videosData;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        data = await _moviesStore.getMovieDetail(widget.movieId.toString());
      } catch (e) {
        print(e);
      }
      try {
        videosData = await _moviesStore.getMovieVideos(widget.movieId.toString());
      } catch (e) {
        print(e);
      }
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, size: 28),
                      ),
                      expandedHeight: 400,
                      floating: false,
                      pinned: true,
                      elevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          "${Endpoints.imageBaseUrl}w500${data.posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: Container(),
                      ),
                    ),
                  ];
                },
                body: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Container(margin: const EdgeInsets.only(top: 5)),
                      Text(data.originalTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                        const Icon(Icons.star, color: Colors.orange, size: 24),
                        const SizedBox(width: 4),
                        Text(data.voteAverage.toStringAsFixed(1).toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                              builder: (context) {
                                return ReviewPage(movieId: data.id);
                              },
                            );
                          },
                          child: const Text(
                            "See All Reviews",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          ),
                        )
                      ]),
                      const SizedBox(height: 8),
                      Text("${data.status} on ${getReleaseDateFilterTime(data.releaseDate)}", style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 16),
                      Text(data.overview),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(text: "Genres: ", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black), children: [
                          TextSpan(text: _moviesGenre, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      const Text("Trailer", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: (_trailerUrls.isNotEmpty) ? trailerLayout() : noTrailer(),
                      )
                    ]),
                  ),
                ]),
              ),
      ),
    );
  }

  Widget noTrailer() {
    return Center(
      child: Container(
        child: const Text("No trailer available"),
      ),
    );
  }

  Widget trailerLayout() {
    return ListView.builder(
      itemCount: _trailerUrls.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return trailerItem(_trailerUrls[index]);
      },
    );
  }

  trailerItem(MovieVideoResponses item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrailerWebview(
              url: Uri.parse(Endpoints.youtubeBaseUrl + item.key),
              title: item.name,
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            margin: const EdgeInsets.all(5.0),
            height: 100.0,
            color: Colors.grey,
            child: const Center(child: Icon(Icons.play_circle_filled)),
          ),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String getReleaseDateFilterTime(String data) {
    final date = DateTime.parse(data);
    return DateFormat("dd MMMM yyyy", "id").format(date);
  }

  String get _moviesGenre {
    return data.genres.map((e) => e.name).toList().toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", ", ");
  }

  List<MovieVideoResponses> get _trailerUrls {
    final officialTrailersOnYoutube = videosData.results.where(
      (element) => element.official && element.site.toLowerCase() == "youtube" && element.type.toLowerCase() == "trailer",
    );

    return officialTrailersOnYoutube.toList();
  }
}
