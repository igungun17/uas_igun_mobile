// news.provider2.dart

import 'package:berita/helpers/api.dart';
import 'package:berita/models/topNews.model.dart';
import 'package:berita/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider2 with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  String url = baseUrl;

  Future<void> getSportNews() async {
    print('Start API call for Sport News');
    
    try {
      final res = await api('${baseUrl}everything?q=sport&apiKey=${apiKey}');
      
      if (res.statusCode == 200) {
        resNews = TopNewsModel.fromJson(res.data);
      } else {
        resNews = TopNewsModel();
      }

      isLoading = false;
      notifyListeners();
      print('Finished API call for Sport News');
    } catch (error) {
      // Handle error
      print('Error during API call for Sport News: $error');
      isLoading = false;
      notifyListeners();
    }
  }

  void getBusinessNews() {}
}
