import 'package:flutter/material.dart';

class WebView extends StatelessWidget {
  final String url;

  const WebView(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(url),
    );
  }
}
