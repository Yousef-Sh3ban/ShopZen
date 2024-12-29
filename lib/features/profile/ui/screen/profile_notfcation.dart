import 'package:base/features/profile/ui/widget/buildSwitchTile.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool generalNotifications = true;
  bool sound = true;
  bool vibrate = false;
  bool specialOffers = true;
  bool promoAndDiscounts = true;
  bool payments = false;
  bool cashback = false;
  bool appUpdates = true;
  bool newServiceAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xff323135),
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          buildSwitchTile(
            title: 'General Notifications',
            value: generalNotifications,
            onChanged: (value) {
              setState(() {
                generalNotifications = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Sound',
            value: sound,
            onChanged: (value) {
              setState(() {
                sound = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Vibrate',
            value: vibrate,
            onChanged: (value) {
              setState(() {
                vibrate = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Special Offers',
            value: specialOffers,
            onChanged: (value) {
              setState(() {
                specialOffers = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Promo & Discounts',
            value: promoAndDiscounts,
            onChanged: (value) {
              setState(() {
                promoAndDiscounts = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Payments',
            value: payments,
            onChanged: (value) {
              setState(() {
                payments = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'Cashback',
            value: cashback,
            onChanged: (value) {
              setState(() {
                cashback = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'App Updates',
            value: appUpdates,
            onChanged: (value) {
              setState(() {
                appUpdates = value;
              });
            },
          ),
          _buildDivider(),
          buildSwitchTile(
            title: 'New Service Available',
            value: newServiceAvailable,
            onChanged: (value) {
              setState(() {
                newServiceAvailable = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      height: 1,
      color: Colors.grey[300],
    );
  }
}
