import 'package:berita/components/news1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news.provider2.dart';

class Sport extends StatefulWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider2>(context, listen: false).getSportNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Olahraga'),
        backgroundColor: Color.fromARGB(255, 120, 5, 5),
      ),
      body: Consumer<NewsProvider2>(
        builder: (BuildContext context, newsProvider, Widget? child) {
          return newsProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                physics: BouncingScrollPhysics(),
                  children: [
                    ...newsProvider.resNews?.articles?.map(
                      (e) => News1(
                        title: e.title ?? '',
                        image: e.urlToImage ?? '',
                      ),
                    ) ?? [],
                  ],
                );
        },
      ),
    );
  }
}
