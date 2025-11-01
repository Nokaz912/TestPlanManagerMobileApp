import 'package:get_it/get_it.dart';

import '../database/daos/test_plans_dao.dart';
import '../database/data.dart';
import '../features/test_plan_list/data/repositories/test_plan_repository_impl.dart';
import '../features/test_plan_list/domain/repositories/test_plan_repository.dart';
import '../features/test_plan_list/domain/usecases/get_all_test_plans.dart';
import '../features/test_plan_list/presentation/bloc/test_plan_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Infra / DB
  final db = AppDatabase();
  sl.registerSingleton<AppDatabase>(db);
  sl.registerLazySingleton(() => TestPlansDao(db));

  // Data / Domain
  sl.registerLazySingleton<TestPlanRepository>(() => TestPlanRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllTestPlans(sl()));

  // Presentation
  sl.registerFactory(() => TestPlanBloc(sl()));
}
