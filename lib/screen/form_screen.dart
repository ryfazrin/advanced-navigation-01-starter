import 'package:declarative_navigation/routes/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  final Function onSend;
  
  const FormScreen({super.key, required this.onSend});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _textController.text;
                widget.onSend();
                context.read<PageManager>().returnData(name);
              }, 
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}