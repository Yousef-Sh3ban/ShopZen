import 'dart:developer';

import 'package:base/features/notifaction/domain/models/notifaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  List<NotifactionModel> notifactionList;

  NotificationWidget({
    super.key,
    required this.notifactionList,
  });

  @override
  Widget build(BuildContext context) {
    log("number of elemnts in the list is ${notifactionList.length}");
    log("before listview bulider");
    return ListView.builder(
      itemCount: notifactionList.length,
      itemBuilder: (BuildContext context, int index) {
        log("start listview bulider");
        log(index.toString());
        return Column(
          children: [
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(notifactionList[index].iconUrl),
                SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifactionList[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      Text(
                        notifactionList[index].message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF68656E),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            index != notifactionList.length - 1
                ? Divider(height: 0,color: Color(0xFFE6E6E6),)
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
