import 'dart:developer';

import 'package:bloc_eg/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(builder: (_, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                state.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () =>
                      BlocProvider.of<CounterCubit>(context).increment()),
              FloatingActionButton(
                  child: Icon(Icons.delete),
                  onPressed: (() => context.read<CounterCubit>().decrement())),
            ],
          ),
        );
      }),
    );
  }
}
