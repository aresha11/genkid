import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlTestCode extends StatelessWidget {
   HtmlTestCode({Key? key,required this.contentOfPage1}) : super(key: key);


   List<String> contentOfPage1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HTML Preview')),
        body: WebView(
          initialUrl: 'data:text/html;charset=utf-8,' + Uri.encodeComponent(contentOfPage1.join("\n")),
          javascriptMode: JavascriptMode.unrestricted,
        ),

    );
  }
}
