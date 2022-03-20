import 'dart:ui';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0; // * esto es una propiedad
  // * funciones
  void increase() {
    counter++;
    setState(() {});
  }

  void decremen() {
    counter--;
    setState(() {});
  }

  void rest() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        elevation: 10,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Numero de taps', style: fontSize30),
          Text('$counter', style: fontSize30),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomBottonsFloat(
        increaseFn: increase,
        decremenFn: decremen,
        restFn: rest,
      ),
    );
  }
}

class CustomBottonsFloat extends StatelessWidget {
  final Function increaseFn;
  final Function decremenFn;
  final Function restFn;

  const CustomBottonsFloat(
      {Key? key,
      required this.increaseFn,
      required this.decremenFn,
      required this.restFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decremenFn(),
        ),
        FloatingActionButton(
            child: const Icon(Icons.exposure_zero), onPressed: () => restFn()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () => increaseFn()),
      ],
    );
  }
}
