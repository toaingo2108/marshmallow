import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';
import 'package:marshmallow/utils/size_utils.dart';

class NotificationItem extends StatefulWidget {
  final Function()? onTap;
  final String? title;
  final String? content;
  final String? time;
  final String? image;
  final bool isRead;
  const NotificationItem({
    super.key,
    this.onTap,
    this.title,
    this.content,
    this.time,
    this.image,
    required this.isRead,
  });

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isReadItem = false;
  @override
  void initState() {
    isReadItem = widget.isRead;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isReadItem = true;
        });
      },
      child: Container(
        color:
            isReadItem ? AppColors.whiteBackground : AppColors.secondaryColor,
        padding:
            EdgeInsets.only(left: Utils.sizeOf(30), right: Utils.sizeOf(30)),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: Utils.sizeOf(90),
                  height: Utils.sizeOf(90),
                  margin: EdgeInsets.only(
                    right: Utils.sizeOf(20),
                    top: Utils.sizeOf(20),
                    bottom: Utils.sizeOf(20),
                  ),
                  child: Image.asset(
                    widget.image ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: isReadItem
                      ? AppColors.whiteBackground.withOpacity(0.5)
                      : Colors.transparent,
                  width: Utils.sizeOf(90),
                  height: Utils.sizeOf(90),
                  margin: EdgeInsets.only(
                    right: Utils.sizeOf(20),
                    top: Utils.sizeOf(20),
                    bottom: Utils.sizeOf(20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? '',
                    style: TextStyle(
                      color: isReadItem
                          ? AppColors.textReadNotification
                          : AppColors.black,
                      fontFamily: 'Lexend',
                      fontSize: Utils.sizeOf(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Utils.sizeOf(10),
                  ),
                  Text(
                    widget.content ?? '',
                    style: TextStyle(
                      color: isReadItem
                          ? AppColors.textReadNotification
                          : AppColors.black,
                      fontFamily: 'Lexend',
                      fontSize: Utils.sizeOf(18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Utils.sizeOf(90),
              margin: EdgeInsets.only(left: Utils.sizeOf(58)),
              alignment: Alignment.topLeft,
              child: Text(
                widget.time ?? '',
                style: TextStyle(
                  color: isReadItem
                      ? AppColors.textReadNotification
                      : AppColors.black,
                  fontFamily: 'Lexend',
                  fontSize: Utils.sizeOf(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
