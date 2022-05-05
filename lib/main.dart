// ignore_for_file: library_private_types_in_public_api, import_of_legacy_library_into_null_safe
import 'package:dazaudiofront/create.dart';
import 'package:dazaudiofront/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dazaudio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'DAZAUDIO',
              style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          body: Scaffold(
            body: const Text("Test"),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text('Agregar',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              icon: const Icon(
                Icons.add,
                color: Colors.yellow,
              ),
              elevation: 8,
              splashColor: Colors.yellow,
              onPressed: () {
                Get.to(CreateProduct());
              },
            ),
          )),
    );
  }
}


/*
ListView.builder(
                itemCount: _productModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_productModel![index].productId.toString()),
                            Text(_productModel![index].productName),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_productModel![index].productSell),
                            Text(_productModel![index].productBuy),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
*/