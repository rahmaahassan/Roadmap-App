part of 'widgets.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar(
      {Key? key, required this.onSelect, required this.index}) : super(key: key);
  final Function onSelect;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 19.h, left: 15.5.w, right: 15.5.w, top: 30.h),
      height: 63.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ApplicationColor.buttonBorderColor,
          onTap: (idx) {
            onSelect(idx);
          }, // new
          currentIndex: index, // new
          selectedItemColor: ApplicationColor.textSubTitleColor,
          unselectedItemColor: ApplicationColor.navDisActiveBottom,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: ApplicationTextValue.NAVIGATION_BAR_HOME_LABEL),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: ApplicationTextValue.NAVIGATION_BAR_NEWS_LABEL),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: ApplicationTextValue.NAVIGATION_BAR_SEARCH_LABEL),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: ApplicationTextValue.NAVIGATION_BAR_PROFILE_LABEL),
          ],
        ),
      ),
    );
  }
}
