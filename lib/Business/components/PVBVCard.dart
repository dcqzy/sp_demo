import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sp_demo/Business/models/pvbv.dart';
import 'package:flutter_sp_demo/Business/services/PVBVServices.dart';

/// pvbv 展示看板
class PVBVCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder(
        future: context.bloc<PVBVServices>().getData(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          }
          return BlocBuilder<PVBVServices, PVBVModel>(
            builder: (context, model) {
              return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PV:${model.pv}',
                      ),
                      Text(
                        'BV:${model.bv}',
                      ),
                      Text(
                        'Month:${model.month}',
                      ),
                    ],
                  ));
            },
          );
        });
  }
}
