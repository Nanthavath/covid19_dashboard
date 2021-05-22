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
            leading: Icon(
              Icons.share,
              color: Colors.black,
            ),
            title: Text('Share'),
            onTap: () {
              Share.share(
                  "https://drive.google.com/drive/folders/18wT0HD95gekNpjo-QBZYVOhMqwvEVXQc?usp=sharing");
              //Share.share('https://drive.google.com/drive/folders/18wT0HD95gekNpjo-QBZYVOhMqwvEVXQc?usp=sharing', subject: 'Look what I made!');
            },
          ),
          Divider(),
          ListTile(
            leading: SvgPicture.asset('assets/icons/earth.svg'),
            title: Text('Website'),
            onTap: __launchURL,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: Text('About'),
            onTap: () {
              _showDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void __launchURL() async {
    const _url = 'https://covid19-la.netlify.app/';
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'About us',
            style: TextStyle(color: Colors.blue),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 60,
                ),
              ),
              Divider(),
              Text(
                  'ເປັນແອັບພິເຄຣຊັນ ໃນການລາຍງານຜູ້ຕິດເຊື້ອໂຄວິດ 19 ທົ່ວປະເທດ, ຕະຫຼອດຖຶງການເພີ່ມຂຶ້ນຂອງແຕ່ລະມື້'),
              Text('ຂໍ້ມູນຈາກ'),
              InkWell(
                child: Text(
                  'https://covid19-la.netlify.app',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  __launchURL();
                },
              ),
              Text('ຂໍ້ມູນອ້າງອິງ'),
              InkWell(
                child: Text(
                  'ສູນຂ່າວສານການແພດສຸຂະສຶກສາ',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  //__launchURL();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}
