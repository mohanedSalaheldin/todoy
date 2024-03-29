import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_with_firebase_08oct/models/task_model.dart';
import 'package:todo_with_firebase_08oct/shered/components/components.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/cubit.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/states.dart';
import 'package:todo_with_firebase_08oct/shered/network/romote/firebase_helper.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        if (state is UpdateTaskSuccessState) {
          Fluttertoast.showToast(msg: 'Task updated successfuly');
        }
        if (state is UpdateTaskSuccessState) {
          Fluttertoast.showToast(msg: 'Task update failed');
        }
        if (state is DeleteTaskSuccessState) {
          Fluttertoast.showToast(msg: 'Task  deleted successfuly');
        }
        if (state is DeleteTaskSuccessState) {
          Fluttertoast.showToast(msg: 'Task delet failed');
        }
      },
      builder: (context, state) => Center(
        child: StreamBuilder(
          stream: FirebaseHelper.getTasks(),
          builder: (context, snapshot) {
            // if (snapshot.hasError) {
            // return const Center(
            //   child: Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
            // );
            // }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Icon(
                  Icons.signal_wifi_connected_no_internet_4_outlined,
                  size: 30.0,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var model =
                      TaskModel.fromJson(snapshot.data!.docs[index].data());
                  return buildTask(
                    context: context,
                    model: model,
                    // taskDesc: model.taskDesc!,
                    // taskName: model.taskName,
                    // tasktag: model.,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          },
        ),
        //  buildTask(context: context),
      ),
    );
  }
}
