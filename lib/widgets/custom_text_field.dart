import 'package:flutter/material.dart';
import 'package:phonediretory2/shared/asset_paths/icon_paths.dart';
import '../shared/colors/uicolors.dart';

final class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.showable = false});
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool showable;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isEmpty = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: isEmpty ? UIColors.borderGrey : UIColors.borderGreen,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        keyboardType: widget.keyboardType,
        onChanged: (value) => setState(() {
          isEmpty = value.isEmpty;
        }),
        obscureText: widget.showable ? isVisible : false,
        decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintText: widget.hintText,
          fillColor: isEmpty
              ? UIColors.textFieldBackgroundWhite
              : UIColors.textFieldBackgroundGreen,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          suffixIcon: widget.showable ? eyeSuffix() : null,
        ),
        controller: widget.controller,
      ),
    );
  }

  IconButton eyeSuffix() {
    ImageIcon closedEye = const ImageIcon(AssetImage(IconPaths.eyeClosed));
    ImageIcon openedEye = const ImageIcon(AssetImage(IconPaths.eyeOpened));

    return IconButton(
        onPressed: () {
          isVisible = !isVisible;
          setState(() {});
        },
        icon: isVisible ? closedEye : openedEye);
  }
}
