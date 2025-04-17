import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_solidity_store/export.dart';
import 'package:image_picker/image_picker.dart';

class ImagePikerWidget extends StatefulWidget {
  final ValueChanged<File?> onSelect;
  const ImagePikerWidget({
    super.key,
    required this.onSelect,
  });

  @override
  State<ImagePikerWidget> createState() => _ImagePikerWidgetState();
}

class _ImagePikerWidgetState extends State<ImagePikerWidget> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Constant.normal_border_radius,
          ),
          border: Border.all(color: Constant.SECONDARY_COLOR),
        ),
        child: image == null
            ? InkWell(
                child: Icon(
                  Icons.add_a_photo_outlined,
                ),
                onTap: () async {
                  final ImagePicker picker = ImagePicker();

                  final pickFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickFile != null) {
                    setState(() {
                      image = File(pickFile.path);
                    });

                    widget.onSelect(image);
                  }
                },
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Constant.normal_border_radius,
                    ),
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      Constant.normal_padding,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            image = null;
                          });
                          widget.onSelect(image);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.delete,
                            color: Constant.RED_COLOR,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
