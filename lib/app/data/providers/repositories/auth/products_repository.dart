import 'dart:convert';

import 'package:estrellas_dashboard/app/data/models/product/product.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';

class ProductsRepository {
  ApiServices services = ApiServices();

  Future<List<ProductModel>?> getProductsFromBackend() async {
    String url = 'api/products/allProducts/?term=Protector';
    try {
      Response response = await services.get(url: url);
      dynamic body = response.body;
      dynamic json = jsonDecode(body);
      List<dynamic> bodyList = json['data']['products'];

      List<ProductModel> list = List<ProductModel>.generate(
        bodyList.length,
        (int index) => ProductModel.fromJson(bodyList[index]),
      );

      return list;
    } catch (e) {
      return null;
    }
  }
}
