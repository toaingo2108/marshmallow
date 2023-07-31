// temple
List<NotificationModel> lstDataNotification = [
  NotificationModel(
    title: 'Hungry?',
    body:
        "Check out our brand new fresh salad collection. We think you'll love it! ",
    time: '12:15 pm',
    icon: 'assets/images/notification_image1.png',
    isRead: false,
  ),
  NotificationModel(
    title: 'Don’t forget me!',
    body: 'Have you forgot your order? It is waiting for you to finish it!',
    time: '12/05',
    icon: 'assets/images/notification_image2.png',
    isRead: false,
  ),
  NotificationModel(
    title: 'Don’t forget me!',
    body: 'Have you forgot your order? It is waiting for you to finish it!',
    time: '05/05',
    icon: 'assets/images/notification_image2.png',
    isRead: false,
  ),
  NotificationModel(
    title: 'Don’t forget me!',
    body: 'Have you forgot your order? It is waiting for you to finish it!',
    time: '05/05',
    icon: 'assets/images/notification_image1.png',
    isRead: true,
  ),
];

class NotificationModel {
  final String title;
  final String body;
  final String time;
  final String icon;
  bool isRead;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.isRead,
  });
}
