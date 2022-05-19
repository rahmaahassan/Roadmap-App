part of 'widgets.dart';

class SearchTextField extends StatefulWidget {

  final Function(String) onChanged;

   const SearchTextField({super.key, required this.onChanged});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 370.w,
        height: 57.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: ApplicationColor.searchBorderColor),
        child: TextField(
          onChanged: widget.onChanged,
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
