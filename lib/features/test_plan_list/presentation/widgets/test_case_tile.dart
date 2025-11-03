import 'package:flutter/material.dart';

import '../../domain/entities/test_case.dart';

class TestCaseTile extends StatelessWidget {
  final TestCaseEntity testCase;

  const TestCaseTile({super.key, required this.testCase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0),
      child: ListTile(
        leading: const Icon(Icons.bug_report),
        title: Text(testCase.title),
        subtitle: Text('Status: ${testCase.status}'),
      ),
    );
  }
}
