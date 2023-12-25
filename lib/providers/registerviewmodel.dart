import 'package:flutter/material.dart';
import 'package:vidu2/repositories/register_repository.dart';

const String email = "kienbmt123@gmail.com";

class RegisterViewModel with ChangeNotifier {
  int status =
      0; // 0 - chua dang ki, 1 - dang dang ki, 2 - dang ki lai, 3 - dang ki xac minh email, 4 - dang ki khong xac minh email
  String errormessage = "";
  bool agree = false;
  final registerRepo = ReigisterRepository();
  String quydinh =
      "Khi tham gia vào ứng dụng cần phải đồng ý những điều khoản sau:\n" +
          "1. Các thông tin của bản sẽ được chia sẻ với các thành học:\n" +
          "2. Thông tin của bạn có thể ảnh hưởng học tập ở trưởng:\n" +
          "3. Thông tin của bạn sẽ được xóa vĩnh viễn khi có yêu cầu xóa thông tin";
  void setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> register(
      String email, String username, String pass1, String pass2) async {
    status = 1;
    notifyListeners();
    errormessage = "";
    if (agree == false) {
      status = 2;
      errormessage += "Bạn phải đồng ý điều khoản trước khi đăng kí!\n";
    }
    if (email.isEmpty || username.isEmpty || pass1.isEmpty) {
      status = 2;
      errormessage += "Email, username , password không được để trống:\n";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      status = 2;
      errormessage += "Email không hợp lệ!\n";
    }
    if (pass1.length < 8) {
      status = 2;
      errormessage += "password cần lớn hơn 8 chữ \n";
    }
    if (pass1 != pass2) {
      status = 2;
      errormessage += "Mật khẩu không giống nhau!";
    }
    if (status != 2)
      status = await registerRepo.register(email, username, pass1);

    /// sử dụng Repository gọi hàm login và lấy kết quả
    notifyListeners();
  }
}
