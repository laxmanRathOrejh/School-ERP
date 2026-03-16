import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectExample extends StatefulWidget {
  
  const MultiSelectExample({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MultiSelectExampleState createState() => _MultiSelectExampleState();
}

class _MultiSelectExampleState extends State<MultiSelectExample> {
  // Step 1: Data list
  List<String> fruits = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Pineapple",
    "Grapes",
    "Papaya",
  ];

  // Step 2: Selected items
  List<String> selectedFruits = [];

  @override
  Widget build(BuildContext context) {
    // Step 3: Convert list to MultiSelectItem
    final items = fruits.map((fruit) => MultiSelectItem(fruit, fruit)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("MultiSelect Full Screen Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Step 4: Button to open dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MultiSelectDialog(
                      items: items,
                      title: Text("Select Fruits"),
                      initialValue: selectedFruits,
                      searchable: true, // Add search bar
                      onConfirm: (values) {
                        setState(() {
                          selectedFruits = values;
                        });
                      },
                      //   chipDisplay: MultiSelectChipDisplay.none(), // No chips in dialog
                    );
                  },
                );
              },
              child: Text("Select Fruits"),
            ),

            SizedBox(height: 20),

            // Step 5: Display selected fruits
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Selected Fruits:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),

            selectedFruits.isEmpty
                ? Text("None selected")
                : Wrap(
                    spacing: 10,
                    children: selectedFruits
                        .map(
                          (fruit) => Chip(
                            label: Text(fruit),
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
