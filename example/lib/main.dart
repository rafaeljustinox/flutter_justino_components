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

class _MyHomePageState extends State<MyHomePage> 
  with SingleTickerProviderStateMixin {
  
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  bool _isPasswordVisible = false;
  int _typeIndex = 0;

  List<Widget> _tabs = [
    Tab( child: Text('Login') ),
    Tab( child: Text('Tab 2') ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSnackbar() {
    String title = 'Snackbar Demo';
    String message = 'Press again to test other snackbars colors';
    print(_typeIndex);
    ModernSnackbarType type = ModernSnackbarType.values[_typeIndex];

    ModernSnackbar.show(
      _scaffoldKey,
      title,
      message,
      type: type
    );

    setState(() {
      if (_typeIndex == ModernSnackbarType.values.length - 1) {
        _typeIndex = 0;
      } else {
        _typeIndex++;
      }
    });
  }

  Widget _buildTabBars() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(left: 12.0),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            isScrollable: true,
            indicator: CircleTabIndicator(
              color: Theme.of(context).primaryColor,
              radius: 4
            ),
            unselectedLabelColor: Theme.of(context).disabledColor,
            unselectedLabelStyle: 
              Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 20.0,
            ),
            labelColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.headline6.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),    
        ),
      ),
    );
  }

  Widget _buildFirstTab() {
    return
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ModernTextField(
                //theme: ModernTextFieldTheme.dark,
                labelText: 'Name',
                hintText: 'Your first name',
                prefixIcon: Icon(Icons.person_sharp), 
                controller: null,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ModernTextField(
                //theme: ModernTextFieldTheme.dark,
                labelText: 'Password',
                hintText: 'Your password',
                prefixIcon: Icon(Icons.lock),
                controller: null,
                textInputAction: TextInputAction.done,
                obscureText: _isPasswordVisible,
                onSuffixTap: () => setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                }),
                suffixIcon: _isPasswordVisible
                ? Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )
                : Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 22.0,
                horizontal: 8.0
              ),
              child: RoundedButton(
                onPressed: () => _showSnackbar(),
                text: 'Test Snackbar',
                fontWeight: FontWeight.bold,
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSecondTab() {
    return
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SectionTitle(title: 'Stepper Counter'),
            ),
            _buildCounter()
          ],
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: StepperCounter(
        color: Colors.pinkAccent,
        initialValue: 1,
        min: 1,
        max: 10,
        vibrate: true,
        onChange: (value) => setState((){
          print('Stepper Counter: $value');
        })
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: BehaviorWithoutGlow(),
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        PageTitle(
                          title: 'Components',
                          fontWeight: FontWeight.bold,
                          //color: Colors.black,
                        ),
                        _buildTabBars(),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              _buildFirstTab(),
                              _buildSecondTab(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
