import 'package:customor_manager/common/ViewModel.dart';

///显示客户等级
class CustomerItemDetailvm extends ViewModel {
  List<int> showVIP() {
    return new List<int>.generate(10, (i) => i);
  }

  List<int> showCustomerVIP(int id) {
    return new List<int>.generate(10, (i) => i);
  }
}
