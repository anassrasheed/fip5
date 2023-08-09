import 'package:fip5/tabs/tabs_screen.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../l10n/app_language.dart';
import '../utils/ui/custom_widget.dart';

class AboutUsTab extends StatefulWidget {
  const AboutUsTab({Key? key}) : super(key: key);

  @override
  State<AboutUsTab> createState() => _AboutUsTabState();
}

class _AboutUsTabState extends State<AboutUsTab> {
  bool _isChecked = false;
  bool _isChecked2 = false;
  int _selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    // return CustomWidget(color: Colors.green,title: "About us");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
      child: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: Text(S.of(context).navigate),
            onPressed: () {
              // controller.animateTo(2);
            },
          ),
          ListTile(
            title: Text(S.of(context).accept),
            leading: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: _isChecked,
                  onChanged: (v) {
                    setState(() {
                      _isChecked =
                          !_isChecked; // isChecked = true    false   true       isChcked=!isChecked
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: Colors.black, width: 2))),
            ),
          ),
          ListTile(
            title: Text(S.of(context).accept),
            leading: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                  value: _isChecked2,
                  onChanged: (v) {
                    setState(() {
                      _isChecked2 =
                          !_isChecked2; // isChecked = true    false   true       isChcked=!isChecked
                    });
                  },
                  activeColor: Colors.red,
                  checkColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: Colors.black, width: 2))),
            ),
          ),
          RadioListTile<int>(
              value: 1,
              title: Text(S.of(context).radio1),
              groupValue: _selectedRadio,
              onChanged: (v) {
                setState(() {
                  _selectedRadio = v!;
                });
              }),
          RadioListTile(
              value: 2,
              title: Text(S.of(context).radio2),
              groupValue: _selectedRadio,
              onChanged: (v) {
                setState(() {
                  _selectedRadio = v!;
                });
              }),
          RadioListTile(
              value: 3,
              title: Text(S.of(context).radio2),
              groupValue: _selectedRadio,
              activeColor: Colors.green,
              isThreeLine: true,
              subtitle: Text(S.of(context).subtitle),
              onChanged: (v) {
                setState(() {
                  _selectedRadio = v!;
                });
              }),
          ElevatedButton(
              onPressed: () {
                AppLanguage().changeLanguage('en');
              },
              child: Text(S.of(context).changeLanguage)),
          ElevatedButton(
              onPressed: () {
                AppLanguage().changeLanguage('ar');
              },
              child: Text(S.of(context).changeLanguage)),
          ElevatedButton(
              onPressed: () {
                AppLanguage().changeLanguage('fr');
              },
              child: Text(S.of(context).changeLanguage))
        ],
      )),
    );
  }
}
