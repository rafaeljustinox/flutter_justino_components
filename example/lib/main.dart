import 'package:flutter/material.dart';
import 'package:justino_components/justino_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justino Components Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Justino Components'),
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
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SectionTitle(
                title: 'Login',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModernTextField(
                  //theme: ModernTextFieldTheme.dark,
                  labelText: 'Name',
                  hintText: 'Your first name',
                  errorText: 'Error text',
                  icon: Icon(Icons.person_sharp), 
                  controller: null,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModernTextField(
                  //theme: ModernTextFieldTheme.dark,
                  labelText: 'Surname',
                  hintText: 'Your surname',
                  icon: Icon(Icons.lock), 
                  controller: null,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  onUserClick: () => print('Clicked'),
                  text: 'Test',
                  icon: Icon(
                    Icons.access_alarm_sharp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hello World'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
