import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getflutter/get/counter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        body: Center(
            child: Column(children: [
          Obx(
            () => Text(
              "Count : ${counter.count}",
              style: const TextStyle(fontSize: 50),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter.increment();
                });
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 50),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenTwo()));
              },
              child: const Text(
                "Go to Screen 2",
                style: TextStyle(fontSize: 50),
              ))
        ])));
  }
}

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  Counter counter = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Hello World")),
        body: Center(
            child: Column(children: [
          Obx(
            () => Text(
              "Count : ${counter.count}",
              style: const TextStyle(fontSize: 50),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter.increment();
                });
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 50),
              )),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Go to Screen 2",
                style: TextStyle(fontSize: 50),
              ))
        ])));
  }
}
