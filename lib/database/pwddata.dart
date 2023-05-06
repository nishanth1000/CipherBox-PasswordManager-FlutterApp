import 'package:hive/hive.dart';

class PwdDB {
  List data = [];

  final pwdBox = Hive.box('data');

  void createData() {
    data = [
      ['Dummy', 'dummy', 'dummy@gmail.com', 'dummy']
    ];
  }

  void loadData() {
    data = pwdBox.get('pwd');
  }

  void updateData() {
    pwdBox.put('pwd', data);
  }
}
