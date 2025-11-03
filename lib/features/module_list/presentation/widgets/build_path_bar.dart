import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/module_bloc.dart';
import '../bloc/module_state.dart';
import '../bloc/module_event.dart';

Widget buildPathBar(
    BuildContext context,
    ModuleState state,
    String projectId,
    ) {
  final visited = state.visitedModules;
  final bloc = context.read<ModuleBloc>();

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    color: Colors.grey.shade100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              bloc.add(const NavigateToModuleEvent(null));
              context.go('/modules/$projectId');
            },
            child: const Text(
              'Root',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          if (visited.isNotEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child:
              Icon(Icons.chevron_right, size: 16, color: Colors.black54),
            ),
          for (int i = 0; i < visited.length; i++) ...[
            InkWell(
              onTap: i < visited.length - 1
                  ? () {
                final targetId = visited[i];
                bloc.add(NavigateToModuleEvent(targetId));
                context.go('/modules/$projectId/sub/$targetId');
              }
                  : null,
              child: Text(
                visited[i],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                  i < visited.length - 1 ? Colors.blue : Colors.black87,
                  decoration: i < visited.length - 1
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
            if (i < visited.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.chevron_right,
                    size: 16, color: Colors.black54),
              ),
          ],
        ],
      ),
    ),
  );
}
