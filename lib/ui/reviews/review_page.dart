import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/constants/endpoints.dart';
import 'package:movies_app/constants/setup_locator.dart';
import 'package:movies_app/models/params/get_movie_reviews_params.dart';
import 'package:movies_app/models/responses/get_movie_reviews_responses.dart';
import 'package:movies_app/stores/movies_store.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

class ReviewPage extends StatefulWidget {
  final int movieId;
  const ReviewPage({super.key, required this.movieId});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late final _moviesStore = getIt<MoviesStore>();

  final RefreshController _refreshControllerReviews = RefreshController();

  final PagingController<int, MovieReviewResponses> _pagingReviewsController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _pagingReviewsController.addPageRequestListener(
      (pageKey) async => _fetchReviews(pageKey: pageKey),
    );
  }

  Future<void> _fetchReviews({required int pageKey}) async {
    if (mounted) {
      try {
        final responses = await _moviesStore.getMovieReviews(GetMovieReviewsParams(page: pageKey), widget.movieId.toString());

        try {
          final isLastPage = pageKey >= responses.totalPages;

          if (isLastPage) {
            _pagingReviewsController.appendLastPage(responses.results);
          } else {
            final nextPageKey = pageKey + 1;
            _pagingReviewsController.appendPage(responses.results, nextPageKey);
          }
        } catch (error) {
          _pagingReviewsController.error = error;
        }

        _refreshControllerReviews.refreshCompleted();
        setState(() {});
      } catch (error) {
        debugPrint("Exception $error");
        _pagingReviewsController.error = error;

        _refreshControllerReviews.refreshCompleted();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              const Expanded(
                child: Text("Movie Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.clear),
              )
            ]),
            const SizedBox(height: 16),
            Expanded(
              child: PagedListView<int, MovieReviewResponses>.separated(
                pagingController: _pagingReviewsController,
                padding: const EdgeInsets.only(bottom: 16),
                builderDelegate: PagedChildBuilderDelegate<MovieReviewResponses>(
                  itemBuilder: (ctx, item, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                        Row(children: [
                          SizedBox(
                            height: 34,
                            width: 34,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: (item.authorDetails?.avatarPath ?? "").isNotEmpty
                                  ? Image.network(getUserAvatar(item.authorDetails!.avatarPath), width: 60, height: 60, fit: BoxFit.cover).image
                                  : null,
                              child: (item.authorDetails?.avatarPath ?? "").isEmpty
                                  ? Center(
                                      child: Text(
                                        getNameInitial(item.author).toUpperCase(),
                                        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.author,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )
                        ]),
                        if ((item.authorDetails?.rating ?? 0) > 0) const SizedBox(height: 8),
                        if ((item.authorDetails?.rating ?? 0) > 0)
                          Row(children: [
                            const Icon(Icons.star, color: Colors.orange, size: 14),
                            const SizedBox(width: 4),
                            Text((item.authorDetails?.rating ?? 0).toStringAsFixed(1), style: const TextStyle(fontSize: 12)),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(getCreatedDate(item.updatedAt.isEmpty ? item.createdAt : item.updatedAt), style: const TextStyle(fontSize: 12)))
                          ]),
                        const SizedBox(height: 8),
                        Text(
                          item.content,
                          style: const TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ]),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Container(height: 4),
              ),
            )
          ],
        ),
      );
    });
  }

  String getUserAvatar(String imgUrl) {
    String url = "";

    if (imgUrl.contains("https")) {
      if (imgUrl.contains("/https")) {
        url = imgUrl.replaceAll("/https", "https");
      } else {
        url = imgUrl;
      }
    } else {
      url = "${Endpoints.imageBaseUrl}w500${imgUrl}";
    }
    return url;
  }

  String getNameInitial(String name) {
    String nameInitial = "";

    if (name.isNotEmpty) {
      final List<String> listName = name.split(" ");

      for (final String name in listName) {
        if (name.isNotEmpty) nameInitial = nameInitial + name[0];
      }
    }

    return nameInitial;
  }

  String getCreatedDate(String data) {
    final date = DateTime.parse(data);
    return DateFormat("dd/MM/yyyy", "id").format(date);
  }
}
