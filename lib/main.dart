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
  // Boolean variable to track theme state
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD CW1',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 170, 0),
          brightness: _darkMode ? Brightness.dark : Brightness.light,
        ),
      ),

      home: MyHomePage(
        title: 'MAD CW1',
        toggleTheme: () {
          setState(() {
            _darkMode = !_darkMode; // toggles the boolean to swap themes
          });
        },
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});
  final String title;
  final VoidCallback toggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Boolean variable to track image state
  bool _firstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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

            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 20), // spacing

            // Images
            Image.network(
              _firstImage
                  ? 'https://minifigs.me/cdn/shop/files/Monkey.jpg?v=1709909553'
                  : 'https://content.instructables.com/FUE/1173/HXIKE6RJ/FUE1173HXIKE6RJ.jpg?auto=webp&crop=1.2%3A1&frame=1&width=270',
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 20), // spacing

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _firstImage = !_firstImage; // toggles the boolean to swap images
                    });
                  },
                  child: const Text("Toggle Image"),
                ),

                const SizedBox(width: 10), // spacing

                ElevatedButton(
                  onPressed: widget.toggleTheme,
                  child: const Text("Toggle Theme"),
                ),

              ],
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