import 'package:flutter/material.dart';

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Şehir Seç",
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pop(context, _textController.text);
                })
          ],
        ),
      ),
    );
  }
}
