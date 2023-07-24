import 'package:fip5/packages/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.all(20),
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
                  return Text("anas");
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
            prefixIcon: Padding(
              padding: const EdgeInsets.all(0.0),
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
                children: [
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                  Icon(Icons.add),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
