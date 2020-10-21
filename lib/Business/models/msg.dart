import 'package:equatable/equatable.dart';

/// 消息model
class MsgModel extends Equatable {
  String content;
  bool isShow;
  DateTime msgTime;

  @override
  List<Object> get props => [content, isShow, msgTime];
}
