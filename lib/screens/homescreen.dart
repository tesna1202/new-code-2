
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';


class Homescreen extends StatefulWidget {

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  String response = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Input value"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  controller: _textEditingController,
                  onChanged: (value) {},
                  decoration:
                  const InputDecoration(
                      hintText: 'Enter the text'
                  ),
                  validator: (value) {
              if(int.tryParse(value!)!=null){

              return 'Numbers not accepted';
              }
              },
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  print(_formKey.currentState!.validate());
                  if (_formKey.currentState!.validate()) {
                    try {
                      final currentresponse = await WidgetbookApi().
                      welcomeToWidgetbook(message: _textEditingController.text);

                      setState(() {
                        response = currentresponse;
                      });
                    }catch (e) {
                      setState(() {
                        response = 'Error occurred';
                      });
                    }
                  }

                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Text(response),
            ],),
        ),
      ),
    );
  }
}
