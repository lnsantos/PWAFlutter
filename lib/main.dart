import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  final url = "https://webapp.smartfield.homolog.solvian.com";

  final chromeSafariBrowser = new ChromeSafariBrowser(new InAppBrowser());

  void open() {
    chromeSafariBrowser.open(url, options: {
      "showTitle": false,
      "enableUrlBarHiding": true,
      "instantAppsEnabled": true
    });
  }

  @override
  Widget build(BuildContext context) {
    open();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(12, 69, 114, 1),
          child: Center(
            child: FlatButton(
              child: Text(
                "Abrir aplicativo",
                style: TextStyle(
                    fontSize: 32, fontFamily: "sansserif", color: Colors.white),
              ),
              onPressed: open,
            ),
          ),
        ),
      ),
    );
  }
}
