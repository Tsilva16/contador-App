import 'package:contador/counter_model.dart';

class CounterController {
  final model = CounterModel();


  String getCounter() {
    return model.counter.toString();
  }

  void incrementCounter(){

    model.incrementCounter();
  }
}