import 'package:equatable/equatable.dart';

/// pv bv 指数model
class PVBVModel extends Equatable {
  String pv;
  String bv;
  int month;

  @override
  // TODO: implement props
  List<Object> get props => [pv, bv, month];
}
