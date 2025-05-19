import 'package:flutter/material.dart';

import '../untils/app_strings.dart';
class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Image.asset('assets/images/notebook_11751913.png'),
      Text(AppStrings.noTaskTitle,style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 24),),
      Text(AppStrings.noTaskSubTitle,style: Theme.of(context).textTheme.displayMedium),

    ],
    );
  }
}
