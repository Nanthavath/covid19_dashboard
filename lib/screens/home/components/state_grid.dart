import 'package:covid19_dashboard/models/country.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatelessWidget {
  final Country data;
  StatsGrid({this.data});
  final formatter = new NumberFormat("#,###");
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('ຍອດຜູ້ຕິເຊື້ອສະສົມ', data.element.total, Colors.orange),
                _buildStatCard('ຍອດຜູ້ເສຍຊີວິດ', data.element.dead, Colors.red),
              ],
            ),
          ),

          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('ປິ່ນປົວຫາຍດີ',data.element.treaded, Colors.green),
                _buildStatCard('ກຳລັງຮັກສາ', data.element.decoveringCase, Colors.lightBlue),
                _buildStatCard('ຜູ້ຕິເຊື່ອໃໝ່', data.element.newCase, Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, int count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${formatter.format(count)} ຄົນ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
