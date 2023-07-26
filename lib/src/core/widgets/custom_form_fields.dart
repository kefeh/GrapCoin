import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.isPassword = false,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String labelText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 4),
        TextFormField(
          // controller: controller,
          obscureText: isPassword,
          validator: (_) {
            return null;
          },
          autovalidateMode: AutovalidateMode.disabled,
          style: TextStyle(
            color: focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : const Color.fromRGBO(11, 11, 54, 1),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            errorMaxLines: 2,
            filled: focusNode.hasFocus ? false : true,
            fillColor: purpleLighter,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(14, 16, 12, 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: purple),
            ),
          ),
        ),
      ],
    );
  }
}
