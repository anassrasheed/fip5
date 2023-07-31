import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:fip5/packages/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FieldsScreen extends StatefulWidget {
  const FieldsScreen({Key? key}) : super(key: key);

  @override
  State<FieldsScreen> createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  static const List<String> _options = <String>[
    'Hamzah',
    'Anas',
    'Omar',
    'Motasem',
    'Moahmmed',
    'Suhaib',
    'Ahmad',
  ];
  String _selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue value) {
                  if (value.text.isEmpty) {
                    return _options;
                  }
                  return _options
                      .where((element) => element
                          .toLowerCase()
                          .contains(value.text.toLowerCase()))
                      .toList();
                },
                onSelected: (v) {
                  print(v);
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return const Text("anas");
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                        onFieldSubmitted) =>
                    TextFormField(),
              )),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Autocomplete<String>(
          //     optionsBuilder: (TextEditingValue textEditingValue) {
          //       if (textEditingValue.text.isEmpty) {
          //         return const Iterable<String>.empty();
          //       }
          //       return _options.where((String option) {
          //         return option.toLowerCase().contains(
          //             textEditingValue.text.toLowerCase());
          //       });
          //     },
          //     onSelected: (String selection) {
          //       debugPrint('You just selected $selection');
          //     },
          //   ),
          // ),
          CustomSearchableDropDown(
            items: _options,
            label: 'Select Employee',
            menuMode: true,
            menuHeight: 200,
            hideSearch: false,
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(Icons.search),
            ),
            dropDownMenuItems: _options.map((item) {
                  return item;
                }).toList() ??
                [],
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
              // if (value != null) {
              //   selected = value['class'].toString();
              // } else {
              //   selected = null;
              // }
            },
            multiSelect: false,
          ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.add),
                  const Icon(Icons.add),
                  const Icon(Icons.add),
                  const Icon(Icons.add),
                ],
              ),
            ),
          ),

          ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Proceed with destructive action?'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        /// This parameter indicates this action is the default,
                        /// and turns the action's text to bold text.
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        /// This parameter indicates the action would perform
                        /// a destructive action such as deletion, and turns
                        /// the action's text color to red.
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
                // alert dialog
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: const Text("Warning"),
                //         content: Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             const Text("Are you sure you want to logout?"),
                //             const Text("Are you sure you want to logout?"),
                //             const Text("Are you sure you want to logout?"),
                //             const Text("Are you sure you want to logout?"),
                //             const Icon(Icons.add)
                //           ],
                //         ),
                //         actions: [
                //           // hide
                //           TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //               child: const Text("Cancel")),
                //           TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //               child: const Text("Submit")),
                //         ],
                //         shadowColor: Colors.black,
                //         elevation: 20,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(12)),
                //         backgroundColor: Colors.white,
                //         scrollable: true,
                //         icon:
                //             const Icon(Icons.abc), // ctrl space, command space
                //       );
                //     });
              },
              child: const Text("Show Dialog")),

          ElevatedButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.music_note),
                                title: const Text("Play Music"),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                selected: false,
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text("View Photos"),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ]);
                      });
                } else {
                  showAdaptiveActionSheet(
                    // alt + enter
                    context: context,
                    title: const Text('Title'),
                    androidBorderRadius: 30,
                    actions: <BottomSheetAction>[
                      BottomSheetAction(
                          title: const Text('Item 1'),
                          onPressed: (context) {},
                          leading: Icon(Icons.accessibility),
                          trailing: Icon(Icons.ac_unit_rounded)),
                      BottomSheetAction(
                          title: const Text('Item 2'), onPressed: (context) {}),
                      BottomSheetAction(
                          title: const Text('Item 3'), onPressed: (context) {}),
                    ],
                    cancelAction: CancelAction(
                        title: const Text(
                            'Cancel')), // onPressed parameter is optional by default will dismiss the ActionSheet
                  );
                }
              },
              child: const Text("show Bottom sheet"))
        ],
      )),
    ));
  }
}
