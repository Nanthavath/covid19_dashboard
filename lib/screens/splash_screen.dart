import 'package:covid19_dashboard/services/service.dart';
import 'package:covid19_dashboard/styles/palette.dart';
import 'package:flutter/material.dart';
// import 'package:platform_device_id/platform_device_id.dart';

import 'home/home.dart';

String deviceID = "";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getDeviceInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (deviceID == '') {
      return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200,
                ),

                
              ],
            ),
          ),
        ),
      );
    }
    return Home();
  }

  void getDeviceInfo() async {
    ServiceNetwork().fetchAllData();
    // String deviceId = await PlatformDeviceId.getDeviceId;
    // print(deviceId);
  }
}
