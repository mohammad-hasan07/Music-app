import 'package:get_it/get_it.dart';
import '../data/repo/service_repo.dart';
import '../view_model/service_view_model.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {

  // Repositories
  sl.registerLazySingleton<ServiceRepository>(() => ServiceRepository());

  // ViewModels
  sl.registerFactory<ServiceViewModel>(() => ServiceViewModel(sl()));
}
