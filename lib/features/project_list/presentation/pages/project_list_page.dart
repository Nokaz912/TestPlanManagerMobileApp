import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_state.dart';
import '../widgets/project_tile.dart';
import '../widgets/create_project_form.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  void initState() {
    super.initState();
    _dispatchLoadProjects();
  }

  void _dispatchLoadProjects() {
    BlocProvider.of<ProjectBloc>(context).add(GetAllProjectsEvent());
  }

  Future<void> _openCreateProjectForm() async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return BlocProvider.value(
          value: context.read<ProjectBloc>(),
          child: const CreateProjectForm(),
        );
      },
    );

    if (result == true && mounted) {
      _dispatchLoadProjects();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state.status == ProjectStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ProjectStatus.failure) {
            return const Center(child: Text('Failed to load projects'));
          }

          final projects = state.projects;

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => _dispatchLoadProjects(),
                  child: projects.isEmpty
                      ? const Center(child: Text('No projects found'))
                      : ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return ProjectTile(project: projects[index]);
                    },
                  ),
                ),
              ),

              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/execution');
                    },
                    child: const Text('Start Test Execution'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreateProjectForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
