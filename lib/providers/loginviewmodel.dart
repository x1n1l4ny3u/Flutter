import 'package:flutter/material.dart';
import 'package:vidu2/repositories/login_repository.dart';
import 'package:vidu2/repositories/student_repository.dart';
import 'package:vidu2/repositories/user_repository.dart';
import 'package:vidu2/models/student.dart';
import 'package:vidu2/models/user.dart';

class LoginViewModel with ChangeNotifier {
  String errorMessage = "";
  int status = 0; // 0 - not login, 1 - waiting, 2 - error, 3 - already Login
  LoginRepository loginRepo = LoginRepository();
  Future<void> login(String username, String password) async {
    status = 1;
    notifyListeners();
    try {
      var profile = await loginRepo.login(username, password);
      if (profile.token == "") {
        status = 2;
        errorMessage = "Sai tên đăng nhập hoặc mật khẩu ";
      } else {
        var student = await StudentRepository().getStudentInfo();
        profile.student = Student.fromStudent(student);
        var user = await UserRepository().getUserInfo();
        profile.user = User.fromUser(user);
        status = 3;
        //Đăng nhập thành công, lấy thông tin user,student
      }
      notifyListeners();
    } catch (e) {}
  }
}
