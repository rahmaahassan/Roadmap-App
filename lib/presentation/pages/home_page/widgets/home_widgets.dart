part of 'widgets.dart';

Widget buildCategory() {
  return Padding(
    padding: EdgeInsets.all(20.r),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ApplicationTextValue.HEADER_LANGUAGES_TITLE,
            style: TextStyle(
                color: ApplicationColor.textSubTitleColor,
                fontWeight: ApplicationFont.bold,
                fontSize: 18.sp)),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 123.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap: () => navigateTo(context, const CourseDescriptionPage()),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 35.r,
                          child: const Text(
                            ApplicationTextValue.COURSE_NAME,
                            style: TextStyle(
                                color: ApplicationColor.textSubTitleColor,
                                fontWeight: ApplicationFont.bold),
                          ),
                          backgroundColor: ApplicationColor.searchBorderColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Text(ApplicationTextValue.COURSE_NAME,
                          style: TextStyle(
                              color: ApplicationColor.textSubTitleColor,
                              fontWeight: ApplicationFont.regular,
                              fontSize: 16.sp)),
                    ],
                  ),
                ],
              ),
            ),
            itemCount: 5,
          ),
        ),
      ],
    ),
  );
}

Widget myDivider() => Divider(
      thickness: 2,
      color: Colors.grey,
      indent: 20.w,
      endIndent: 20.w,
    );
