import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/notification/presentation/widgets/notification_item.dart';
import 'package:marshmallow/notification/shared/providers.dart';
import 'package:marshmallow/theme/theme.dart';
import 'package:marshmallow/utils/size_utils.dart';

@RoutePage()
class NotificationPage extends ConsumerWidget {
  static const routeName = '/notification';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'NOTIFICATIONS',
          style: TextStyle(
            color: AppColors.black,
            fontFamily: 'Lexend',
            fontSize: Utils.sizeOf(30),
          ),
        ),
        shadowColor: Colors.grey,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: lstDataNotification.length,
        itemBuilder: (context, i) {
          return NotificationItem(
            onTap: () {},
            title: lstDataNotification[i].title,
            content: lstDataNotification[i].body,
            time: lstDataNotification[i].time,
            image: lstDataNotification[i].icon,
            isRead: lstDataNotification[i].isRead,
          );
        },
      ),
    );
  }
}
