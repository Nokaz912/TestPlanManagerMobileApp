import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_event.dart';
import '../bloc/project_state.dart';
import '../widgets/project_tile.dart';

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

          if (projects.isEmpty) {
            return const Center(child: Text('No projects found'));
          }

          return RefreshIndicator(
            onRefresh: () async => _dispatchLoadProjects(),
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectTile(project: projects[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
