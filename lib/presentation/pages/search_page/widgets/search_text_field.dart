part of 'widgets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10.w,
      ),
      child: Container(
        width: 340.w,
        height: 57.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: ApplicationColor.searchBorderColor),
        child: TextField(
          cursorColor: ApplicationColor.white,
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20.sp, color: ApplicationColor.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: ApplicationColor.white,
              fontSize: 20.sp,
            ),
            prefixIcon: IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {},
              color: ApplicationColor.white,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
