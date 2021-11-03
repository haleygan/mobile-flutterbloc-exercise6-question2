import 'package:exercise6_q2/cubit/userinput_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BlocProvider(
        create: (context) => UserInputCubit(),
        child: const MyHomePage(
          title: 'Mobile Flutter Bloc Exercise 6 Question 2',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  var userInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getUserInput(),
    );
  }

  Widget _getUserInput() {
    return Form(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Type something :',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: textController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: ElevatedButton(
                onPressed: () => {
                  context
                      .read<UserInputCubit>()
                      .capitilizeText(textController.text)
                },
                child: const Text('Capitalize'),
              ),
            ),
            BlocBuilder<UserInputCubit, String>(builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  state,
                  style: TextStyle(fontSize: 30),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
