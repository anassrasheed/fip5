import 'package:flutter/material.dart';

class InputUi extends StatefulWidget {
  const InputUi({Key? key}) : super(key: key);

  @override
  State<InputUi> createState() => _InputUiState();
}

class _InputUiState extends State<InputUi> {
  TextEditingController _batataController = TextEditingController();
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _batataController,
            // readOnly: false,
            // enabled: true,
            cursorColor: Colors.red,
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
                      color: Colors.grey, width: 5, strokeAlign: 5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.red, width: 5, strokeAlign: 5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.blue, width: 5, strokeAlign: 5)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Colors.blue, width: 5, strokeAlign: 5)),
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
              errorText: "sdasd",
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
                print(_batataController.text);
                setState(() {
                  isClicked=true;
                });
              },
              child: Text("submit")),
          if(isClicked == true)
            Text(_batataController.text),
        ],
      )),
    ));
  }
}
 // validation
 // TextFormField
 // AutoComplete
 // dropdown