import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_form_field.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatTextField extends ConsumerStatefulWidget {
  ChatTextField({
    super.key,
    this.onChanged,
    this.focusNode,
    this.onWhiteBackground = true,
    this.preventEmptySubmit = true,
    required this.hintText,
    required this.submit,
    TextEditingController? controller,
  }) : _controller = controller ?? TextEditingController();

  final String hintText;
  final bool onWhiteBackground;
  final bool preventEmptySubmit;
  final Future<void> Function(String)? submit;
  final void Function(String)? onChanged;
  final TextEditingController _controller;
  final FocusNode? focusNode;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late FocusNode focusNode;
  bool isAttachmentPopUpShow = false;
  bool focused = false;
  static double desktop = 900;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    final initialText = ref.read(textFieldContentProvider);

    if (initialText.isNotEmpty) {
      widget._controller.value = TextEditingValue(text: initialText);
    }

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          focused = true;
        });
      } else {
        setState(() {
          focused = false;
        });
      }
    });
    super.initState();
  }

  Future<void> submit() async {
    final message = ref.watch(textFieldContentProvider);
    if (widget.submit == null) return;
    if (message.isEmpty && widget.preventEmptySubmit) return;
    focusNode.requestFocus();
    widget._controller.value = TextEditingValue.empty;
    ref.watch(textFieldContentProvider.notifier).state = '';
    await widget.submit!(message);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(textFieldContentProvider, (previous, next) {
      if (next.isEmpty) {
        widget._controller.clear();
        widget._controller.value = TextEditingValue.empty;
      }
    });
    final maxWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      focusNode: focusNode,
      controller: widget._controller,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      minLines: 1,
      style: TextStyle(
        color: widget.onWhiteBackground ? black : white,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        isDense: true,
        // isCollapsed: true,
        filled: true,
        fillColor: purpleLighterer,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.onWhiteBackground ? black : white,
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: purple,
          ),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
          height: 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (ref.watch(textFieldContentProvider).isEmpty &&
                    widget.preventEmptySubmit)
                ? white
                : purple,
          ),
          child: IconButton(
            onPressed: submit,
            color: (ref.watch(textFieldContentProvider).isEmpty &&
                    widget.preventEmptySubmit)
                ? purple
                : Colors.white,
            icon: const Icon(
              Icons.send_rounded,
            ),
          ),
        ),
      ),
      onChanged: (value) {
        ref.watch(textFieldContentProvider.notifier).state = value;
      },
      onFieldSubmitted: (_) async {
        if (maxWidth < desktop) return;
        await submit();
      },
    );
  }
}
