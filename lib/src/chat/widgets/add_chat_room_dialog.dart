import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/widgets/image_picker_avartar.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class AddRoomDialog extends StatefulWidget {
  const AddRoomDialog({
    super.key,
    this.onChanged,
    this.onPressed,
    this.isLoading = false,
    this.hasProfile = true,
    required this.hintText,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String content)? onPressed;
  final bool isLoading;
  final bool hasProfile;

  @override
  State<AddRoomDialog> createState() => _AddRoomDialogState();
}

class _AddRoomDialogState extends State<AddRoomDialog> {
  late final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ref.listen(addChatRoomProvider.select((value) => value.failureOrSuccess),
    //     (previous, next) {
    //   print(next);
    //   if (next == null) return;
    //   Navigator.pop(context);
    // });

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ), //this right here
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.hasProfile)
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: ImagePickerAvatar(),
                    ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: purple),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: purple),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: purple),
                        ),
                        hintText: widget.hintText,
                        isDense: true,
                      ),
                      onChanged: widget.onChanged,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 320,
                child: ChatButton.primary(
                  text: 'Proceed',
                  onPressed: () async {
                    if (controller.value.text.isEmpty) return;
                    final onPressed = widget.onPressed;
                    if (onPressed != null) {
                      onPressed(controller.value.text);
                    }
                    Navigator.of(context).pop();
                  },
                  isLoading: widget.isLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
