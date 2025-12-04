import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'core/UI/app_theme.dart';
import 'core/UI/app_scaffold.dart';
import 'core/router/go_router.dart';
import 'dependency_injection/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await GetIt.I<FlutterSecureStorage>().deleteAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Plan Manager',
      theme: AppTheme.theme,
      routerConfig: router,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        return AppScaffold(child: child);
      },
    );
  }
}
