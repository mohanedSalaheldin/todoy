import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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
Widget showMyDialog(context) => Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Center(
              child: Text(
            'Add new note',
          )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * .60,
            width: MediaQuery.of(context).size.width * .75,
            child: Form(
              key: _formKey,
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
                              // if (value == null) {

                              //   return '';

                              // }

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
          actions: [
            ElevatedButton(
              onPressed: () {},
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
                  print(taskController.text);

                  print(descriptionController.text);

                  print(tagController.text);

                  FirebaseHelper.addTask(
                    taskName: 'Add task',
                    taskDesc: 'This task #1 from vs code',
                    taskTag: 'Work',
                  );

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
