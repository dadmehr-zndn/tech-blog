import 'package:flutter/material.dart';
import 'package:tech_blog/second_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  //todo: I am practicing navigation and data passing

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              obscureText: true,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
                label: const Text('Password'),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(_textController.text),
                  )),
              child: const Text('Submit'),
            )

            //todo: uncomment
            // Text('Main Screen'),
          ],
        ),
      )),
    );
  }
}
