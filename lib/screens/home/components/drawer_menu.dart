import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: [
          DrawerHeader(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: (){
              //Share.share('check out my website https://example.com');
              Share.share('check out my website https://example.com', subject: 'Look what I made!');
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/earth.svg'),
            title: Text('Website'),
            onTap: __launchURL,
          ),

          ListTile(
            leading: Icon(Icons.support),
            title: Text('Contact us'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: (){},
          ),
        ],
      ),
    );
  }

  void __launchURL() async {
    const _url = 'https://covid19-la.netlify.app/';
    await canLaunch(_url)?await launch(_url):throw 'Could not launch $_url';
  }
}
