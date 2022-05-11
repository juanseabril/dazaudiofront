import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/fetch.dart';
import '../models/productbyname.dart';

class ShowInfoPage extends StatefulWidget {
  const ShowInfoPage({Key? key}) : super(key: key);

  @override
  State<ShowInfoPage> createState() => _ShowInfoPageState();
}

class _ShowInfoPageState extends State<ShowInfoPage> {
  ProductByName? _productModel;
  String? data;

  @override
  void initState() {
    data = Get.arguments['name'];
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = (await ApiService().getProductByName(data!))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _lateDelete(int id) async {
    (await ApiService().deleteProduct(id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _productModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: SafeArea(
                  child: Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 8,
                                shadowColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue,
                                  ),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Nombre del producto:",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      Text(
                                        _productModel!.productName,
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.yellow.shade600,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Card(
                                elevation: 8,
                                shadowColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue,
                                  ),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Precio de compra:",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        _productModel!.productBuy,
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.yellow.shade600,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Card(
                                elevation: 8,
                                shadowColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue,
                                  ),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Precio de venta:",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text(
                                        _productModel!.productSell,
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.yellow.shade600,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red.shade400,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 13),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.delete),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            const Text(
                                              "Eliminar",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        _lateDelete(_productModel!.productId);
                                        Get.back();
                                      }),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  ElevatedButton(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 13, horizontal: 12),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.edit),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            const Text(
                                              "Editar",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          )))),
                ),
              ));
  }
}
