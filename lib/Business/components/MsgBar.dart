import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sp_demo/Business/components/TimerFresh.dart';
import 'package:flutter_sp_demo/Business/models/msg.dart';
import 'package:flutter_sp_demo/Business/services/MsgService.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class MsgBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FreshTimer(
        intervalMiliseconds: 500,
        repeat: true,
        action: () {
          context.bloc<MsgServices>().getData();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder<MsgModel>(
                future: context.bloc<MsgServices>().getData(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    );
                  }
                  return BlocBuilder<MsgServices, MsgModel>(
                    builder: (context, model) {
                      print("BlocBuilder builder");
                      return Offstage(
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          child: Container(
                            color: Colors.blue,
                            child: Text('${model.content}:${model.msgTime}',
                                style: TextStyle(color: Colors.white)),
                          ),
                          onTap: () {
                            /// 调用service 更新消息
                            print("onTap");
                            context.bloc<MsgServices>().udpateMsg();
                          },
                        ),
                        offstage: !model.isShow,
                      );
                    },
                  );
                })
          ],
        ));
  }
}
