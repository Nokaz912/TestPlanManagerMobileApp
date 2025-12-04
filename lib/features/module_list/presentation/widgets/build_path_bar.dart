import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_plan_manager_app/core/UI/app_colors.dart';
import 'package:test_plan_manager_app/features/module_list/data/models/visited_module.dart';

import '../bloc/module_bloc.dart';
import '../bloc/module_event.dart';

Widget buildPathBar(
    BuildContext context,
    List<VisitedModule> visited,
    String projectId,
    ) {
  final bloc = context.read<ModuleBloc>();

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            bloc.add(const ModuleEvent.resetVisited());
            context.go('/modules/$projectId');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.home_rounded, size: 18, color: AppColors.warmBeige),
              SizedBox(width: 6),
              Text(
                "Root",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmBeige,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),

        ...List.generate(visited.length, (i) {
          final item = visited[i];
          final isClickable = i < visited.length - 1;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: Colors.white70,
                ),
              ),

              GestureDetector(
                onTap: isClickable
                    ? () {
                  final shortened = visited.sublist(0, i + 1);

                  bloc.add(const ModuleEvent.resetVisited());
                  for (final v in shortened) {
                    bloc.add(ModuleEvent.pushVisited(module: v));
                  }

                  context.go('/modules/$projectId/sub/${item.id}');
                }
                    : null,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontWeight: isClickable ? FontWeight.w600 : FontWeight.w700,
                    color: isClickable
                        ? AppColors.warmBeige.withOpacity(0.9)
                        : Colors.white,
                    decoration:
                    isClickable ? TextDecoration.underline : TextDecoration.none,
                    fontSize: 15,
                  ),
                  child: Text(item.name),
                ),
              ),
            ],
          );
        }),
      ],
    ),
  );
}
