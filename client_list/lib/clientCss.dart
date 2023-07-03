import 'package:flutter/material.dart';

class ClientCss extends StatefulWidget {
  const ClientCss({super.key});

  @override
  State<ClientCss> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ClientCss> {
  PopupMenuItem<String> popUpInfo(String txt) {
    return PopupMenuItem<String>(
      value: txt,
      child: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
