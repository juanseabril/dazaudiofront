// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Product> ProductFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String ProductToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.productId,
    required this.productName,
    required this.productBuy,
    required this.productSell,
  });

  int productId;
  String productName;
  String productBuy;
  String productSell;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["ProductId"] as int,
        productName: json["ProductName"] as String,
        productBuy: json["ProductBuy"] as String,
        productSell: json["ProductSell"] as String,
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "ProductBuy": productBuy,
        "ProductSell": productSell,
      };
}
