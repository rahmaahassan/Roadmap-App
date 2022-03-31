part of 'presentation_helpers.dart';

class ApplicationSVG {
  final Color color;
  final double width, height;

  ApplicationSVG({
    required this.color,
    required this.width,
    required this.height
  });

  static Widget icon({required String icon, Color? color, double? width, double? height, Alignment? alignment}){
    return Container(
      alignment: alignment??Alignment.center,
      width: width,
      height: height,
      child: SvgPicture.asset(
        icon,
        width: width,
        height: height,
        color: color,
      ),
    );
  }

  static Widget image({required String image, Color? color, double? width, double? height}){
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        image,
        width: width,
        height: height,
        color: color,
        fit: BoxFit.fill,
      ),
    );
  }
}
