import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidu2/ui/AppConstant.dart';
import 'package:vidu2/ui/page_forgot.dart';
import 'package:vidu2/ui/page_register.dart';

import '../providers/loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';

class PageLogin extends StatelessWidget {
  PageLogin({super.key});
  static String routename = '/login';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  /* Future login(BuildContext context) async {
    String username = _emailController.text.trim();
    String password = _passwordController.text.trim();
    ApiService api = ApiService();
    Response? response = await api.loginUser(username, password);
    if (response?.statusCode == 200) {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageMain(),
          ));
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3) {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.popAndPushNamed(context, PageMain.routename);
          /*Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageMain(),
          ));*/
        },
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      const Applogo(),
                      const SizedBox(
                        height: 20,
                      ),
                    const Text(
                      "xin chào",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 228, 91, 0),
                      ),
                    ),
                    const Text(
                      "chúng tôi rất nhớ bạn",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 228, 91, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: "username",
                      textController: _emailController,
                      obscureText: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "password",
                      textController: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    viewmodel.status == 2
                        ? Text(viewmodel.errorMessage,
                            style: const TextStyle(color: Colors.red))
                        : const Text(""),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        String username = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        viewmodel.login(username, password);
                      },
                      child: const CustomButton(
                        textButton: "Đăng nhập",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Chưa có tài khoản?"),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .popAndPushNamed(PageRegister.routename),
                          child: Text("Đăng ký",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange[300])),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed(PageForgot.routename),
                      child: Text(
                        "Quên mật khẩu?",
                        style: AppConstant.textlink,
                      ),
                    )
                  ],
                ),
              ),
              viewmodel.status == 1 ? CustomSpinner(size: size) : Container(),
            ],
          ),
        ),
      )),
    );
  }
}
