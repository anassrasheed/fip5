import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputUi extends StatefulWidget {
  const InputUi({Key? key}) : super(key: key);

  @override
  State<InputUi> createState() => _InputUiState();
}

class _InputUiState extends State<InputUi> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isClicked = false;
  String? _userNameError;
  String? _passwordError;
  FocusNode _usernameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  final _onlyNumbersRegex = RegExp(r'^[a-zA-Z0-9]+$');
  bool isMoreThan3Chars = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            // readOnly: false,
            // enabled: true,
            cursorColor: Colors.red,
            focusNode: _usernameFocus,
            // cursorHeight: 50,
            // cursorWidth: 30,
            // cursorRadius: Radius.circular(30),
            style: const TextStyle(color: Colors.redAccent, fontSize: 16),
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(_onlyNumbersRegex),
              // regex
              // numbers letters X special charachters
            ],
            // textInputAction: TextInputAction.,
            // maxLines: 5,
            // minLines: 1,
            obscureText: false,
            // maxLength: 120,
            // buildCounter: (BuildContext context,
            //     {int? currentLength, int? maxLength, bool? isFocused}) {
            //   return Text(
            //     "$currentLength/$maxLength",
            //     style: TextStyle(color: Colors.red, fontSize: 30),
            //   ); // Custom counter widget
            // },
            buildCounter: null,
            showCursor: true,
            enableSuggestions: true,
            autocorrect: true,
            enabled: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.red, width: 5, strokeAlign: 5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.red, width: 5, strokeAlign: 5)),
              label: Text("Username"),
              hintText: "Username",
              // prefixIcon: Icon(Icons.add),
              suffixIcon: Icon(Icons.add),
              // prefix: Text("+962"),
              // suffix: Text("@zainCash"),
              prefixText: "asd",
              suffixText: "asd",
              isDense: true,
              fillColor: Colors.green,
              filled: false,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              errorText: _userNameError,
            ),
            onTap: () {
              print("TextField called");
            },
            onChanged: (v) {
              setState(() {
                if (_usernameController.text.length >= 3) {
                  isMoreThan3Chars = true;
                } else {
                  isMoreThan3Chars = false;
                }
              });
            },
            onSubmitted: (v) {
              print("On Submitted called");
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: isMoreThan3Chars ? Colors.green : Colors.grey,
                      shape: BoxShape.circle),
                  width: 15,
                  height: 15,
                ),
                SizedBox(width: 10),
                Text("At least 3 special charachters")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: isMoreThan3Chars ? Colors.green : Colors.grey,
                      shape: BoxShape.circle),
                  width: 15,
                  height: 15,
                ),
                SizedBox(width: 10),
                Text("At least 3 small chars")
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _passwordController,
            // readOnly: false,
            // enabled: true,
            cursorColor: Colors.red,
            focusNode: _passwordFocus,
            // cursorHeight: 50,
            // cursorWidth: 30,
            // cursorRadius: Radius.circular(30),
            style: const TextStyle(color: Colors.redAccent, fontSize: 16),
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.text,
            // textInputAction: TextInputAction.,
            // maxLines: 5,
            // minLines: 1,
            obscureText: false,
            // maxLength: 120,
            // buildCounter: (BuildContext context,
            //     {int? currentLength, int? maxLength, bool? isFocused}) {
            //   return Text(
            //     "$currentLength/$maxLength",
            //     style: TextStyle(color: Colors.red, fontSize: 30),
            //   ); // Custom counter widget
            // },
            buildCounter: null,
            showCursor: true,
            enableSuggestions: true,
            autocorrect: true,
            enabled: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.black, width: 5, strokeAlign: 5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.red, width: 5, strokeAlign: 5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.red, width: 5, strokeAlign: 5)),
              label: Text("password"),
              hintText: "password",
              // prefixIcon: Icon(Icons.add),
              suffixIcon: Icon(Icons.add),
              // prefix: Text("+962"),
              // suffix: Text("@zainCash"),
              prefixText: "asd",
              suffixText: "asd",
              isDense: true,
              fillColor: Colors.green,
              filled: false,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              errorText: _passwordError,
            ),
            onTap: () {
              print("TextField called");
            },
            onChanged: (v) {
              print(v);
            },
            onSubmitted: (v) {
              print("On Submitted called");
            },
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _userNameError = null;
                  _passwordError = null;
                });
                if (_usernameController.text.isEmpty) {
                  setState(() {
                    _userNameError = "Username is Required";
                    _usernameFocus.requestFocus();
                  });
                  return;
                } // validation
                if (_passwordController.text.isEmpty) {
                  setState(() {
                    _passwordError = "Password is Required";
                    _passwordFocus.requestFocus();
                  });
                  return;
                }
                if (_passwordController.text.length < 6) {
                  setState(() {
                    _passwordError = "Password it too short";
                    _passwordFocus.requestFocus();
                  });
                  return;
                }
                print(_usernameController.text);
                setState(() {
                  isClicked = true;
                });
              },
              child: Text("submit")),
          if (isClicked == true) Text(_usernameController.text),
        ],
      )),
    ));
  }
}
// validation
// TextFormField
// AutoComplete
// dropdown

// dui quiz
