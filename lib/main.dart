import 'package:ScaffoldExmp/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
            ChangeNotifierProvider<CounterProvider>(
              create: (context) => CounterProvider()
            ),
      ],
      child: MaterialApp( title: 'deneme',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Deneme'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      drawer: Drawer(
        
      ),
      body: Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'defa tıklandı:',
            ),
            Text(
             context.watch<CounterProvider>().data.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),  
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     children: [
       FloatingActionButton(
         onPressed: context.read<CounterProvider>().increment,
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ),
       FloatingActionButton(
         onPressed: context.read<CounterProvider>().decrement,
         tooltip: 'Increment',
         child: Icon(Icons.remove),
       ),
     ],

    ),
    );
  }
}
