import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessageMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color,
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel.error(this.title, this.message) : type = MessageType.error;
  MessageModel.sucess(this.title, this.message) : type = MessageType.sucess;
  MessageModel.info(this.title, this.message) : type = MessageType.infor;
}

enum MessageType { error, sucess, infor }

extension MessageTypeExtension on MessageType {
  Color get color {
    switch (this) {
      case MessageType.infor:
        return Colors.blue[200] ?? Colors.blue;
      case MessageType.error:
        return Colors.red[800] ?? Colors.red;
      case MessageType.sucess:
        return Colors.green;
    }
  }
}
