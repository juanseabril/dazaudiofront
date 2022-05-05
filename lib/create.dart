import 'package:dazaudiofront/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'fetch.dart';

class CreateProduct extends StatefulWidget {
  CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  _CreateProductState();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    print("Test123");
    return SafeArea(
      child: Scaffold(
        body: FormBuilder(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormBuilderTextField(
                    name: 'Nombre',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'asdf'),
                      FormBuilderValidators.minLength(3,
                          errorText: 'Ingrese mas información'),
                    ]),
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.library_books_sharp,
                          color: Colors.blue,
                          size: 30,
                        ),
                        hintText: "Ingresa nombre del producto",
                        labelText: "Nombre"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  FormBuilderTextField(
                    keyboardType: TextInputType.number,
                    name: 'Compra',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3,
                          errorText: 'Ingrese mas información'),
                    ]),
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.money,
                        color: Colors.blue,
                        size: 30,
                      ),
                      hintText: "Ingresa precio de compra del producto",
                      labelText: "Precio compra",
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  FormBuilderTextField(
                    keyboardType: TextInputType.number,
                    name: 'Venta',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3,
                          errorText: 'Ingrese mas información'),
                    ]),
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.monetization_on,
                          color: Colors.blue,
                          size: 30,
                        ),
                        hintText: "Ingresa precio de venta del producto",
                        labelText: "Precio venta"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.yellow,
                      shadowColor: Colors.yellow,
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(_formKey.currentState!.value['Nombre']);
                        print(_formKey.currentState!.value['Compra']);
                        print(_formKey.currentState!.value['Venta']);
                        ApiService().postProduct(Product(
                            productId: 1,
                            productName: _formKey.currentState!.value['Nombre'],
                            productBuy: _formKey.currentState!.value['Compra'],
                            productSell:
                                _formKey.currentState!.value['Venta']));
                      }
                    },
                    child: const Text('Guardar',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
