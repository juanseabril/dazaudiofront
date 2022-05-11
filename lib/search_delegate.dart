import 'package:dazaudiofront/pages/info.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchProductDelegate extends SearchDelegate<String> {
  late final List<String> products;
  late String result;

  SearchProductDelegate(this.products);

  @override
  String get searchFieldLabel => 'Escribe el producto aquí';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = products.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products.where((product) {
      return product.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Center(
              child: Text(
                suggestions.elementAt(index),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {
              query = suggestions.elementAt(index);
              Get.to(const ShowInfoPage(), arguments: {"name": query});
            },
            textColor: Colors.blue,
            tileColor: Colors.yellow,
          ),
        );
      },
    );
  }
}
