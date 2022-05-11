// To parse this JSON data, do
//
//     final productByName = productByNameFromJson(jsonString);

import 'dart:convert';

ProductByName productByNameFromJson(String str) =>
    ProductByName.fromJson(json.decode(str));

String productByNameToJson(ProductByName data) => json.encode(data.toJson());

class ProductByName {
  ProductByName({
    required this.productId,
    required this.productName,
    required this.productBuy,
    required this.productSell,
  });

  int productId;
  String productName;
  String productBuy;
  String productSell;

  factory ProductByName.fromJson(Map<String, dynamic> json) => ProductByName(
        productId: json["ProductId"],
        productName: json["ProductName"],
        productBuy: json["ProductBuy"],
        productSell: json["ProductSell"],
      );

  Map<String, dynamic> toJson() => {
        "ProductId": productId,
        "ProductName": productName,
        "ProductBuy": productBuy,
        "ProductSell": productSell,
      };
}
