import 'package:berita/helpers/api.dart';
import 'package:berita/models/topNews.model.dart';
import 'package:berita/utils/const.dart';
import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;
  String url = baseUrl;

  Future<void> getTopNews() async {
    print('Start API call');
    
    try {
      final res = await api('${baseUrl}everything?q=otomotif&apiKey=${apiKey}');
      
      // print('API Response: ${res.data}');

      if (res.statusCode == 200) {
        resNews = TopNewsModel.fromJson(res.data);
      } else {
        resNews = TopNewsModel();
      }

      // Hapus atau komentar keluar pernyataan print untuk nilai isLoading
      // print('isLoading: $isLoading');

      isLoading = false;
      notifyListeners();
      print('Finished API call');
    } catch (error) {
      // Handle error
      print('Error during API call: $error');
      isLoading = false;
      notifyListeners();
    }
  }

  void getBusinessNews() {}
}
