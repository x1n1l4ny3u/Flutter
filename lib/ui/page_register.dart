import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidu2/providers/registerviewmodel.dart';
import 'package:vidu2/ui/AppConstant.dart';
import 'package:vidu2/ui/custom_control.dart';
import 'package:vidu2/ui/page_login.dart';
import 'package:vidu2/ui/page_main.dart';
import '../models/profile.dart';

class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static String routename = '/register';
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();
  bool agree = true;
  
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    if (profile.token != "") // kiểm tra đã đăng nhập
    {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  PageMain(),
          ),
        );
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: viewmodel.status == 3 || viewmodel.status == 4
              ? Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/tick.gif'),
                      width: 100,
                    ),
                    Text(
                      "Đăng ký thành công",
                      style: AppConstant.textfancyheader,
                    ),
                    viewmodel.status == 3
                        ? const Text(
                            "Bạn cần xác nhận Email để hoàn thành đăng ký!")
                        : const Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.popAndPushNamed(
                              context, PageLogin.routename),
                          child: Text(
                            "Bấm vào đây",
                            style: AppConstant.textlink,
                          ),
                        ),
                        const Text("Để đăng nhập")
                      ],
                    )
                  ],
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                      const Applogo(),
                      const SizedBox(
                        height: 20,
                      ),
                            Text(
                              'Chào mừng đến với',
                              style: AppConstant.textfancyheader2,
                            ),
                            Text(
                              'Trang đăng ký',
                              style: AppConstant.textfancyheader2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                textController: _emailController,
                                hintText: 'Email',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _usernameController,
                                hintText: 'Username',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _pass1Controller,
                                hintText: 'Password',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                textController: _pass2Controller,
                                hintText: 'Re-password',
                                obscureText: false),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              viewmodel.errormessage,
                              style: AppConstant.texterror,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: viewmodel.agree,
                                  onChanged: (value) {
                                    viewmodel.setAgree(value!);
                                  },
                                ),
                                const Text("Đồng ý"),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text("Quy định"),
                                          content: SingleChildScrollView(
                                              child: Text(viewmodel.quydinh)),
                                        ),
                                      );
                                    },
                                    child: Text('Quy định',
                                        style: AppConstant.textlink)),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  final email = _emailController.text.trim();
                                  final username =
                                      _usernameController.text.trim();
                                  final pass1 = _pass1Controller.text.trim();
                                  final pass2 = _pass2Controller.text.trim();
                                  viewmodel.register(
                                      email, username, pass1, pass2);
                                },
                                child:
                                    const CustomButton(textButton: 'Đăng ký')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap:() => Navigator.of(context)
                                      .popAndPushNamed(PageLogin.routename),
                                      child: Text("Đăng nhập >>",
                                      style: AppConstant.textlink,
                                      ),
                                    )
                          ]),
                    ),
                    viewmodel.status == 1
                        ? CustomSpinner(size: size)
                        : Container(),
                  ],
                ),
        ),
      )),
    );
  }
}
