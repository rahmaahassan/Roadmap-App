part of 'shared_widgets.dart';

class ApplicationBackButton extends StatelessWidget {
  final Color boxColor;
  final Color arrowColor;
  final bool showAuthIcon;
  final Function? onTap;
  const ApplicationBackButton(
      {Key? key,
      required this.boxColor,
      required this.arrowColor,
      this.showAuthIcon = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAuthIcon ? onTap :  Navigator.pop(context),
      child: Container(
        width: showAuthIcon? 84.w:30.w,
        height: showAuthIcon? 84.h: 30.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: boxColor,
        ),
        child: Center(
            child: Icon(
              showAuthIcon ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded ,
              color: arrowColor,
              size: showAuthIcon ? 35.r : 40.r,
            )
        )
      ),
    );
  }
}
