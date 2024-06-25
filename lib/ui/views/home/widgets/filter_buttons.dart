import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/views/home/home_viewmodel.dart';

class FilterButtons extends ViewModelWidget<HomeViewModel> {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    String filterName(FilterType taskStatus) {
      switch (taskStatus) {
        case FilterType.todo:
          return 'To Do';
        case FilterType.inProgress:
          return 'In Progress';
        case FilterType.done:
          return 'Done';
        case FilterType.all:
          return 'All';
      }
    }

    return Row(
      children: List.generate(FilterType.values.length, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            child: InkWell(
              onTap: () => viewModel.changeFilter(FilterType.values[index]),
              borderRadius: BorderRadius.circular(4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: FilterType.values[index] == viewModel.filter
                      ? Colors.blue.withOpacity(0.5)
                      : null,
                  borderRadius: BorderRadius.circular(4),
                  border: const Border(
                    bottom: BorderSide(width: 2),
                    left: BorderSide(),
                    right: BorderSide(),
                    top: BorderSide(),
                  ),
                ),
                child: Text(
                  filterName(FilterType.values[index]),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
