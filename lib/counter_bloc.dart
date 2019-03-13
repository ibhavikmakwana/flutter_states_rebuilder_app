import 'package:states_rebuilder/states_rebuilder.dart';

class CounterBloc extends StatesRebuilder {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    //Use the ids parameter to enter the list of the ids,
    // Widgets with these ids will rebuild to reflect tge new counter value.
    rebuildStates(ids: ["myCounter"]);
  }
}
