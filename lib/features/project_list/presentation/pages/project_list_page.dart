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
    _loadProjects();
  }

  void _loadProjects() {
    context.read<ProjectBloc>().add(const ProjectEvent.getAll());
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
      _loadProjects();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.06),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Projects',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),

          // LEADING: powrót
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => context.pop(),
          ),

          actions: [
            /// ▶ START TEST EXECUTION
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => context.go('/execution'),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),

            /// ➕ ADD PROJECT
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: _openCreateProjectForm,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amberAccent.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),
          ],

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
          ),
        ),

        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return state.when(
              initial: _renderInitial,
              loading: _renderLoading,
              failure: _renderFailure,
              success: (projects) => _renderSuccess(context, projects),
            );
          },
        ),
      ),
    );
  }

  Widget _renderInitial() {
    return const Center(
      child: Text('Loading...'),
    );
  }

  Widget _renderLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _renderFailure(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 48.0, color: Colors.red),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton.icon(
              onPressed: _loadProjects,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderSuccess(BuildContext context, List projects) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => _loadProjects(),
            child: projects.isEmpty
                ? const Center(
              child: Text(
                'No projects found',
                style: TextStyle(fontSize: 16.0),
              ),
            )
                : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectTile(project: projects[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
