import 'package:dio/dio.dart';
import 'package:softieones/model/model.dart';

class HomeServices{
  final dio = Dio();

 Future<List<ElectronicsModel>> getElectronicsList() async {
  try {
    final response = await dio.get('https://fakestoreapi.com/products');
    final data = response.data as List<dynamic>;
    final electronicsList =
        data.map((e) => ElectronicsModel.fromJson(e)).toList();
    return electronicsList;
  } catch (e) {
    throw Exception('Failed to get electronics list: $e');
  }
}

}