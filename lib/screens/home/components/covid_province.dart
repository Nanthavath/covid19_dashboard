import 'package:covid19_dashboard/models/country.dart';
import 'package:covid19_dashboard/models/province.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../province_screen.dart';

class CovidProvince extends StatelessWidget {
  const CovidProvince({Key key, this.data}) : super(key: key);
  final List<Provinces> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: List.generate(data.length, (index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => Province(data: data[index],),
              //   ),
              // );
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        height: 50,
                        child: VerticalDivider(
                          thickness: 1,
                        )),

                    // SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${data[index].name}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              '??????????????????: ${data[index].updatedAt.day}/${data[index].updatedAt.month}/${data[index].updatedAt.year}'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '???????????????: ${data[index].total} ?????????',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '???????????????????????????: ${data[index].newCase} ?????????',
                            style: TextStyle(fontSize: 13, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
