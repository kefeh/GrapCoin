import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'type')
enum MessageEnum {
  text('text'),
  image('image'),
  video('video');

  const MessageEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'image':
        return MessageEnum.image;
      case 'text':
        return MessageEnum.text;
      case 'video':
        return MessageEnum.video;
      default:
        return MessageEnum.text;
    }
  }
}
