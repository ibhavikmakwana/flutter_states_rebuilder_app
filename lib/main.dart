import 'package:flutter/material.dart';
import 'package:flutter_states_rebuilder_app/counter_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() => runApp(MyApp());

CounterBloc counterBloc;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter states_rebuilder Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter states_rebuilder Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
        initState: (_) => counterBloc = CounterBloc(),
        dispose: (_) => counterBloc = null,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  StateBuilder(
                    stateID: 'myCounter',
                    blocs: [counterBloc],
                    builder: (State state) => Text(
                          counterBloc.counter.toString(),
                          style: Theme.of(state.context).textTheme.display1,
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: counterBloc.increment,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
