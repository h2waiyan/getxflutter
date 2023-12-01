import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getflutter/get/counter.dart';
import 'package:getflutter/provider/pizza.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PizzaProvider(pizza: 4))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PizzaCounter(),
      ),
    );
  }
}

class PizzaCounter extends StatefulWidget {
  const PizzaCounter({super.key});

  @override
  State<PizzaCounter> createState() => _PizzaCounterState();
}

class _PizzaCounterState extends State<PizzaCounter> {
  @override
  Widget build(BuildContext context) {
    int noOfPizza = Provider.of<PizzaProvider>(context).pizza;

    return Scaffold(
        appBar: AppBar(title: const Text("Pizza Counter")),
        body: Center(
            child: Column(children: [
          Text(
            "🍕 : $noOfPizza",
            style: const TextStyle(fontSize: 50),
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<PizzaProvider>(context, listen: false)
                    .changeNoOfPizza();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 50),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PizzaScreenTwo()));
              },
              child: const Text(
                "Go to Screen 2",
                style: TextStyle(fontSize: 50),
              ))
        ])));
  }
}

class PizzaScreenTwo extends StatefulWidget {
  const PizzaScreenTwo({super.key});

  @override
  State<PizzaScreenTwo> createState() => _PizzaScreenTwoState();
}

class _PizzaScreenTwoState extends State<PizzaScreenTwo> {
  @override
  Widget build(BuildContext context) {
    int noOfPizza = Provider.of<PizzaProvider>(context).pizza;

    return Scaffold(
        appBar: AppBar(title: const Text("Pizza Screen Two")),
        body: Center(
            child: Column(children: [
          Text(
            "Pizza : $noOfPizza",
            style: const TextStyle(fontSize: 50),
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<PizzaProvider>(context, listen: false)
                    .changeNoOfPizza();
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 50),
              )),
        ])));
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
                Get.to(const ScreenTwo());
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
          Obx(
            () {
              var sq = counter.count.value * counter.count.value;
              return Text(
                "Square : ${sq}",
                style: const TextStyle(fontSize: 50),
              );
            },
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
                Get.snackbar("Hi", "This is a snackbar");
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text('This is a snackbar'),
                //   ),
                // );
              },
              child: const Text(
                "Show SnackBar",
                style: TextStyle(fontSize: 50),
              ))
        ])));
  }
}
