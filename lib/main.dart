import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => const MainScreen(),
      '/second':(BuildContext context) => const SecondScreen(),
    },
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения')),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            var result = await Navigator.push<String>(context,MaterialPageRoute(builder: (context) =>  SecondScreen(),));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$result'), backgroundColor: Colors.black,)
            );
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
          },
          child: const Text('Приступить к работе'),
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  final String result01 = 'Да!';
  final String result02 = 'Нет!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите любой вариант')),
      body: Center(
        child:(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                //Navigator.pop(context);
                Navigator.maybePop(context,result01);
              },
              child:  Text(result01),
            ),

            ElevatedButton(
              onPressed: (){
                //Navigator.pop(context);
                Navigator.maybePop(context,result02);
              },
              child:  Text(result02),
            ),
          ],
        )
        )
      ),
    );
  }
}
