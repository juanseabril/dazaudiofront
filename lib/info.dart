import 'package:dazaudiofront/product.dart';
import 'package:flutter/material.dart';

import 'fetch.dart';

class ShowInfo extends StatefulWidget {
  const ShowInfo({Key? key}) : super(key: key);

  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  late List<Product>? _productModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = (await ApiService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _productModel == null || _productModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Text(_productModel![7].productName),
              ));
  }
}
