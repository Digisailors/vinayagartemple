import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _numberCtrl = TextEditingController();
  void initState() {
    super.initState();
    _numberCtrl.text = "607223989";
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
            return false;
          },
      child: Scaffold(
        backgroundColor: Color(0xFFFFEFC4),
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Contact Information',
            style: h1,
          )),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(child: Builder(builder: (context) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/ammannew.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Center(
                          child: Text(
                        'Get in touch with us',
                        style: hb2,     
                      )),
                      hGap10,
                      Center(
                          child: Text(
                        'Contact us directly using the contact information below \n Feel free to get in touch with us via email or phone',
                        style: hb3,
                      ))
                    ],
                  ),
                  hGap10,
                  CardInfo(
                        leadingIcon: Icons.phone,
                        title: 'Mobile Phone',
                        subtitle: '+60 7-223 3989',
                        onTap: () {
                          FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                        },
                      ),
                  CardInfo(
                      leadingIcon: Icons.email,
                      title: 'Email',
      
                      subtitle: 'info.armd1911@gmail.com',
                      onTap: () {
                        launchUrl(
                            Uri.parse('mailto:info.armd1911@gmail.com'));
      
                      }),
                  CardInfo(
                      leadingIcon: Icons.location_on,
                      title: 'Address',
                      subtitle:
      
                          'No.1A, Jalan Ungku Puan, 80000 Johor Bahru.',
      
                      onTap: () {
                        launchUrl(Uri.parse('https://www.google.co.in/maps/place/1a,+Jalan+Ungku+Puan,+Bandar+Johor+Bahru,+80000+Johor+Bahru,+Johor,+Malaysia/@1.4591008,103.7613708,17z/data=!3m1!4b1!4m6!3m5!1s0x31da12dd4de98f45:0xa9775763dfac1fec!8m2!3d1.4591008!4d103.7639457!16s%2Fg%2F11j0rvfykz?entry=ttu'));
                      }),
                  hGap10,
                  const Divider(
                    height: 2,
                    thickness: 1,
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                  ),
                  hGap10,
                  const Column(
                    children: [
                      Center(
                          child: Text(
                        'Social Media',
                        style: hb2,
                      )),
                      hGap10,
                      SocialMediaRow(
                        facebookUrl:
                            'https://www.facebook.com/your_facebook_page',
                        instagramUrl:
                            'https://www.instagram.com/your_instagram_page',
                        twitterUrl: 'https://twitter.com/your_twitter_page',
                      ),
                      hGap10,
                    ],
                  ),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const CardInfo({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}

void launchUrl(Uri uri) async {
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch $uri';
  }
}

class SocialMediaIcon extends StatelessWidget {
  final String imageAsset;
  final String url;
  const SocialMediaIcon({
    required this.imageAsset,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imageAsset,
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SocialMediaRow extends StatelessWidget {
  final String facebookUrl;
  final String instagramUrl;
  final String twitterUrl;

  const SocialMediaRow({
    required this.facebookUrl,
    required this.instagramUrl,
    required this.twitterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaIcon(imageAsset: 'assets/facebook.png', url: facebookUrl),
        SocialMediaIcon(imageAsset: 'assets/instagram.png', url: instagramUrl),
        SocialMediaIcon(imageAsset: 'assets/twitter.png', url: twitterUrl),
      ],
    );
  }
}
