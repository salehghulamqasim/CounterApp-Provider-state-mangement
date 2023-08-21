import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Counter with Provider"),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Counter>(builder: (context, counter, child){
                  print("ElevatedButton of increment was clicked");
                  return ElevatedButton(
                      onPressed: (){
                        counter.increaseMe();
                      },
                    child:const Text("+",style: TextStyle(fontSize: 30),),);
                }
                ),
                const SizedBox(width: 20),
                Consumer<Counter>(
                  builder: (context, counter, child) {
                    print("Selector for value was called");
                    return Text("${Counter.Number}",style: const TextStyle(fontSize: 80,fontWeight: FontWeight.bold),);
                  },
                ),
                const SizedBox(width: 20),
                Consumer<Counter>(builder: (context, counter, child){
                      print("ElevatedButton of decrement was clicked");
                      return ElevatedButton(
                          onPressed: (){
                            counter.decreaseMe();
                          },
                          child:const Text("-",style: TextStyle(fontSize: 30),),);

                    }
                )
              ],
            ),
          )),
    );
  }
}
class Counter extends ChangeNotifier {
  static var Number = 0;


  increaseMe() {
    Number++;
    notifyListeners();
  }

  decreaseMe() {
    Number--;
    notifyListeners();
  }
}

