import 'package:flutter/material.dart';
import 'views/screens/carouse_page.dart';
import 'Models/global.dart';
import 'views/screens/video_page.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'video_page': (context) => video_page(),
        'carouse_page': (context) => carouse_page(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context)!.size.height;
    double _width = MediaQuery.of(context)!.size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("VEDIO"),
        ),
        body: ListView.builder(
          itemCount: videos.all_photo.length,
          itemBuilder: (context, i) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                  onTap: () {
                    setState(() {
                      videos.initvalue = i;
                      Navigator.of(context).pushNamed('video_page');
                    });
                  },
                  child: Container(
                      height: _height * 0.2,
                      width: _width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            "${videos.all_photo[i]['image']}",
                            width: 360,
                            fit: BoxFit.cover,
                          ),
                          Text("${videos.all_photo[i]['name']}",
                              style:
                               TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                        ],
                      )))),
        ));
  }
}