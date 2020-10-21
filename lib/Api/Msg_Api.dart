/// pv bv api
class MsgAPI {
  /// 获取
  static getMsg() async {
    Map res = await Future.delayed(Duration(seconds: 2)).then((value) =>
        {"content": "恭喜升级", "isShow": true, "msgTime": DateTime.now()});
    return res;
  }

  /// 更新
  static updateMsg() async {
    Map res = await Future.delayed(Duration(microseconds: 200))
        .then((value) => {"code": "Y"});
    return res;
  }
}
