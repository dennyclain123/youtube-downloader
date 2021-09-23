import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:youtube_downloader/pages/browser.dart';
import 'package:youtube_downloader/pages/paste.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [Paste(),BrowserPage()];
    return Scaffold(
      appBar: AppBar(
        title: Text("Tubeload",style: TextStyle(color: Colors.white),),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 30,
                height: 30,
                // color: Colors.red,
                child: Image.asset("images/youtube.png")
              )
          )
        ],
      ),
      body: pageList[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ios_share), label: "Link"),
          BottomNavigationBarItem(icon: Icon(Icons.open_in_browser), label: "Browser"),
        ],
        onTap: (value){
          setState(() {
            currentindex = value;
          });
        },
      ),
    );
  }
}
