import 'package:flutter/material.dart';

final List<String> items = [
  'Home',
  'School',
  'Workout',
  'Job',
];
Widget showMyDialog(context) => AlertDialog(
      title: const Center(
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
                icon: Icons.task_outlined,
              ),
              defaultTextform(
                label: 'Description',
                icon: Icons.article_outlined,
              ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.discount_outlined,
              //       size: 30.0,
              //     ),
              //     SizedBox(
              //       width: 15.0,
              //     ),
              //     DropdownMenu(
              //       inputDecorationTheme: InputDecorationTheme(),
              //       dropdownMenuEntries: [
              //         DropdownMenuEntry(
              //           label: 'School',
              //           value: 'School',
              //         ),
              //         DropdownMenuEntry(
              //           label: 'Job',
              //           value: 'Job',
              //         ),
              //         DropdownMenuEntry(
              //           label: 'Workout',
              //           value: 'Workout',
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.discount_outlined,
              //     ),
              //     SizedBox(
              //       width: 15.0,
              //     ),
              //     DropdownButtonFormField(
              //       value: items[0],
              //       items: items
              //           .map((String item) => DropdownMenuItem<String>(
              //                 value: item,
              //                 child: Text(
              //                   item,
              //                   style: const TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black,
              //                   ),
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ))
              //           .toList(),
              //       onChanged: (val) {},
              //     ),
              //   ],
              // ),

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
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          child: const Text(
            'Cancel',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
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
