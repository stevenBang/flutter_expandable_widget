import 'package:flutter_expandable_widget/flutter_expandable_widget.dart';
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
  ExpandableWidgetController expandableWidgetController = ExpandableWidgetController();
  ExpandableWidgetController expandableWidgetController2 = ExpandableWidgetController();
  ExpandableWidgetController expandableWidgetController3 = ExpandableWidgetController();
  ExpandableWidgetController expandableWidgetController4 = ExpandableWidgetController();
  ExpandableWidgetController expandableWidgetController5 = ExpandableWidgetController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: [
            ExpandableWidget(
              title: const Text('T-Shirt'),
              decoration: const BoxDecoration(color: Colors.lightBlueAccent),
              controller: expandableWidgetController,
              children: const [
                Text('S'),
                Text('M'),
                Text('L'),
                Text('XL'),
              ],
            ),
            const SizedBox(height: 20),
            ExpandableWidget(
              title: const Text('Change trailing widget'),
              decoration:
                  BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
              trailing: const Icon(Icons.arrow_forward),
              controller: expandableWidgetController2,
              children: const [
                Text('S'),
                Text('M'),
                Text('L'),
                Text('XL'),
              ],
            ),
            const SizedBox(height: 20),
            ExpandableWidget(
              title: const Text('Trailing At Left'),
              decoration: const BoxDecoration(color: Colors.green),
              trailing: const Icon(Icons.arrow_back),
              trailingPosition: TrailingPosition.left,
              trailingStartTurns: 1,
              trailingEndTurns: 0.75,
              controller: expandableWidgetController3,
              children: const [
                Text('S'),
                Text('M'),
                Text('L'),
                Text('XL'),
              ],
            ),
            const SizedBox(height: 20),
            ExpandableWidget(
              title: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Center'),
              ),
              decoration: const BoxDecoration(color: Color(0xFF81C784)),
              titleRowAxisAlignment: MainAxisAlignment.center,
              trailing: const Icon(Icons.arrow_back),
              trailingPosition: TrailingPosition.left,
              trailingStartTurns: 1,
              trailingEndTurns: 0.75,
              controller: expandableWidgetController4,
              childrenPadding: const EdgeInsets.only(top: 50),
              children: const [
                Text('S'),
                Text('M'),
                Text('L'),
                Text('XL'),
              ],
            ),
            const SizedBox(height: 20),
            ExpandableWidget.content(
              decoration: BoxDecoration(color: Colors.red[400]),
              title: const Text('titlePosition At Bottom'),
              expansionDirection: ExpansionDirection.expandUp,
              trailingPosition: TrailingPosition.right,
              trailingEndTurns: -0.25,
              content: Column(
                children: const [
                  Text('S'),
                  Text('M'),
                  Text('L'),
                  Text('XL'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
