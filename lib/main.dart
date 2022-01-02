import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: BlogOverview(reversed: index.isOdd, title: 'Blog #${index + 1}',),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 80,);
      },
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BlogOverview extends StatelessWidget {
  const BlogOverview({Key? key, required this.title, this.reversed = false}) : super(key: key);
  final String title;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      overflowAlignment: OverflowBarAlignment.center,
      spacing: 20,
      overflowSpacing: 15,
      textDirection: reversed ? TextDirection.rtl : TextDirection.ltr,
      children:  [
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size.square(200)),
          child: Placeholder(),
        ),
        ConstrainedBox(
          constraints: BoxConstraints.loose(Size.fromWidth(350)),
          child: Column(
            children: [
              Text(title),
              Text(
                'It’s just, eventually we’re all gonna move on. It’s called growing up. Enim aspernatur nemo. Voluptatibus eum cupiditate ducimus possimus qui. Voluptatum quo occaecati. Consectetur tenetur in ut placeat atque est. Et voluptate explicabo.'
              ),
            ],
          ),
        )
      ],
    );
  }
}

