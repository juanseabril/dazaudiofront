import 'dart:convert';

List<String> listProductsFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String listProductsToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
