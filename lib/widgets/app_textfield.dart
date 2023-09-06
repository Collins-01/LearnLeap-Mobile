import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/constants.dart';
import '../core/utils/utils.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  const AppTextField(
      {super.key,
      required this.title,
      this.prefixIcon,
      required this.controller,
      this.inputFormatters = const [],
      this.validator,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.isPassword = false,
      this.hintText = ""});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,

        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        // inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        style: mediumStyle,

        validator: widget.validator,
        obscureText: (widget.isPassword && obscure),
        decoration: InputDecoration(
          labelText: widget.title,
          // filled: true,
          fillColor: AppColors.textFieldColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: mediumStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: togglePasswordObscure,
                  icon:
                      Icon(!obscure ? Icons.visibility : Icons.visibility_off),
                )
              : const SizedBox.shrink(),
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }

  togglePasswordObscure() {
    setState(() {
      obscure = !obscure;
    });
  }
}
