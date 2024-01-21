import 'package:dio/dio.dart';

final dio = Dio();

Future<Response> api(String url, {String? method, dynamic data}) async {
  try {
    final response = await dio.request(
      url,
      data: data,
      options: Options(method: method ?? 'GET'), // Setel metode default jika tidak disediakan
    );
    return response;
  } catch (error) {
    // Tangani kesalahan di sini
    print('Error during API call: $error');
    rethrow; // Lempar kembali kesalahan untuk ditangani di level yang lebih tinggi
  }
}
