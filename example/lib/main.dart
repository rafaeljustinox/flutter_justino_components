import 'package:flutter/material.dart';
import 'package:justino_components/justino_components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justino Components',
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
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
  with SingleTickerProviderStateMixin {
  
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;
  bool _isPasswordVisible = false;
  int _typeIndex = 0;
  List<String> _dropdownOptions = [
    'Option A',
    'Option B',
    'Option C',
    'Option D',
  ];

  // ignore: unused_field
  String? _selectedOption = '';

  String dropdownValue = 'One';

  List<Widget> _tabs = [
    Tab(child: Text('Inputs')),
    Tab(child: Text('Buttons')),
    Tab(child: Text('Snackbar')),
  ];

  bool _isFabExpanded = false;
  bool _isFabVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _showSnackbar() {
    String title = 'Snackbar Demo';
    String message = 'Press again to test other snackbars colors';
    print(_typeIndex);
    ModernSnackbarType type = ModernSnackbarType.values[_typeIndex];

    ModernSnackbar.show(
      context,
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
              Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 20.0,
            ),
            labelColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
            ),
          ),    
        ),
      ),
    );
  }

  Widget _buildInputsTab() {
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
              padding: const EdgeInsets.all(8.0),
              child: ModernDropdownField(
                hintText: 'Select one option',
                initialValue: _dropdownOptions[0],
                items: _dropdownOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Row(
                      children: [
                        Icon(
                          Icons.place,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(option),
                        )
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (updatedOption) {
                  setState(() {
                    _selectedOption = updatedOption;
                  });
                },
                labelText: 'Options',
                labelWeight: FontWeight.bold,
                textWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SectionTitle(title: 'Counter'),
            ),
            _buildCounter(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Hold to increase or decrease faster'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsTab() {
    return
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 22.0,
                horizontal: 8.0
              ),
              child: ModernButton(
                onPressed: () {
                  setState((){
                    _isFabVisible = !_isFabVisible;
                  });
                },
                text: _isFabVisible 
                  ? 'Hide Corner Button'
                  : 'Show Corner Button',
                fontWeight: FontWeight.bold,
                icon: Icon(
                  _isFabVisible 
                  ? Icons.visibility
                  : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 22.0,
                horizontal: 8.0
              ),
              child: ModernButton(
                onPressed: (!_isFabExpanded && !_isFabVisible)
                  ? null
                  : () {
                    setState((){
                      _isFabExpanded = !_isFabExpanded;
                    });
                  },
                text: _isFabExpanded 
                  ? 'Collapse Corner Button'
                  : 'Expand Corner Button',
                fontWeight: FontWeight.bold,
                icon: Icon(
                  _isFabExpanded
                  ? Icons.arrow_forward_rounded
                  : Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSnackbarTab() {
    return
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 22.0,
            horizontal: 8.0
          ),
          child: ModernButton(
            onPressed: () => _showSnackbar(),
            text: 'Test Snackbar',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCounter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Counter(
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
    return HideKeyboardOnTap(
      child: Scaffold(
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
                          ),
                          _buildTabBars(),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildInputsTab(),
                                _buildButtonsTab(),
                                _buildSnackbarTab(),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              )
            ),
            CornerButton(
              isVisible: _isFabVisible,
              isExpanded: _isFabExpanded,
              onPressed: () => print('Corner Button pressed'),
              collapsedContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 28.0
                  ),
                  SizedBox(
                    width: 35.0,
                  )
                ],
              ),
              expandedContent: Text(
                'Confirm',
                style: Theme.of(context).textTheme.button!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              ),            
            )
          ],
        ),
      ),
    );
  }
}
