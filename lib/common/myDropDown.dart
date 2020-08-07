import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  MyDropDown({Key key, this.items}) : super(key: key);
  @required
  final List<String> items;
  @override
  _MyDropDown createState() => _MyDropDown(items);
}

class _MyDropDown extends State<MyDropDown> {
  _MyDropDown(this.items);
  String dropdownValue = '浅色';
  List<String> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 32,
      //elevation: 24,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
