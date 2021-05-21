import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid19_dashboard/models/country.dart';
import 'package:covid19_dashboard/models/province.dart';
import 'package:covid19_dashboard/screens/home/components/custom_app_bar.dart';
import 'package:covid19_dashboard/services/env.dart';
import 'package:covid19_dashboard/services/service.dart';
import 'package:covid19_dashboard/styles/palette.dart';
import 'package:covid19_dashboard/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;

import 'components/covid_province.dart';
import 'components/state_grid.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ServiceNetwork serviceNetwork = ServiceNetwork();
  Country country;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(
        menu: () {},
        notify: () {},
      ),
      body: country == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              physics: ClampingScrollPhysics(),
              slivers: [
                _buildHeader(),
                // _buildRegionTabBar(),
                // _buildStatsTabBar(),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: StatsGrid(
                      data: country,
                    ),
                  ),
                ),
                _province(),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 20.0),
                  sliver: SliverToBoxAdapter(
                    child: CovidProvince(data: country.element.provinces,),
                  ),
                ),
              ],
            ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Covid-19',
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverPadding _province() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          'ຈຳນວນຜູ້ຕິດເຊື້ອໃນແຕ່ລະແຂວງ',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('Laos'),
              Text('Global'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  void getData() async{

    // serviceNetwork.fetchAllData();
    serviceNetwork.fetchAllData().then((value) {
      setState(() {
        country = value;
      });
    });
  }
}
