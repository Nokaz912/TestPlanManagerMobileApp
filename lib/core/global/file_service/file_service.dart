import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../features/test_execution/domain/entities/project_structure.dart';

class FileService {
  FileService();

  Future<String> saveExecutionStatusToTxt(
      List<StepStatusPathEntity> steps,
      ) async {
    if (steps.isEmpty) {
      throw Exception("Brak danych do zapisania");
    }

    // 🔥 Pobierz sandboxowy katalog dokumentów aplikacji
    final Directory appDir = await getApplicationDocumentsDirectory();

    // 🔥 Folder docelowy → .../test_executions/
    final exportDir = Directory(
      p.join(appDir.path, "test_executions"),
    );

    if (!exportDir.existsSync()) {
      exportDir.createSync(recursive: true);
    }

    // Nazwa pliku
    final fileName =
        "execution_status_${DateTime.now().millisecondsSinceEpoch}.txt";

    final file = File(p.join(exportDir.path, fileName));

    final buffer = StringBuffer();

    for (final s in steps) {
      buffer.writeln("[${s.timestamp.toIso8601String()}]");
      buffer.writeln("Project: ${s.projectId}");
      buffer.writeln("Module: ${s.moduleId}");
      buffer.writeln("Plan: ${s.planId}");
      buffer.writeln("Case: ${s.caseId}");
      buffer.writeln("Step: ${s.stepId}");
      buffer.writeln("Status: ${s.newStatus}");
      buffer.writeln("------------------------------------");
    }

    await file.writeAsString(buffer.toString(), flush: true);

    return file.path;
  }
}
