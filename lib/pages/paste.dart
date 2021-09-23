import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

import '../downloader.dart';
class Paste extends StatefulWidget {

  @override
  _PasteState createState() => _PasteState();
}

class _PasteState extends State<Paste> {
  var pastTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back button again to exit'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: pastTec,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: pastTec.clear,
                    icon: Icon(Icons.clear),
                  ),
                  hintText: "Paste youtube link..",
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FlatButton.icon(
                  onPressed: (){
                    if (pastTec.text.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("No link pasted")));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Downloading video..")));
                      ///Download the video
                      Download().downloadVideo(
                          pastTec.text.trim(), "video.");
                    }
                  },
                  icon: Icon(Icons.download),
                  label: Text("Download"),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
