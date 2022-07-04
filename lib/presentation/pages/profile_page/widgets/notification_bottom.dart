part of 'widgets.dart';

class NotificationBottom extends StatefulWidget {
  const NotificationBottom({Key? key}) : super(key: key);

  @override
  State<NotificationBottom> createState() => _NotificationBottomState();
}

class _NotificationBottomState extends State<NotificationBottom> {
  final bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
        onChanged: (bool value) {
          setState(() {
            NotificationApi.showNotification(
              title: 'roadMap App',
              body: 'Let\'s learn some code',
              payload: 'roadMap.app'
            );
            value = _notificationsEnabled;
          });
        },
        activeColor: ApplicationColor.authIconColor,
        secondary: const Icon(Icons.notifications_active_rounded,
          color: ApplicationColor.textSubTitleColor,
        ),
      ),
    );
  }
}
