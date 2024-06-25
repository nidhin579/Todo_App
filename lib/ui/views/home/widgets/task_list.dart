import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/views/home/widgets/widgets.dart';

class TaskList extends ViewModelWidget<HomeViewModel> {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return StreamBuilder(
      stream: viewModel.taskReference.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if ((snapshot.data?.docs.length ?? 0) < 1) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeightFraction(context, dividedBy: 4),
                child: const RiveAnimation.asset(
                    'assets/animations/sleepingball.riv'),
              ),
              Text(
                'No tasks here!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          );
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data?.docs.length ?? 0,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            final data = TaskEntity.fromFirestore(snapshot.data?.docs[index]);
            return TaskCard(
              key: ValueKey(data.id),
              task: data,
            );
          },
        );
      },
    );
  }
}
