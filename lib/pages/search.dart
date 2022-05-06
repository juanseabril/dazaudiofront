// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../api/fetch.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List? _listProducts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _listProducts = (await ApiService().getListProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

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
          body: _listProducts == null || _listProducts!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: Text(_listProducts.toString()),
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
                      print(_listProducts!);
                      //Get.to(CreatePage());
                    },
                  ),
                )),
    );
  }
}
