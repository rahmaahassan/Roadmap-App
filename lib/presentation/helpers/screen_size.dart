part of 'presentation_helpers.dart';
class ApplicationScreenSize{

  static double widthOf(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heightOf(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double topPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static Size get viewPortSize =>
      const Size(414, 896);
}