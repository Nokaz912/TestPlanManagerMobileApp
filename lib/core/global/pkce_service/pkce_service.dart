import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class PkcePair {
  final String verifier;
  final String challenge;

  PkcePair({required this.verifier, required this.challenge});
}

class PkceService {
  PkcePair generate() {
    final verifier = _randomBase64(64);
    final hash = sha256.convert(utf8.encode(verifier));
    final challenge = base64UrlEncode(hash.bytes).replaceAll("=", "");
    return PkcePair(verifier: verifier, challenge: challenge);
  }

  String _randomBase64(int length) {
    final rand = Random.secure();
    final bytes = List<int>.generate(length, (_) => rand.nextInt(256));
    return base64UrlEncode(bytes).replaceAll('=', '');
  }
}
