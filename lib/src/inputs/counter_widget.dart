import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CounterAction {
  decrease,
  increase
}

class Counter extends StatefulWidget {
  final Function onChange;
  final int initialValue;
  final int min;
  final int max;
  final bool vibrate;
  final Color color;

  const Counter({
    Key key,
    @required this.onChange,
    @required this.initialValue,
    @required this.min,
    @required this.max,
    @required this.vibrate,
    @required this.color
  }) : super(key: key);
  
  @override
  _CounterState createState() => _CounterState(
    color: this.color,
    initialValue: this.initialValue,
    min: this.min,
    max: this.max,
    vibrate: this.vibrate
  );
}

class _CounterState extends State<Counter> {

  _CounterState({
    this.initialValue,
    this.min,
    this.max,
    this.vibrate,
    this.color
  });

  final int initialValue;
  final int min;
  final int max;
  final bool vibrate;
  final Color color;

  int _counter;

  bool _isLongPressing = false;

  int get counter => _counter;

  bool get _canDecrease => _counter > min;
  bool get _canIncrease => _counter < max;

  void _decrease() {
    if (_canDecrease) {
      _counter--;
      if (vibrate) {
        HapticFeedback.lightImpact();
      }
      widget.onChange(_counter);
    }
  }

  void _increase() {
    if (_canIncrease) {
      _counter++;
      if (vibrate) {
        HapticFeedback.lightImpact();
      }
      widget.onChange(_counter);
    }
  }

  void _onLongPressStart(CounterAction action) async {
    setState(() {
      _isLongPressing = true;
    });
    do {
      if (action == CounterAction.increase) {
        _increase();
      } else if (action == CounterAction.decrease) {
        _decrease();
      }
      await Future.delayed(Duration(milliseconds: 70));
    } while (_isLongPressing);
  }

  void _onLongPressEnd() async {
    setState(() => _isLongPressing = false);
  }

  Function _handleActionPressed(CounterAction action) {

    if (action == CounterAction.decrease) {
      return _canDecrease ? _decrease : null;
    } else {
      return _canIncrease ? _increase : null;
    }
  }

  Widget _buildActionIcon(CounterAction action) {

    if (action == CounterAction.decrease) {
      return Icon(
        //Icons.navigate_before,
        Icons.remove,
        color: Colors.white,
        size: 28.0,
      );
    } else if (action == CounterAction.increase) {
      return Icon(
        //Icons.navigate_before,
        Icons.add,
        color: Colors.white,
        size: 28.0,
      );
    } else {
      return Icon(
        Icons.info_outline_rounded,
        color: Colors.white,
        size: 28.0,
      );
    }
  }

  /* Widget _buildCounterCard() {
    return Card(
      child: ListTile(
        leading: _buildActionButton(CounterAction.decrease),
        title: _buildCounterDisplay(),
        trailing: _buildActionButton(CounterAction.increase),
      ),
    );
  } */

  Widget _buildActionButton(CounterAction action) {
    return GestureDetector(
      onLongPressStart: (_) => _onLongPressStart(action),
      onLongPressEnd: (_) => _onLongPressEnd(),
      child: RaisedButton(
        elevation: 4.0,
        padding: EdgeInsets.all(10.0),
        shape: CircleBorder(),
        color: color,
        onPressed: _handleActionPressed(action),
        child: _buildActionIcon(action)
      ),
    );
  }

  Widget _buildCounterDisplay() {
    return Wrap(
      direction: Axis.vertical,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        //Text('Cópias'),
        SizedBox(
          width: 100,
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _counter.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,
                    fontSize: 26
                  )
                ),
              ),
            ),
          )
        ),
      ],
    );
  }

  Widget _buildCounter() {
    return 
    Container(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          _buildActionButton(CounterAction.decrease),
          _buildCounterDisplay(),
          _buildActionButton(CounterAction.increase)
        ],
      )
    );
  }
  
  @override
  void initState() {
    _counter = initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildCounter();
  }
}