import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'core/router/go_router.dart';
import 'dependency_injection/service_locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  // czyścimy storage z DI, nie tworzymy nowej instancji!
  await GetIt.I<FlutterSecureStorage>().deleteAll();
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
