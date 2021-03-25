import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {

  final Function onPressed;

  const OfflineWidget({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom:18.0),
                child: Icon(
                  Icons.network_check,
                  size: 64.0,
                  color: Colors.black26,
                ),
              ),
              Text(
                'Você está offline. Verifique sua conexão',
                style: Theme.of(context).textTheme.bodyText2
              ),
              FlatButton(
                onPressed: onPressed != null ? onPressed : (){},
                child: Text(
                  'Tentar novamente',
                  style: Theme.of(context).textTheme.bodyText2
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}