import 'package:flutter/material.dart';
import 'package:vidu2/models/lop.dart';
import 'package:vidu2/models/profile.dart';
import 'package:vidu2/repositories/lop_repository.dart';
import 'package:vidu2/repositories/student_repository.dart';
import 'package:vidu2/repositories/user_repository.dart';
import 'package:vidu2/ui/AppConstant.dart';
import 'package:vidu2/ui/custom_control.dart';
import 'package:vidu2/ui/page_main.dart';

class PageDangKyLop extends StatefulWidget {
  const PageDangKyLop({super.key});

  @override
  State<PageDangKyLop> createState() => _PageDangKyLopState();
}

class _PageDangKyLopState extends State<PageDangKyLop> {
  List<Lop>? listlop = [];
  Profile profile = Profile();
  String mssv = "";
  String ten = "";
  int idlop = 0;
  String tenlop = "";
  @override
  void initState() {
    // TODO: implement initState
    mssv = profile.student.mssv;
    ten = profile.user.first_name;
    idlop = profile.student.idlop;
    tenlop = profile.student.tenlop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Thêm thông tin cơ bản",
              style: AppConstant.textfancyheader2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Bạn không thể quay trở lại trang sau khi rời đi. Hãy kiểm tra kỹ!",
              style: AppConstant.texterror1,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputText(
              title: "Tên:",
              value: ten,
              width: size.width,
              callback: (output) {
                ten = output;
              },
            ),
            CustomInputText(
              title: "Mssv:",
              value: mssv,
              width: size.width,
              callback: (output) {
                mssv = output;
              },
            ),
            listlop!.isEmpty
                ? FutureBuilder(
                    future: LopRepository().getDsLop(),
                    builder: (context, AsyncSnapshot<List<Lop>> snapshot) {
                      if (snapshot.connectionState ==
                       ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        listlop = snapshot.data;
                        return CustomInputDropDown(
                          width: size.width,
                          list: listlop!,
                          title: "Lớp",
                          valueId: idlop,
                          valueName: tenlop,
                          callback: (outputId, outputName) {
                            idlop = outputId;
                            tenlop = outputName;
                          },
                        );
                      } else {
                        return Text('Đã xảy ra lỗi');
                      }
                    })
                : CustomInputDropDown(
                    width: size.width -50,
                    list: listlop!,
                    title: "Lớp",
                    valueId: idlop,
                    valueName: tenlop,
                    callback: (outputId, outputName) {
                      idlop = outputId;
                      tenlop = outputName;
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () async {
                  profile.student.mssv = mssv;
                  profile.student.idlop = idlop;
                  profile.student.tenlop = tenlop;
                  profile.user.first_name = ten;
                  await UserRepository().updateProfile();
                  await StudentRepository().dangkyLop();
                },
                child: CustomButton(textButton: 'Lưu thông tin')),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context,PageMain.routename);
              },
              child: Text(
                "Rời khỏi trang",
                style: AppConstant.textlink,
              ),
            )
          ],
        ),
      ))),
    );
  }
}
