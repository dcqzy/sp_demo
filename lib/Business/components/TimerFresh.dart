import 'dart:async';

import 'package:flutter/material.dart';

/// 定时刷新组件
class FreshTimer extends StatelessWidget {
  ///自组件
  Widget child;

  ///定时间隔
  int intervalMiliseconds;

  /// 是否需要重复
  bool repeat;

  ///定时需要执行的操作
  Function action;

  FreshTimer(
      {@required this.child,
      this.intervalMiliseconds,
      this.repeat,
      this.action}) {
    if (intervalMiliseconds != null) {
      if (repeat == true) {
        Timer.periodic(Duration(milliseconds: intervalMiliseconds), (timer) {
          print("periodic");
          if (action != null) {
            action();
          }
        });
      } else {
        Timer(Duration(milliseconds: intervalMiliseconds), () {
          if (action != null) {
            action();
          }
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
