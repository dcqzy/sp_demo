/// pv bv api
class PVBVAPI {
  static getPVBV() async {
    Map res = await Future.delayed(Duration(seconds: 1))
        .then((value) => {"pv": "2000", "bv": "1992", "month": 6});
    return res;
  }
}
