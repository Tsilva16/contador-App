import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final controller = CounterController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meu Contador'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Seu contador esta em:', 
          style: 
          TextStyle(
            fontSize: 30,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.blue[900]
          ),
          ),
          ),
          Center
            (child: Text(
              controller.getCounter(), 
              style: TextStyle(
                fontSize: 45,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row( /* linha responsavel pelos widgets, botoes */
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OperationFloatActionButton(Icon(Icons.exposure_minus_1),(){
            setState(() {
              controller.subtractCounter();
            });
          }),
          SizedBox(width: 50),
           OperationFloatActionButton(Icon(Icons.exposure_plus_1),(){
             setState(() {
               controller.incrementCounter();
             });
          }),
        ],
      ),
    );
  }
}

class OperationFloatActionButton extends StatelessWidget {

  final Function func;
  final Widget icon;

  OperationFloatActionButton(this.icon, this.func, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: func, 
      child: icon ,);
    
  }
}