import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatButton extends StatelessWidget {
  const ChatButton._({
    Key? key,
    required this.outlined,
    required this.isLoading,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    EdgeInsets? padding,
    this.child,
    this.leading,
  })  : padding = padding ?? const EdgeInsets.symmetric(vertical: 15),
        super(key: key);

  factory ChatButton.primary({
    Key? key,
    required String text,
    bool isLoading = false,
    void Function()? onPressed,
    EdgeInsets? padding,
    Widget? leading,
    Widget? child,
  }) =>
      ChatButton._(
        text: text,
        onPressed: onPressed,
        color: purple,
        textColor: Colors.white,
        outlined: false,
        padding: padding,
        isLoading: isLoading,
        leading: leading,
        key: key,
        child: child,
      );

  factory ChatButton.secondary({
    Key? key,
    required String text,
    bool isLoading = false,
    void Function()? onPressed,
    EdgeInsets? padding,
    Widget? leading,
  }) =>
      ChatButton._(
        text: text,
        onPressed: onPressed,
        color: Colors.white,
        textColor: purple,
        isLoading: isLoading,
        outlined: false,
        padding: padding,
        leading: leading,
        key: key,
      );

  factory ChatButton.outlined({
    Key? key,
    required String text,
    void Function()? onPressed,
    EdgeInsets? padding,
    bool isLoading = false,
    Widget? leading,
    bool isTransparent = false,
  }) =>
      ChatButton._(
        text: text,
        onPressed: onPressed,
        color: isTransparent ? Colors.transparent : white,
        textColor: purple,
        isLoading: isLoading,
        outlined: true,
        padding: padding,
        leading: leading,
        key: key,
      );

  factory ChatButton.outlinedCaution({
    Key? key,
    required String text,
    void Function()? onPressed,
    EdgeInsets? padding,
    bool isLoading = false,
    Widget? leading,
    bool isTransparent = false,
  }) =>
      ChatButton._(
        text: text,
        onPressed: onPressed,
        color: isTransparent ? Colors.transparent : white,
        textColor: red,
        isLoading: isLoading,
        outlined: true,
        padding: padding,
        leading: leading,
        key: key,
      );

  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;
  final bool outlined;
  final bool isLoading;
  final EdgeInsets padding;
  final Widget? leading;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: outlined ? textColor : color,
            ),
          ),
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(
                width: 10,
              ),
            ],
            if (isLoading)
              CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              )
            else
              child != null
                  ? child!
                  : Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
