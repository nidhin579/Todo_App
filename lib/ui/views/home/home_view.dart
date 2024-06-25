import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/home/widgets/widgets.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.canvasColor,
      ),
      body: const HomeViewBody(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class HomeViewBody extends ViewModelWidget<HomeViewModel> {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            verticalSpaceMedium,
            AddTaskButton(
              onTap: viewModel.showAddTaskSheet,
            ),
            verticalSpaceMedium,
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('tasks').snapshots(),
                builder: (context, snapshot) {
                  if ((snapshot.data?.docs.length ?? 0) < 1) {
                    return const Center(
                      child: Text(
                        'No tasks',
                      ),
                    );
                  }
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.docs.length ?? 0,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      final data =
                          TaskEntity.fromFirestore(snapshot.data?.docs[index]);
                      return TaskCard(
                        key: ValueKey(data.id),
                        task: data,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
