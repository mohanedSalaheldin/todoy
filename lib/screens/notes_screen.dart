import 'package:flutter/material.dart';
import 'package:todo_with_firebase_08oct/shered/components/components.dart';
import 'package:todo_with_firebase_08oct/shered/network/romote/firebase_helper.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          return ListView.separated(
            itemBuilder: (context, index) {
              var model = snapshot.data!.docs[index].data();
              return buildTask(
                context: context,
                taskDesc: model['taskDesc'],
                taskName: model['taskName'],
                tasktag: model['taskTag'],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
      //  buildTask(context: context),
    );
  }
}
