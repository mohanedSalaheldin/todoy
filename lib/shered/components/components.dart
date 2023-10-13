import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_with_firebase_08oct/models/task_model.dart';
import 'package:todo_with_firebase_08oct/screens/update_task_screen.dart';
import 'package:todo_with_firebase_08oct/shered/cubit/cubit.dart';
import 'package:todo_with_firebase_08oct/shered/network/romote/firebase_helper.dart';

final List<String> items = [
  'Home',
  'School',
  'Workout',
  'Job',
];
final _formKey = GlobalKey<FormState>();
String selectedValue = '';
var taskController = TextEditingController();
var descriptionController = TextEditingController();
var tagController = TextEditingController();

Widget AddTaskDialog({
  required context,
}) =>
    Builder(
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: const Center(
                child: Text(
                  'Add Task',
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .60,
                width: MediaQuery.of(context).size.width * .75,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        defaultTextform(
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Task name can\'t be empty';
                            }

                            return null;
                          },
                          controller: taskController,
                          label: 'Task',
                          icon: Icons.task_outlined,
                        ),
                        defaultTextform(
                          validation: (p0) {
                            return null;
                          },
                          controller: descriptionController,
                          label: 'Description',
                          icon: Icons.article_outlined,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.discount_outlined,
                                size: 30.0,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: DropdownButtonFormField2<String>(
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsetsDirectional.symmetric(
                                      horizontal: 20,
                                      vertical: 32,
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),

                                    // Add more decoration..
                                  ),
                                  hint: const Text(
                                    'Tag',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  validator: (value) {
                                    return null;
                                  },
                                  onChanged: (value) {
                                    tagController.text = value!;

                                    //Do something when selected item is changed.
                                  },
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                  buttonStyleData: const ButtonStyleData(

                                      // padding: EdgeInsets.only(right: 8),

                                      ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 24,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2,
                                      vertical: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: const Text(
                    'Cancel',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseHelper.addTask(
                        taskName: taskController.text,
                        taskDesc: descriptionController.text,
                        taskTag: tagController.text,
                      ).then((value) {
                        Fluttertoast.showToast(msg: 'Task added successfuly');
                      });

                      taskController.text = '';

                      descriptionController.text = '';

                      tagController.text = '';

                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
Widget removeTaskDialog(context, taskId) => Center(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        title: const Text('Delete?'),
        actions: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey[200],
                    ),
                  ),
                  onPressed: () {
                    TodoCubit.get(context).deleteTask(taskId: taskId);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .50,
          child: const Text('Are you sure?'),
        ),
      ),
    );
Widget defaultTextform({
  required IconData icon,
  required String label,
  required controller,
  required String? Function(String?)? validation,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextFormField(
        validator: validation,
        controller: controller,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            size: 30.0,
          ),
          label: Text(label),
        ),
      ),
    );
Widget defaultUpdateTextform({
  required IconData icon,
  required String label,
  required controller,
  required String? Function(String?)? validation,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: TextFormField(
        validator: validation,
        controller: controller,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            size: 30.0,
          ),
          label: Text(label),
        ),
      ),
    );

Widget buildTask({
  required context,

  // required taskName,
  required TaskModel model,
  // required String taskDesc,
  // required tasktag,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * .169,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15.0,
              color: Colors.black12,
              offset: Offset(0, 5),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: chooseTaskColor(model.taskTag!),
                radius: 10.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.taskName!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        model.taskDesc!,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          '#${model.taskTag!}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: chooseTaskColor(model.taskTag!),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<int>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onSelected: (item) {
                  if (item == 0) {
                    // print(model.toJson());
                    TodoCubit.get(context).setModel(model);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateScreen(),
                      ),
                    );
                  }
                  if (item == 1) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          removeTaskDialog(context, model.taskId),
                    );
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Color? chooseTaskColor(String tag) {
  if (tag == 'Home') {
    return Colors.blue;
  } else if (tag == 'School') {
    return Colors.green;
  } else if (tag == 'Workout') {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
