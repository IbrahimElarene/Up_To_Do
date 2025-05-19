
import 'package:sqflite/sqflite.dart';
import 'package:to_do_1/features/tasks/data/model/task_model.dart';

class SqfliteHelper{
  late Database db;
//1.create DB
//2.create table
//3.CRUD =>create- read - update-delete
// !  initDatabase
  void initDB()async{
    //step 1=> Create database
    await openDatabase('tasks.db',
      version: 1,
      onCreate: (Database db,int v)async{
        //step 2=>create table
        await db.execute('''
    CREATE TABLE Tasks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    notes TEXT,
    date TEXT,
    startTime TEXT,
    endTime TEXT,
    color INTEGER,
    isCompleted INTEGER
    )
    ''').then((value)=>print('DB created successfully'),
        );
      },onOpen: (db)=>print('Database opened'),

    ).then((value){db = value;}).catchError((e){print(e.toString());});

  }

  //! get
Future<List<Map<String,dynamic>>>getFromDB()async{
    return await db.rawQuery('SELECT * FROM Tasks');
  }
//! insert
Future<int> insertToDB(TaskModels model)async{
    return await db.rawInsert('''
    INSERT INTO Tasks(
    title,notes,date,startTime,endTime,color,isCompleted)
    VALUES
    ('${model.title}',
    '${model.note}',
    '${model.date}',
    '${model.startTime}',
    '${model.endTime}',
    '${model.color}',
    '${model.isCompleted}')
    ''');
}
//! update
Future<int> updatedDB(int id )async{
    return await db.rawUpdate('''
    UPDATE Tasks
    SET isCompleted = ?
    WHERE id = ?
    ''',[1,id]);
}
//! delete
Future<int> deleteFormDB(int id)async{
    return await db.rawDelete('''
    DELETE FROM Tasks WHERE id = ?
    ''',[id]);
}

}





// class SqfliteHelper {
//   Database? _db; // استبدل late بـ ? لتجنب LateInitializationError
//
//   Future<Database> get db async {
//     if (_db != null) return _db!;
//     _db = await initDB();
//     return _db!;
//   }
//
//   Future<Database> initDB() async {
//     return await openDatabase(
//       'tasks.db',
//       version: 1,
//       onCreate: (Database db, int v) async {
//         await db.execute('''
//           CREATE TABLE Tasks(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT,
//             notes TEXT,
//             date TEXT,
//             startTime TEXT,
//             endTime TEXT,
//             color INTEGER,
//             isCompleted INTEGER
//           )
//         ''');
//         print('DB created successfully');
//       },
//       onOpen: (db) => print('Database opened'),
//     );
//   }
//
//   // تعديل جميع الدوال لاستخدام await db بدلاً من db مباشرة
//   Future<List<Map<String,dynamic>>> getFromDB() async {
//     final database = await db;
//     return await database.query('Tasks');
//   }
//
//   Future<int> insertToDB(TaskModels model) async {
//     final database = await db;
//     return await database.insert(
//       'Tasks',
//       {
//         'title': model.title,
//         'notes': model.note,
//         'date': model.date,
//         'startTime': model.startTime,
//         'endTime': model.endTime,
//         'color': model.color,
//         'isCompleted': model.isCompleted,
//       },
//     );
//   }
// }