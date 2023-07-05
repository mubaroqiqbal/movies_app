import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_app/constants/setup_locator.dart';
import 'package:movies_app/stores/movies_store.dart';
import 'package:movies_app/ui/movies/movies_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final MoviesStore _moviesStore = getIt<MoviesStore>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _moviesStore.getGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                if (_moviesStore.genres.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Column(children: [
                    const Text(
                      "Select movie genres you want to search",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      children: List<Widget>.generate(
                        _moviesStore.genres.length,
                        (int idx) {
                          final currentIdxData = _moviesStore.genres[idx];

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                                label: Text(
                                  currentIdxData.name,
                                  style: TextStyle(
                                    color: _moviesStore.selectedGenres.contains(currentIdxData) ? Colors.white : null,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                selectedColor: Colors.red,
                                selected: _moviesStore.selectedGenres.contains(currentIdxData),
                                onSelected: (bool selected) {
                                  if (_moviesStore.selectedGenres.contains(currentIdxData)) {
                                    _moviesStore.selectedGenres.removeWhere((element) => element.id == currentIdxData.id);
                                  } else {
                                    _moviesStore.selectedGenres.add(currentIdxData);
                                  }
                                }),
                          );
                        },
                      ).toList(),
                    ),
                  ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: _moviesStore.selectedGenres.isNotEmpty
                          ? () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MoviesPage()));
                            }
                          : null,
                      child: Text(
                        "Search".toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
