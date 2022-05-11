// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dazaudiofront/models/product.dart';
import 'package:http/http.dart';

import '../models/listproducts.dart';
import '../models/productbyname.dart';

class ApiService {
  String url_products = 'http://10.0.2.2:8000/product';
  String url_names = 'http://10.0.2.2:8000/listproducts';
  String url_productbyname = 'http://10.0.2.2:8000/productbyname/';

  Future<List<Product>?> getProducts() async {
    try {
      var response = await http.get(Uri.parse(url_products));
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
      Uri.parse(url_products),
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

  Future<List?> getListProducts() async {
    try {
      var response = await http.get(Uri.parse(url_names));
      if (response.statusCode == 200) {
        List _model = listProductsFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ProductByName?> getProductByName(String name) async {
    try {
      var response = await http.get(Uri.parse(url_productbyname + name));
      if (response.statusCode == 200) {
        ProductByName _model = productByNameFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
