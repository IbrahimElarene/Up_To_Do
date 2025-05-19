
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_1/core/database/cache/cache_helper.dart';
import 'package:to_do_1/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_1/features/auth/presentation/cubit/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/services/service_locator.dart';
import '../../../../core/untils/app_colors.dart';
import '../../../tasks/data/model/task_model.dart';
class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  DateTime currentDate=DateTime.now();
  DateTime selectedDate=DateTime.now();
  String startTime=DateFormat('hh:mm a').format(DateTime.now());
  String endTime=DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 45)));
  int currentIndex=0;
  TextEditingController titleController= TextEditingController();

  TextEditingController noteController= TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  void getDate(context)async{
    emit(GetDateLoadingState());
    DateTime? pickedData=await showDatePicker(context: context,initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2028),
        initialDatePickerMode: DatePickerMode.day
    );

      if(pickedData !=null){
        currentDate=pickedData;
        emit(GetDateSucessState());
      }
      else{
        print("pickedDate==null");
        emit(GetDateErrorState());
      }

  }
  void getStart(context)async{
    emit(GetStartLoadingState());
    TimeOfDay? pickedStartTime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()));

      if(pickedStartTime !=null){
        emit(GetStartSucessState());
        startTime=pickedStartTime.format(context);

      }
      else{
        emit(GetStartErrorState());
        print("pickedStartTime==null");
      }

  }
  void getEnd(context)async{
    emit(GetEndLoadingState());
    TimeOfDay? pickedEndTime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()));

      if(pickedEndTime !=null){
        emit(GetEndSucessState());
        endTime=pickedEndTime.format(context);

      }
      else{
        emit(GetEndErrorState());
        print("pickedStartTime==null");
      }

  }
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
  void ChangeCheckMarkIndex(index){
    emit(ChangeCheckMarkIndexState());
    currentIndex=index;
  }
  void getSelectedDate(date){
    emit(GetSelectedDateLoadingState());
    selectedDate=date;

    emit(GetSelectedDateSucessState());
    getTasks();
  }

  List<TaskModels> tasksList=[
    // TaskModels(id: "1", title: "Flutter", note: "Learn Dart", startTime: "09:33 PM", endTime: "09:48 PM", isComleted: false, color: 2, date: '5/5/2025'),
    // TaskModels(id: "2", title: "Java", note: "Learn Java", startTime: "09:33 PM", endTime: "09:48 PM", isComleted: true, color: 3, date: '5/5/2025'),
  ];
  Future<void> insertTask() async {
    emit(InsertTaskLoadingState());

    try{
      await sl<SqfliteHelper>().insertToDB(
          TaskModels(
              date: DateFormat.yMd().format(currentDate),
              title: titleController.text,
              note: noteController.text,
              startTime: startTime,
              endTime: endTime,
              isCompleted: 0,
              color: currentIndex));
      getTasks();
      //! to make screen wait 1 second
      // await Future.delayed(Duration(seconds: 3));
      // tasksList.add(
      //     TaskModels(
      //         date: DateFormat.yMd().format(currentDate),
      //         id: '1',
      //         title: titleController.text,
      //         note: noteController.text,
      //         startTime: startTime,
      //         endTime: endTime,
      //         isComleted: false,
      //         color: currentIndex));
      titleController.clear();
      noteController.clear();
      emit(InsertTaskSucessStateState());
    }
        catch(e){
      emit(InsertTaskErrorState());
        }
  }
//! get Tasks
  void getTasks()async{
    emit(GetTaskLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value){
      tasksList=value.map((e)=>TaskModels.fromJson(e)).toList().where((element)=>element.date==DateFormat.yMd().format(selectedDate),).toList();
      emit(GetTaskSucessStateState());
    }).catchError((e){
      print(e.toString());
      emit(GetTaskErrorState());
    });
  }
  //! update Task
void updateTask(id)async{
    emit(UpdateTaskLoadingState());
    await sl<SqfliteHelper>().updatedDB(id).then((value){
      emit(UpdateTaskSucessStateState());
      getTasks();
    }).catchError((e){
      print(e.toString());
      emit(UpdateTaskErrorState());
    });
}
void deleteTask(id)async{
    emit(DeleteTaskLoadingState());
    await sl<SqfliteHelper>().deleteFormDB(id).then((value){
      emit(DeleteTaskSucessStateState());
      getTasks();
    }).catchError((e){
      print(e.toString());
      emit(DeleteTaskErrorState());
    });

}
bool isDark =false;
void changeTheme(){
isDark = !isDark;
 CacheHelper.saveData(key:'isDark',value:isDark);
emit(ChangeThemeState());
}
void getTheme()async{
  isDark =await CacheHelper.getData(key:'isDark');
  emit(GetThemeState());
}

}
