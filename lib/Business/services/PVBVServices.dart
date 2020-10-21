import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sp_demo/Api/PVBV_Api.dart';
import 'package:flutter_sp_demo/Business/models/pvbv.dart';

/// pvbv services
class PVBVServices extends Cubit<PVBVModel> {
  /// {@macro counter_cubit}
  PVBVServices()
      : super(PVBVModel()
          ..bv = ""
          ..pv = ""
          ..month = null);

  /// 从服务器获取数据
  Future getData() async {
    // 调用api获取数据
    Map res = await PVBVAPI.getPVBV();
    var pvbvModel = PVBVModel()
      ..pv = res["pv"]
      ..bv = res["pv"]
      ..month = res["month"];
    emit(pvbvModel);
  }

  @override
  onChange(Change change) {
    print("change $change");
    super.onChange(change);
  }
}
