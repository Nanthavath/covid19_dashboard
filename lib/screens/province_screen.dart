import 'package:covid19_dashboard/models/province.dart';
import 'package:covid19_dashboard/styles/palette.dart';
import 'package:flutter/material.dart';

class Province extends StatelessWidget {
  const Province({Key key,this.data}) : super(key: key);
  final Provinces data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text('${data.name}'),
      ),
      body: Container(
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/vientiane.png'),),

          ],
        ),
      ),
    );
  }
}
