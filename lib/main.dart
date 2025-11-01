import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:test_plan_manager_app/features/test_plan_list/presentation/pages/test_plan_list_page.dart';

import 'core/error/failures.dart';
import 'dependency_injection/service_locator.dart' as di;
import 'features/test_plan_list/domain/entities/test_plan.dart';
import 'features/test_plan_list/domain/usecases/get_all_test_plans.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Plan Manager',
      home: TestPlanListPage(),
    );
  }
}
