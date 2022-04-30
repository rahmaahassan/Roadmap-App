part of 'widgets.dart';

Widget searchItemBuilder(list, context, {isSearch = false}) {
  if (list.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  } else if (isSearch) {
    return Container();
  } else {
    ListView.builder(
        itemBuilder: (context, index) => buildSearchItem(list[index], context),
        itemCount: list.length);
  }
  return null!;
}

Widget buildSearchItem(article, context) => InkWell(
      onTap: () {},

      /// TODO
      child: Padding(
        padding: EdgeInsets.all(23.r),
        child: Container(
            width: 369.w,
            height: 64.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: ApplicationColor.navDisActiveBottom)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.w),
                  child: Text(ApplicationTextValue.SEARCH_ITEM,
                      style: TextStyle(
                          color: ApplicationColor.textSubTitleColor,
                          fontWeight: ApplicationFont.regular,
                          fontSize: 23.sp)),
                ),
                Padding(
                  padding: EdgeInsets.all(14.r),
                  child: const ApplicationBackButton(
                    arrowColor: ApplicationColor.primaryColor,
                    boxColor: ApplicationColor.textSubTitleColor,
                    showAuthIcon: true,
                  ),
                )
              ],
            )),
      ),
    );
