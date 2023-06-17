import 'package:flutter/material.dart';

class AdvertInfoTextField extends StatelessWidget {
  const AdvertInfoTextField(
      {super.key,
      required this.label,
      required this.type,
      required this.controller,
      this.readOnly});
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly == null ? false : readOnly!,
      controller: controller,
      minLines: 1,
      maxLines: 5,
      keyboardType: type,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff232455),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Color(0xffe31e24),
            )),
        filled: true,
        fillColor: Colors.white,
        label: Text(
          label,
          style: TextStyle(color: Color(0xff232455), fontSize: 15),
        ),
      ),
    );
  }
}
