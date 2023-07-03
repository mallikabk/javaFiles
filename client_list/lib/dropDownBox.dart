import 'package:flutter/material.dart';

class DropDownFilter extends StatefulWidget {
  const DropDownFilter({super.key});

  @override
  State<DropDownFilter> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DropDownFilter> {
  String? states;

  List<String> dropDownList = [
    "Client Name",
    "TPA List",
    "Users",
    "Location",
    "Insurance company",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Flexible(
      child: Container(
        height: 40,
        width: screenWidth * 0.20,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            child: DropdownButton(
              value: states,
              onChanged: (value) => {},
              items: dropDownList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.arrow_drop_down),
              hint: Text('Filter By'),
            ),
          ),
        ),
      ),
    );
  }
}
