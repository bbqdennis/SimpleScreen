import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_pool.dart';
import 'package:flutter_application_1/simple_text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    dataPoolSimpleWriteData('counter', 0);
    dataPoolSimpleWriteData('label', "ABC Hi");

    final counter = dataPoolSimpleReadData('counter');
    print('MyHomePage build: $counter');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SimpleText(
              dataKey: 'label',
            ),
            SimpleText(
              dataKey: 'counter',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment'),
        onPressed: () {
          final counter = dataPoolSimpleChangeData('counter');
          counter.value++;

          final labelData = dataPoolSimpleChangeData('label');
          labelData.value =
              "You have pushed the button this many times: ${counter.value}";
          // counter.value++;
          // SimpleWriteData('label',
          //     "You have pushed the button this many times: ${counter.value}");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
