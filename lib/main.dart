import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  final url = "https://webapp.smartfield.homolog.solvian.com";

  final chromeSafariBrowser = new ChromeSafariBrowser(new InAppBrowser());


  @override
  Widget build(BuildContext context) {

    chromeSafariBrowser.open(url, options: {
      "showTitle": false,
      "enableUrlBarHiding":true,
      "instantAppsEnabled":true
    });

    return MaterialApp(
      home: Container(
        color: Colors.black,
      ),
    );
  }
}
