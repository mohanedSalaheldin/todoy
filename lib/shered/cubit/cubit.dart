import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_08oct/screens/notes_screen.dart';
import 'package:todo_with_firebase_08oct/screens/tags_screen.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';

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
}
