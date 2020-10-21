import 'package:bloc/bloc.dart';
import 'package:flutter_sp_demo/Api/Msg_Api.dart';
import 'package:flutter_sp_demo/Api/PVBV_Api.dart';
import 'package:flutter_sp_demo/Business/models/msg.dart';

/// pvbv services
class MsgServices extends Cubit<MsgModel> {
  /// {@macro counter_cubit}
  MsgServices()
      : super(MsgModel()
          ..content = ""
          ..msgTime = null
          ..isShow = false);

  /// 从服务器获取数据
  Future<MsgModel> getData() async {
    print("Future<MsgModel> getData");
    // 调用api获取数据
    Map res = await MsgAPI.getMsg();
    var msgModel = MsgModel()
      ..content = res["content"]
      ..msgTime = res["msgTime"]
      ..isShow = res["isShow"];
    emit(msgModel);
    return msgModel;
  }

  /// 更新消息已读
  void udpateMsg() async {
    // 调用api获取数据
    Map res = await MsgAPI.updateMsg();
    if (res["code"] == "Y") {
      var msgModel = MsgModel()
        ..content = state.content
        ..msgTime = state.msgTime
        ..isShow = false;
      emit(msgModel);
    }
  }

  @override
  onChange(Change change) {
    // print("change $change");
    super.onChange(change);
  }
}
