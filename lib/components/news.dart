import 'package:berita/providers/news.provider.dart';
import 'package:berita/components/news1.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, NewsProvider newsProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: Text('Berita Terbaru saat ini'),
           backgroundColor: Color.fromARGB(255, 120, 5, 5),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.read<NewsProvider>().isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            ...(newsProvider.resNews?.articles ?? []).map(
                              (e) => News1(
                                title: e.title ?? '',
                                image: e.urlToImage ?? '',
                              ),
                            ),
                          ],
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