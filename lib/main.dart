/*import 'dart:js';*/

import 'package:flutter/material.dart';
import 'package:vidu2/providers/diachimodel.dart';
import 'package:vidu2/providers/forgotviewmodel.dart';
import 'package:vidu2/providers/loginviewmodel.dart';
/*import 'package:vidu2/models/product.dart';*/

import 'package:provider/provider.dart';
import 'package:vidu2/providers/mainviewmodel.dart';
import 'package:vidu2/providers/menubarviewmodel.dart';
import 'package:vidu2/providers/profileviewmodel.dart';
import 'package:vidu2/providers/registerviewmodel.dart';
import 'package:vidu2/services/api_service.dart';
import 'package:vidu2/ui/page_dklop.dart';
import 'package:vidu2/ui/page_forgot.dart';
import 'package:vidu2/ui/page_login.dart';
import 'package:vidu2/ui/page_main.dart';
import 'package:vidu2/ui/page_register.dart';
import 'package:vidu2/ui/subpageprofile.dart';

import 'models/profile.dart';

// import 'bodyColumn.dart';
// import 'bodyContainer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService api = ApiService();
  api.initialize();

  Profile profile = Profile();
  profile.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
    ),
    ChangeNotifierProvider<ForgotViewModel>(
      create: (context) => ForgotViewModel(),
    ),
    ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
    ),
    ChangeNotifierProvider<MenuBarViewModel>(
      create: (context) => MenuBarViewModel(),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider<DiaChiModel>(
      create: (context) => DiaChiModel(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister(),
        '/forgot': (context) => PageForgot(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 97, 34)),
        useMaterial3: true,
      ),
      home: SubPageProfile(),
    );
  }
}

/*class MyListViews extends StatelessWidget {
  MyListViews({super.key});
  List<Product> ds = <Product>[
    Product("Geats", "assets/h6.jpg", "Kamen Rider Geats"),
    Product("Build", "assets/h1.jpg", "Kamen Rider Build"),
    Product("Kabuto", "assets/h2.jpg", "Kamen Rider Kabuto"),
    Product("W", "assets/h3.jpg", "Kamen Rider W"),
    Product("Ryuki", "assets/h4.jpg", "Kamen Rider Ryuki"),
    Product("Decade", "assets/h5.jpg", "Kamen Rider Decade"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("My List View"),
      ),
      body: ListView.builder(
        itemCount: ds.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            height: 80,
            color: Colors.green,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(0.8),
                  child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                    image: AssetImage(ds[index].hinhanh),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ds[index].ten),
                      Text(ds[index].mota),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}*/

/*class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Image"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0.8),
              child: Image(
                height: 150,
                width: 150,
                fit: BoxFit.fill,
                image: AssetImage('assets/h6.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kamen Rider Geats"),
                  Text("Kamen Rider Geats là bộ phim hay nhất thời Reiwa"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*class Vidu extends StatelessWidget {
  const Vidu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("ví dụ 1"),
      ),
      body: FormNhaplieu(),
    );
  }
}*/

/*class FormNhaplieu extends StatefulWidget {
  const FormNhaplieu({super.key});

  @override
  State<FormNhaplieu> createState() => _FormNhaplieuState();
}

class _FormNhaplieuState extends State<FormNhaplieu> {
  final _formkey = GlobalKey<FormState>();
  var welcome = "";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const Text('Form nhập liệu'),
          TextFormField(
            validator: (value) {
              name = value!;
              if (name == "") {
                return "Không được để trống!";
              } else
                return null;
            },
            onChanged: (value) {
              if (value == "") {
                setState(() {
                  welcome = "";
                });
              }
            },
            decoration: const InputDecoration(labelText: "Họ và tên"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                setState(
                  () {
                    welcome = "Xin chào bạn " + name + " !";
                  },
                );
              }
            },
            child: const Text("Submit"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(welcome),
            ],
          )
        ],
      ),
    );
  }
}*/

/*class Vidu2 extends StatefulWidget {
  const Vidu2({super.key});

  @override
  State<Vidu2> createState() => _Vidu2State();
}

class _Vidu2State extends State<Vidu2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("màn hình 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("màn hình 1"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Page2(ten: "Kiên");
                  },
                ));
              },
              icon: const Icon(Icons.login),
              label: const Text("Next Page"),
            )
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.ten});
  final String ten;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("màn hình 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("màn hình 2, Xin chào bạn: "),
            Text(ten),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text("close"),
            )
          ],
        ),
      ),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
