import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    sizeAnimation = Tween(begin: 80.0 , end: 160.0 ).animate(controller);
    colorAnimation = ColorTween(begin: Colors.deepOrange, end: Colors.amber).animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    controller.addListener(() {
      setState(() {

      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Animation"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,

          child: Text(
            "Hello",
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration (
              color: colorAnimation.value,
              shape: BoxShape.circle
          ),
        )
      ),
    );
  }
}
