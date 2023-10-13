import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_08oct/models/task_model.dart';
import 'package:todo_with_firebase_08oct/screens/notes_screen.dart';
import 'package:todo_with_firebase_08oct/screens/tags_screen.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';
import 'package:todo_with_firebase_08oct/shered/network/romote/firebase_helper.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);
  List screens = [
    const NotesScreen(),
    const TagsScreen(),
  ];
  int currentIndex = 0;
  void changeBottonNavBarItem(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  TaskModel? taskModel;
  void setModel(model) {
    taskModel = model;
    print(taskModel!.toJson());
  }

  void editThisTask({
    required taskName,
    required taskTag,
    required taskDesc,
    required taskId,
  }) {
    FirebaseHelper.updateTask(
      model: TaskModel(
        taskName: taskName,
        taskDesc: taskDesc,
        taskTag: taskTag,
        taskId: taskId,
      ),
    ).then((value) {
      print('Added done');
      emit(UpdateTaskSuccessState());
    }).catchError((error) {
      print('Added failed');
      emit(UpdateTaskErrorState());
    });
  }
}
