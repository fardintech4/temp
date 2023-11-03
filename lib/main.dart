import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NewWidget());
  }
}

class NewWidget extends StatefulWidget {
  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> with TickerProviderStateMixin {
   bool selectedtrue = true;
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selectedtrue = !selectedtrue;
            });
          },
          child: Text("Fade Animation"),
        ),
        AnimatedCrossFade(firstChild: Text("First Name"), secondChild: Text("Second Name"), crossFadeState: selectedtrue ? CrossFadeState.showFirst:CrossFadeState.showSecond, duration: Duration(seconds: 2))
      ],
    )));
  }
}
