



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'main.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [


  ];
  return menuItems;
}

class DropdownItem extends StatefulWidget {


  DropdownItem({super.key});




  @override
  State createState() => _DropdownItemState();

}

class _DropdownItemState extends State<DropdownItem> {
  String selectedValue = "English";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(

        value: selectedValue,
        items: dropdownItems, onChanged: (String? newValue){
      setState(() {
        selectedValue = newValue!;
      });
    },
    );
  }
}