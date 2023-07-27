import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    super.key,
    this.isPassword = false,
    this.onChanged,
    this.validator,
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
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            color: blackLight,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          // controller: controller,
          obscureText: hide && widget.isPassword,
          validator: widget.validator,
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.disabled,
          style: TextStyle(
            color: widget.focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : const Color.fromRGBO(11, 11, 54, 1),
            fontSize: 12,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    child: Icon(
                      hide ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            hintText: widget.hintText,
            errorMaxLines: 2,
            filled: widget.focusNode.hasFocus ? false : true,
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
