import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/cubit.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';
import 'package:todo_with_firebase_08oct/shered/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Todoy'),
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
                  builder: (context) => showMyDialog(context),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

Widget showMyDialog(context) => AlertDialog(
      title: Center(
          child: Text(
        'Add new note',
      )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * .75,
        child: Form(
          child: Column(
            children: [
              defaultTextform(
                label: 'Task',
                icon: Icons.article_outlined,
              ),
              defaultTextform(
                label: 'Description',
                icon: Icons.description,
              ),
              defaultTextform(
                label: 'Tag',
                icon: Icons.discount_outlined,
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'cancel',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Save',
          ),
        ),
      ],
    );
Widget defaultTextform({
  required IconData icon,
  required String label,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        // maxLines: 1,
        // maxLength: 30,

        decoration: InputDecoration(
          icon: Icon(
            icon,
            size: 30.0,
          ),
          label: Text(label),
        ),
      ),
    );
