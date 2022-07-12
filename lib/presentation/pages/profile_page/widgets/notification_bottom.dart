part of 'widgets.dart';

class NotificationBottom extends StatefulWidget {
  const NotificationBottom({Key? key}) : super(key: key);

  @override
  State<NotificationBottom> createState() => _NotificationBottomState();
}

class _NotificationBottomState extends State<NotificationBottom> {
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotification();
    _notificationsEnabled = LocalDatabaseManager.notificationBottomValue;
  }

  void listenNotification() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.pushNamed(context, NavigationBarHome.routeName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.h),
      child: SwitchListTile(
        title: Text(
          ApplicationTextValue.RECEVIED_NOTIFICATION,
          style: TextStyle(
              color: ApplicationColor.textSubTitleColor,
              fontSize: 24.sp,
              fontWeight: ApplicationFont.regular),
        ),
        value: _notificationsEnabled,
        onChanged: (bool value) async {

         await LocalDatabaseManager.setNotificationBottomValue(value);

          if(value) {
            NotificationApi.activateDailyNotification();
          }
          _notificationsEnabled = value;
          setState(() {

          });
        },
        activeColor: ApplicationColor.authIconColor,
        secondary: const Icon(
          Icons.notifications_active_rounded,
          color: ApplicationColor.textSubTitleColor,
        ),
      ),
    );
  }
}
