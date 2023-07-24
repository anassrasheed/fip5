import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldsExample extends StatefulWidget {
  const TextFieldsExample({Key? key}) : super(key: key);

  @override
  State<TextFieldsExample> createState() => _TextFieldsExampleState();
}

class _TextFieldsExampleState extends State<TextFieldsExample> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              validator: (String? value) {
                if (value == null || value.isEmpty)
                  return "Username is Required";
                return null;
              },
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  border: _buildOutlineInputBorder(),
                  enabledBorder: _buildOutlineInputBorder(),
                  focusedBorder: _buildOutlineInputBorder(),
                  disabledBorder: _buildOutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty)
                  return "This Field is Required";
                if (!value.contains("@")) return "this email is invalid";
                return null;
              },
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (v) {
                print(v);
              },
              decoration: InputDecoration(
                  border: _buildOutlineInputBorder(),
                  enabledBorder: _buildOutlineInputBorder(),
                  focusedBorder: _buildOutlineInputBorder(),
                  disabledBorder: _buildOutlineInputBorder(),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.green)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // validation
                  // String? v; // null
                  // if (v!.isEmpty) {
                  //   // error
                  //   print("Empty");
                  // }
                  // if (v!.isEmpty || v == null) {
                  //   // error
                  //   print("Empty or null");
                  // }
                  // if (v == null || v.isEmpty) {
                  //   print("Empty");
                  // }
                  if (_key.currentState!.validate()) {
                    print("Success");
                  }
                },
                child: Text("Submit")),
          ],
        ),
      )),
    ));
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(12));
  }
}
