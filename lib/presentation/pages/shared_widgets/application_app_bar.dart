part of 'shared_widgets.dart';

class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const ApplicationAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(53.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: ApplicationColor.textSubTitleColor, fontWeight: ApplicationFont.bold),),
      centerTitle: false,
      shadowColor: Colors.white54,
      elevation: 5,
    );
  }
}
