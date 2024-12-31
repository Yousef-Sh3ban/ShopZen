import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class LogoutBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 47),
      decoration: BoxDecoration(
         color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Logout',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                
                ),
          ),
          SizedBox(height: 16),
          Divider(
            color: Color(0xFFE0E0E5),
          ),
          SizedBox(height: 15),
          Text(
            'Are you sure you want to log out?',
            style: TextStyle(
                fontFamily: "Satoshi", fontSize: 16, ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 159,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);  
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  width: 159,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDE1135),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.login);
                    },
                    child: Text(
                      'Yes, Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
