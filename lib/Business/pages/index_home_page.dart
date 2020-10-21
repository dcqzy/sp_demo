import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sp_demo/Business/components/MsgBar.dart';
import 'package:flutter_sp_demo/Business/components/PVBVCard.dart';
import 'package:flutter_sp_demo/Business/services/MsgService.dart';
import 'package:flutter_sp_demo/Business/services/PVBVServices.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class IndexHomePage extends StatelessWidget {
  /// {@macro counter_page}
  const IndexHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => MsgServices(),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => PVBVServices(),
          ),
        ],
        child: Scaffold(
            body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PVBVCard(),
                Divider(),
                MsgBar(),
              ],
            ),
          ),
        )));
  }
}
