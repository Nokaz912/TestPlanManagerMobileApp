import 'package:flutter/material.dart';
import 'core/router/go_router.dart';
import 'dependency_injection/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Plan Manager',
      routerConfig: router,
    );
  }
}
