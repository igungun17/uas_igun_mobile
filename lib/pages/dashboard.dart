import 'package:berita/components/news.dart';
import 'package:berita/components/profile.dart';
import 'package:berita/components/sport.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news.provider.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List imgData = [
    "assets/otomotive.png",
    "assets/sport.png",
    "assets/image.png",
  ];

  List titles = ["Otomotive", "Sport", "Profile"];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    // Pindahkan pemanggilan getTopNews ke luar Consumer
    Provider.of<NewsProvider>(context, listen: false).getTopNews();

    return Consumer<NewsProvider>(
      builder: (BuildContext context, news, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Color.fromARGB(255, 120, 5, 5),
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 35,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.sort,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/image.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Last Update: 21 Januari 2024",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(135, 0, 0, 0),
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Hapus Column yang kosong
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: height * 0.75,
                    width: width,
                    child: GridView.builder(
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        mainAxisSpacing: 25,
                      ),
                      shrinkWrap: true,
                      itemCount: imgData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (titles[index] == "Otomotive") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => News(),
                                ),
                              );
                            } else if (titles[index] == "Sport") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Sport(), // Sesuaikan dengan nama halaman Sport yang sesuai
                                ),
                              );
                            } else if (titles[index] == "Profile") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  imgData[index],
                                  width: 100,
                                ),
                                Expanded(
                                  child: Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
