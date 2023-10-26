import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Widget> widget = const [
  Icon(Icons.home),
  Icon(Icons.settings),
  Icon(Icons.person),
];

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  late final TabController controller;
  int _index = 0;
  
  @override
  void initState(){
    super.initState();
    controller = TabController(length: widget.length,initialIndex: _index, vsync: this);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          TabBarView(
            controller: controller,
            children: widget,),
          Positioned(
              bottom: 40,
              child: TabPageSelector(controller: controller,color: Colors.black38,))
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton.small(onPressed: (){
            (_index != widget.length - 1) ? _index++ : _index = 0;
            controller.animateTo(_index);
          },
            child: Icon(Icons.navigate_next),
            hoverElevation: 0,
            elevation: 0,
          )
        ],
      ),
    )
    );
  }
}

