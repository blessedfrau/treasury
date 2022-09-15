import 'package:flutter/material.dart';
import 'widgetheading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Main Page'),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(children: [
          heading(),
          const SizedBox(
            height: 100,
          ),
          details(),
        ]),
      ),
    );
  }

  Widget heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        BoxHeading(
          txt: 'C1',
          color: Colors.amber,
        ),
        BoxHeading(
          txt: 'C2',
          color: Colors.pink,
        ),
        BoxHeading(
          txt: 'C3',
          color: Colors.cyan,
        ),
      ],
    );
  }

  Widget details() {
    return Flexible(
      child: ListView.builder(
        key: Key(selected.toString()),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              key: Key(index.toString()),
              // initiallyExpanded: index == selected,
              title: Text('Menu ${_loopingIndex(index)}'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              onExpansionChanged: (value) async {
                if (value) {
                  setState(() {
                    selected = index;
                  });
                } else {
                  setState(() {
                    selected = -1;
                  });
                }
              },
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Menu ${_loopingIndex(index)}');
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
                Text(
                  'Name ${_loopingIndex(index)}',
                ),
                Text('Address ${_loopingIndex(index)}')
              ],
            ),
          );
        },
      ),
    );
  }

  _loopingIndex(int index) {
    index++;
    for (int list = index; list < 21; list++) {
      return list.toString();
    }
  }
}
