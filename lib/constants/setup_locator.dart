import 'package:get_it/get_it.dart';
import 'package:movies_app/stores/movies_store.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(MoviesStore());
}
