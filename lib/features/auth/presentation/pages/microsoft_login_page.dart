import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/config/app_config.dart';
import '../../domain/repositories/auth_repository.dart';

class MicrosoftLoginPage extends StatefulWidget {
  const MicrosoftLoginPage({super.key});

  @override
  State<MicrosoftLoginPage> createState() => _MicrosoftLoginPageState();
}

class _MicrosoftLoginPageState extends State<MicrosoftLoginPage> {
  late final AuthRepository authRepository;
  late final WebViewController webController;

  String loginUrl = "";

  @override
  void initState() {
    super.initState();

    authRepository = GetIt.I<AuthRepository>();

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (req) {
            print("🔎 NAVIGATION: ${req.url}");

            final uri = Uri.parse(req.url);
            final redirect = Uri.parse(AuthConfig.redirectUri);

            final isRedirect =
                uri.scheme == redirect.scheme &&
                    uri.host == redirect.host &&
                    uri.path.startsWith(redirect.path);

            if (isRedirect) {
              final code = uri.queryParameters["code"];
              print("✅ REDIRECT DETECTED — CODE = $code");

              if (code != null) {
                Navigator.of(context).pop({"code": code});
              }

              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },

        ),
      );

    _loadLoginUrl();
  }

  Future<void> _loadLoginUrl() async {
    final url = await authRepository.createLoginUrl();
    setState(() => loginUrl = url);
    webController.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    if (loginUrl.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Logowanie Microsoft"),
      ),
      body: WebViewWidget(controller: webController),
    );
  }
}
