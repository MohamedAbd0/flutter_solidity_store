import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_solidity_store/export.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final StreamController<bool> _validateStreamController =
      StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _triggerValidation();
  }

  void _triggerValidation() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    _validateStreamController.add(isValid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Product"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(
            Constant.pig_padding,
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                ImagePikerWidget(
                  onSelect: (image) {},
                ),
                const SizedBox(
                  height: Constant.pig_padding,
                ),
                MyInputField(
                  label: "Title",
                  placeholder: "Fill product title",
                  controller: TextEditingController(),
                  isRequierd: true,
                  onChanged: (_) {
                    _triggerValidation();
                  },
                ),
                const SizedBox(
                  height: Constant.pig_padding,
                ),
                MyInputField(
                  label: "Price",
                  placeholder: "Fill product price",
                  controller: TextEditingController(),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  isRequierd: true,
                  onChanged: (_) {
                    _triggerValidation();
                  },
                ),
                const SizedBox(
                  height: Constant.pig_padding,
                ),
                MyInputField(
                  label: "Description",
                  placeholder: "Fill product Description",
                  controller: TextEditingController(),
                  maxLine: 8,
                  isRequierd: true,
                  onChanged: (_) {
                    _triggerValidation();
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: StreamBuilder<bool>(
          stream: _validateStreamController.stream,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.all(Constant.pig_padding),
              child: MyBotton(
                title: "Add Product",
                enable: snapshot.hasData && snapshot.data == true,
                loading: false,
                onTap: () {
                  print("object");
                },
              ),
            );
          },
        ));
  }
}
