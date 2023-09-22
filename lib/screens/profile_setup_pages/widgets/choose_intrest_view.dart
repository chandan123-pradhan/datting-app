// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ChooseIntrestView extends StatefulWidget {
  const ChooseIntrestView({super.key});

  @override
  _ChooseIntrestViewState createState() =>
      _ChooseIntrestViewState();
}

class _ChooseIntrestViewState extends State<ChooseIntrestView> {
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4','Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<bool> selected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: options.asMap().entries.map((entry) {
        int index = entry.key;
        String option = entry.value;

        return GestureDetector(
          onTap: () {
            setState(() {
              selected[index] = !selected[index];
            });
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: selected[index] ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
