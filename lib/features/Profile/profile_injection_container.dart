import 'package:get_it/get_it.dart';
import 'package:kid_need_pishrun_event_02/common/utils.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/use_cases/profile_main.dart';
import 'presentation/manager/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => ProfileCubit(profileMain: sl()));

  // Use cases
  sl.registerLazySingleton(() => ProfileMain(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(dataSource: sl()));
}
