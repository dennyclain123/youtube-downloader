import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../downloader.dart';
class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  final link = "https://m.youtube.com/";
  WebViewController? webViewController;
  bool _showDownloadButton = false;

  void checkUrl() async {
    if (await webViewController!.currentUrl() == "https://m.youtube.com/") {
      setState(() {
        _showDownloadButton = false;
      });
    } else {
      setState(() {
        _showDownloadButton = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    checkUrl();
    return WillPopScope(
      onWillPop: ()async{
        if(await webViewController!.canGoBack()){
          webViewController!.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            setState(() {
              webViewController = controller;
            });
          },
        ),
        floatingActionButton: _showDownloadButton == true? FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            final url = await webViewController!.currentUrl();
            final title = await webViewController!.getTitle();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Downloading $title")));
            ///Download the video
            Download().downloadVideo("$url", "$title.");
          },
          child: Icon(Icons.download),
        )
        : Container()
      ),
    );
  }
}
