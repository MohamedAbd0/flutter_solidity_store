import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:motion_toast/motion_toast.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late StoreCubit _storeCubitCubit;
  final _formKey = GlobalKey<FormState>();
  final StreamController<bool> _validateStreamController =
      StreamController<bool>();

  TextEditingController titileTEC = TextEditingController();
  TextEditingController priceTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();

  File? image;

  @override
  void initState() {
    super.initState();
    _storeCubitCubit = getIt<StoreCubit>();

    _triggerValidation();
  }

  @override
  void dispose() {
    super.dispose();
    _validateStreamController.close();
    titileTEC.dispose();
    priceTEC.dispose();
    descriptionTEC.dispose();
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
                  onSelect: (file) {
                    image = file;
                  },
                ),
                const SizedBox(
                  height: Constant.pig_padding,
                ),
                MyInputField(
                  label: "Title",
                  placeholder: "Enter Product Title",
                  controller: titileTEC,
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
                  placeholder: "Enter Product Price in ETH",
                  controller: priceTEC,
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
                  placeholder: "Enter Product Description",
                  controller: descriptionTEC,
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
        bottomNavigationBar: BlocConsumer<StoreCubit, StoreState>(
          bloc: _storeCubitCubit,
          listener: (context, state) {
            if (state.cubitStatus == CubitStatus.error) {
              Utils.showErrorMessage(
                context: context,
                error: state.errorMessage ?? "",
              );
            } else if (state.cubitStatus == CubitStatus.done) {
              context.pop();
              Utils.showSuccessMessage(
                context: context,
                message: "Creating Product Done",
              );
            }
          },
          builder: (context, state) {
            return StreamBuilder<bool>(
              stream: _validateStreamController.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: EdgeInsets.all(Constant.pig_padding),
                  child: MyBotton(
                    title: "Add Product",
                    enable: snapshot.hasData && snapshot.data == true,
                    loading: state.cubitStatus == CubitStatus.loading,
                    onTap: () {
                      if (image == null) {
                        Utils.showErrorMessage(
                          context: context,
                          error: "Selecting Image is Required",
                        );
                      } else {
                        _storeCubitCubit.createProduct(
                          title: titileTEC.text,
                          description: descriptionTEC.text,
                          price: double.parse(priceTEC.text),
                          image: image!,
                        );
                      }
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
