import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_08oct/shered/components/components.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/cubit.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todoy'),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomAppBar(
            color: Colors.amber,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 5.0,
            // height: kBottomNavigationBarHeight,
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottonNavBarItem(value);
              },
              items: const [
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.article_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.discount_outlined,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddTaskDialog(context: context),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
