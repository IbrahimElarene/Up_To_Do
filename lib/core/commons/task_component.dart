import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/tasks/data/model/task_model.dart';
import '../untils/app_colors.dart';
import '../untils/app_strings.dart';
class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key,  required this.taskModels});
  final TaskModels taskModels;
  Color getColor(index){
    switch(index){
      case 0:return AppsColors.red;
      case 1:return AppsColors.green;
      case 2:return AppsColors.blueGrey;
      case 3:return AppsColors.blue;
      case 4:return AppsColors.orange;
      case 5:return AppsColors.purple;
      default :return AppsColors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132.h,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: getColor(taskModels.color),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom:16 ),
      child: Row(children: [
        //colum
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskModels.title,style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.timer,color: AppsColors.white,),
                  SizedBox(width: 8.w,),
                  Text("${taskModels.startTime} - ${taskModels.endTime}",style: Theme.of(context).textTheme.displayMedium,)],),
              SizedBox(height: 8.h,),
              Text(taskModels.note,style: Theme.of(context).textTheme.displayLarge,),
            ],
          ),
        ),
        //divider
        VerticalDivider(color: AppsColors.white,thickness: 2,endIndent: 6,indent: 6,),
        SizedBox(width: 5.w,),
        //text
        RotatedBox(quarterTurns: 3,child: Text(taskModels.isCompleted==1?AppStrings.completed:AppStrings.toDO,style:Theme.of(context).textTheme.displayMedium ,)),

      ],),

    );
  }
}
