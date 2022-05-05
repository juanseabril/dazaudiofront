// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dazaudiofront/product.dart';
import 'package:http/http.dart';

class ApiService {
  String url = 'http://10.0.2.2:8000/product';

  Future<List<Product>?> getProducts() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Product> _model = ProductFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Product?> postProduct(Product product) async {
    Map data = {
      "ProductId": product.productId,
      "ProductName": product.productName,
      "ProductBuy": product.productBuy,
      "ProductSell": product.productSell,
    };

    final Response response = await post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }
}
