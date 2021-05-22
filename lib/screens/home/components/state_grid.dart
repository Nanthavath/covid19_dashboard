import 'package:covid19_dashboard/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatelessWidget {
  final Country data;

  StatsGrid({this.data});

  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatCard(
                    title: 'ຍອດຜູ້ຕິເຊື້ອສະສົມ',
                    count: data.element.total,
                    color: Colors.orange,
                    icon: 'assets/icons/account.svg',
                    colors: Colors.white),
                _buildStatCard(
                    title: 'ຍອດຜູ້ເສຍຊີວິດ',
                    count: data.element.dead,
                    color: Colors.red,
                    icon: 'assets/icons/dead.svg'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatCard(title:'ປິ່ນປົວຫາຍດີ', count:data.element.treaded,
                    color:  Colors.green,  icon:'assets/icons/happy.svg',colors: Colors.white),
                _buildStatCard(title:'ກຳລັງຮັກສາ',count: data.element.decoveringCase,
                    color:Colors.lightBlue,  icon:'assets/icons/doctors_bag.svg',colors: Colors.yellow),
                _buildStatCard(title:'ຜູ້ຕິເຊື່ອໃໝ່', count:data.element.newCase,
                    color: Colors.redAccent,  icon:'assets/icons/add_1.svg',colors: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildStatCard({
    String title,
    int count,
    Color color,
    String icon,
    Color colors,
  }) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(

          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: colors,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${formatter.format(count)} ຄົນ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
