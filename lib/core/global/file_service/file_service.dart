import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../features/test_execution/domain/entities/project_structure.dart';

class FileService {
  FileService();

  Future<String> saveExecutionStatusToJson(
      List<StepStatusPathEntity> steps,
      ) async {
    if (steps.isEmpty) {
      throw Exception("Brak danych do zapisania");
    }

    final Directory appDir = await getApplicationDocumentsDirectory();

    final exportDir = Directory(
      p.join(appDir.path, "test_executions"),
    );

    if (!exportDir.existsSync()) {
      exportDir.createSync(recursive: true);
    }

    final fileName =
        "execution_status_${DateTime.now().millisecondsSinceEpoch}.json";

    final file = File(p.join(exportDir.path, fileName));

    final jsonMap = {
      "exported_at": DateTime.now().toIso8601String(),
      "steps": steps.map((s) {
        return {
          "timestamp": s.timestamp.toIso8601String(),
          "projectId": s.projectId,
          "moduleId": s.moduleId,
          "planId": s.planId,
          "caseId": s.caseId,
          "stepId": s.stepId,
          "status": s.newStatus,
        };
      }).toList(),
    };

    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(jsonMap),
      flush: true,
    );

    return file.path;
  }
}
