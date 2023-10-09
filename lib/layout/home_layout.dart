import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/cubit.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Todoy'),
              centerTitle: true,
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomAppBar(
              color: Colors.amber,
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAlias,
              notchMargin: 5.0,
              height: kBottomNavigationBarHeight,
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,

                onTap: (value) {
                  cubit.changeBottonNavBarItem(value);
                },
                items: const [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.note_add,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.note_add,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
              
            ),
          );
        },
      ),
    );
  }
}