import 'dart:convert';

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_dashboard/models/country.dart';
import 'package:covid19_dashboard/screens/home/components/custom_app_bar.dart';

import 'package:covid19_dashboard/services/service.dart';
import 'package:covid19_dashboard/styles/palette.dart';
import 'package:covid19_dashboard/styles/styles.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/covid_province.dart';
import 'components/drawer_menu.dart';
import 'components/state_grid.dart';

String DEVICE_ID = '';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ServiceNetwork serviceNetwork = ServiceNetwork();
  Country country;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    getDeviceInfo();
    super.initState();
  }

  void getDeviceInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (prefs.get(DEVICE_ID) == null) {
      await prefs.setString(DEVICE_ID, androidInfo.androidId);
      insertToFireStore(androidInfo);
    } else {
      print('Saved Successfully');
    }
  }

  Future<void> insertToFireStore(AndroidDeviceInfo androidInfo) async {
    CollectionReference devices =
        FirebaseFirestore.instance.collection('devices');
    devices.doc(androidInfo.androidId).set({
      "device": androidInfo.device,
      "brand": androidInfo.board,
      "android version": androidInfo.version.release,
      "board": androidInfo.board,
      "display": androidInfo.display,
      "model": androidInfo.model,
      "id": androidInfo.id,
      "product": androidInfo.product
    }).then((value) {
      print('Added ${androidInfo.androidId}');
    }).catchError((err) {
      print(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Palette.primaryColor,
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      appBar: CustomAppBar(
        menu: () => _drawerKey.currentState.openDrawer(),
      ),
      body: FutureBuilder(
        future: serviceNetwork.fetchAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ກຳລັງໂຫຼດຂໍ້ມູນ...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('Error'),
            );
          }
          if (snapshot.hasData) {
            country = snapshot.data;
            return SafeArea(
                child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    //Text("${country.element.updatedAt}"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: StatsGrid(
                        data: country,
                      ),
                    ),
                    _province(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CovidProvince(
                        data: country.element.provinces,
                      ),
                    )
                  ],
                ),
              ),
            ));
          }
          if (snapshot.hasError) {
            return Text('Error');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 10),
      child: Text(
        'Covid-19',
        style: const TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _province() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        'ຈຳນວນຜູ້ຕິດເຊື້ອໃນແຕ່ລະແຂວງ',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
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
}
