part of 'shared_widgets.dart';

class ApplicationBackButton extends StatelessWidget {
  final Color boxColor;
  final Color arrowColor;
  final bool showAuthIcon;
  const ApplicationBackButton(
      {Key? key,
      required this.boxColor,
      required this.arrowColor,
      this.showAuthIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: showAuthIcon? 84.w:41.52.w,
        height: showAuthIcon? 84.h:41.52.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: boxColor,
        ),
        child: Center(
            child: Icon(
              Icons.arrow_back_rounded,
              color: arrowColor,
              size: showAuthIcon ? 25.r : 50.r,
            )
        )
      ),
    );
  }
}
