part of 'widgets.dart';

class TileList extends StatelessWidget {
  const TileList({Key? key, required this.steps}) : super(key: key);

  final List<StepModel> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => TimelineTile(
        isFirst: index == 0,
        isLast: index == steps.length - 1,
        indicatorStyle: IndicatorStyle(
          height: 50.h,
          width: 50.w,
          indicatorXY: 0.45.r,
          indicator: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ApplicationColor.primaryColor,
                border: Border.all(color: ApplicationColor.primaryColor)),
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ApplicationColor.textTitleColor)),
                child: const Icon(Icons.apps,
                    color: ApplicationColor.textTitleColor)),
          ),
        ),
        endChild: ExpansionTile(
          trailing: const SizedBox(),
          title: Text(
            steps[index].name,
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: ApplicationFont.bold,
                color: ApplicationColor.textTitleColor,
                height: 1.2),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Column(
                children: [
                  steps[index].courses.isNotEmpty
                      ? Container(
                    height: 149.h,
                    width: 266.w,
                    decoration: BoxDecoration(
                      color: ApplicationColor.buttonBorderColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ApplicationTextValue.COURSES_BOK,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: ApplicationFont.medium,
                              color: ApplicationColor.textSubTitleColor,
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: steps[index]
                                    .courses
                                    .map<Widget>((stepCourse) => InkWell(
                                          onTap: () async {
                                            if (!await launchUrl(
                                                Uri.parse(stepCourse.url))) {
                                              throw 'Could not launch course link';
                                            }
                                            print(steps[index]
                                                .courses[index]
                                                .url);
                                          },
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              "- " + stepCourse.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      ApplicationFont.regular,
                                                  color: ApplicationColor
                                                      .textSubTitleColor,
                                                  height: 3),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                      : Container(),
                  SizedBox(
                    height: 9.0.h,
                  ),
                  steps[index].books.isNotEmpty
                      ? Container(
                          height: 149.h,
                          width: 266.w,
                          decoration: BoxDecoration(
                            color: ApplicationColor.buttonBorderColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ApplicationTextValue.BOOKS_BOK,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: ApplicationFont.medium,
                                    color: ApplicationColor.textSubTitleColor,
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: steps[index]
                                          .books
                                          .map<Widget>((stepBook) => InkWell(
                                                onTap: () async {
                                                  if (!await launchUrl(
                                                      Uri.parse(
                                                          stepBook.url))) {
                                                    throw 'Could not launch book link';
                                                  }
                                                  print(steps[index]
                                                      .books[index]
                                                      .url);
                                                },
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    "- " + stepBook.title,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            ApplicationFont
                                                                .regular,
                                                        color: ApplicationColor
                                                            .textSubTitleColor,
                                                        height: 3),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
      itemCount: steps.length,
    );
  }
}
