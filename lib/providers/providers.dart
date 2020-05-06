import 'package:dio/dio.dart';
import 'package:training/preferences/preferences.dart';

class Providers {
  static Dio dio = Dio();
  static String url = "https://sepatu.gopla.xyz";
  static PreferencesData _preferencesData = PreferencesData();

  static Future loginUser(String email, String password) async {
    return dio.post("$url/user/login", data: {
      "email": email,
      "password": password,
    });
  }

  static Future getListShoes() async {
    return dio.get("$url/sepatu/group/bestseller");
  }

  static Future getListCart() async {
    String token = await _preferencesData.getDataToken();
    String type = await _preferencesData.getDataTokenType();
    dio.options.headers['Authorization'] = "$type $token";
    return dio.get("$url/keranjang");
  }

  static Future postDataToList(int id, int jumlah) async {
    String token = await _preferencesData.getDataToken();
    String type = await _preferencesData.getDataTokenType();
    dio.options.headers['Authorization'] = "$type $token";
    await dio.post("$url/keranjang", data: {
      "id_sepatu": id,
      "jumlah": jumlah,
    });
  }

  static Future removeDataCart(int id) async {
    String token = await _preferencesData.getDataToken();
    String type = await _preferencesData.getDataTokenType();
    dio.options.headers['Authorization'] = "$type $token";
    await dio.delete("$url/keranjang/$id");
  }

  static Future getListTransaction() async {
    String token = await _preferencesData.getDataToken();
    String type = await _preferencesData.getDataTokenType();
    dio.options.headers['Authorization'] = "$type $token";
    return dio.delete("$url/transaksi/");
  }
}
