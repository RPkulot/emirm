import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KeyNotes extends StatefulWidget {
  @override
  _KeyNotesState createState() => _KeyNotesState();
}

class _KeyNotesState extends State<KeyNotes> {
  TextEditingController _textController = TextEditingController();
  List<String> entries = [];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveEntry(String text) {
    if (text.isNotEmpty) {
      setState(() {
        entries.add("$text - ${DateTime.now().toString()}");
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: TextField(
                minLines: 3,
                maxLines: null,
                controller: _textController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something here',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: () {
            //     _saveEntry(_textController.text);
            //   },
            //   child: Text('Save'),
            // ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: entries.map((entry) {
                    return ListTile(
                      title: Text(entry),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: FloatingActionButton.extended(
          onPressed: () {
          _saveEntry(_textController.text);
        },icon: Icon(Icons.add),
         label: Text(' Save '),),
      )
    );
  }
}
