import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

void main() => runApp(MeuApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: InAppWebView(
                    initialUrl: "https://webapp.smartfield.homolog.solvian.com",
                    initialHeaders: {

                    },
                    initialOptions: {

                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onLoadStart: (InAppWebViewController controller, String url) {
                      print("started $url");
                      setState(() {
                        this.url = url;
                      });
                    },
                    onProgressChanged: (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress/100;
                      });
                    },
                  ),
                ),
              ),
            ].where((Object o) => o != null).toList(),
          ),
        ),
      ),
    );
  }
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
