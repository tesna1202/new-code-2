
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

class Homescreen extends StatefulWidget {

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  String response = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Input Value'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                    controller: _textEditingController,
                    onChanged: (value) {},
                    decoration:
                    const InputDecoration(
                        hintText: 'Enter the text',
                      border: OutlineInputBorder()
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
                    if (kDebugMode) {
                      print(_formKey.currentState!.validate());
                    }
                    if (_formKey.currentState!.validate()) {
                      try {
                        final CurrentResponse = await WidgetbookApi().
                        welcomeToWidgetbook(
                            message: _textEditingController.text,);

                        setState(() {
                          response = CurrentResponse;
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
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(response),
              ],),
          ),
        ),
      ),
    );
  }
}
