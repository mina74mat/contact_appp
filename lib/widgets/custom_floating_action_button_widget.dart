import 'package:flutter/material.dart';
import '../utils/app_colors.dart';


class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({
    required this.showDelete,
    required this.addContactFun,
    required this.deleteContactFun,
    super.key,
  });

  final bool showDelete;
  final Function addContactFun;
  final Function deleteContactFun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: showDelete,
          child: FloatingActionButton(
            onPressed: () {
              deleteContactFun();
            },
            tooltip: 'Delete',
            backgroundColor: AppColors.red,
            child: const Icon(
              Icons.delete_rounded,
              color: AppColors.white,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            addContactFun(context);
          },
          tooltip: 'Add Contact',
          backgroundColor: AppColors.white,
          child: const Icon(
            Icons.add,
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),
      ],
    );
  }
}
