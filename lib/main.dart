import 'package:flutter/material.dart';

void main () {
  runApp(
    MaterialApp(
      home: CounterScreen(),
    ),
  );
}
class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var resultado = 0;

  void _operation(Function(int, int) func){ /* funções soma e sub > botoes */
    setState(() {
      resultado = func(resultado, 1);
    });
  }

  int add( num1, num2){
    return num1 + num2; 
  }
  int sub( num1,  num2){
    return num1 - num2;
  }
  int mul( num1, num2){
    return num1 * num2 * 2;
  }

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
          Center(child: Text('Sua contador esta em:', 
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
              '$resultado', 
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
            _operation(sub);
          }),
          SizedBox(width: 50),
           OperationFloatActionButton(Icon(Icons.exposure_plus_1),(){
           _operation(add);
         }),
         SizedBox(width: 50),
         OperationFloatActionButton(Icon(Icons.star),(){
           _operation(mul);
         })
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
