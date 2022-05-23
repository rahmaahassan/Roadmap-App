part of 'widgets.dart';

class NotificationBottom extends StatelessWidget {
  const NotificationBottom({Key? key}) : super(key: key);

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
          // setState(() {
          //   _notificationsEnabled = value;
          // });
        },
        activeColor: ApplicationColor.authIconColor,
        secondary: const Icon(Icons.notifications_active_rounded,
          color: ApplicationColor.textSubTitleColor,
        ),
      ),
    );
  }
}
