import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:quickactions/page1.dart';
import 'package:quickactions/page2.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    QuickActions? quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      print("Shortcut type : $shortcutType");
      if (shortcutType == 'page1') {
        print("Inside page1");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page1()));
      } else if (shortcutType == 'page2') {
        print("Inside page2");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Page2()));
      } else {
        print("dunnp");
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(type: 'page1', localizedTitle: 'Go to Page 1', icon: 'i1'),
      ShortcutItem(type: 'page2', localizedTitle: 'Go to Page 2', icon: 'i2')
    ]);
  }

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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
