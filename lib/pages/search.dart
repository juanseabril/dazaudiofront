// ignore_for_file: library_private_types_in_public_api

import 'package:dazaudiofront/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

import '../api/fetch.dart';
import 'create.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<String>? _listProducts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _listProducts = (await ApiService().getListProducts())!.cast<String>();
    _listProducts!.sort((String a, String b) => a.compareTo(b));
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
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: ListTile(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: SearchProductDelegate(_listProducts!),
                );
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.yellow,
                    size: 27,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Buscar en Dazaudio',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: _listProducts == null || _listProducts!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: Container(
                    color: const Color(0xfffef713),
                    child: Center(
                        child: Image.asset("lib/assets/images/logo.jpg")),
                  ),
                ),
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
              Get.to(const CreatePage());
            },
          ),
        );
      }),
    );
  }
}
