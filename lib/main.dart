import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MyHomePageState extends State<MyHomePage> {
  FocusNode focusNode = FocusNode();
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: RawKeyboardListener(
                  autofocus: true,
                  focusNode: focusNode,
                  onKey: (rawkeyevent) {
                    var logicalkey = rawkeyevent.logicalKey;
                    if (rawkeyevent.isControlPressed &&
                        logicalkey.keyId == LogicalKeyboardKey.keyR.keyId) {
                      setState(() {
                        color = Colors.red;
                      });
                    } else if (rawkeyevent.isControlPressed &&
                        logicalkey.keyId == LogicalKeyboardKey.keyA.keyId) {
                      setState(() {
                        color = Colors.amber;
                      });
                    } else if (rawkeyevent.isControlPressed &&
                        logicalkey.keyId == LogicalKeyboardKey.keyB.keyId) {
                      setState(() {
                        color = Colors.brown;
                      });
                    }
                  },
                  child: Container(
                    color: color,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
