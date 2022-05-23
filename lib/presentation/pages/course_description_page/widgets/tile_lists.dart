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
      itemBuilder: (context, index) =>
          TimelineTile(
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
                        border: Border.all(
                            color: ApplicationColor.textTitleColor)),
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
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Column(
                    children: [
                      Container(
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
                                child: Column(
                                          children: steps[index].courses.map<Widget>((stepCourse) => InkWell(
                                            onTap: () async {
                                              if (!await launchUrl(Uri.parse(steps[index].courses[index].url))) {
                                                throw 'Could not launch book link';
                                              }
                                            },
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "- " + stepCourse.title,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: ApplicationFont
                                                      .regular,
                                                  decoration: TextDecoration
                                                      .underline,
                                                  color: ApplicationColor
                                                      .textSubTitleColor,
                                                  height: 2
                                                ),
                                              ),
                                            ),
                                          )).toList(),
                                        ),

                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9.0.h,
                      ),
                      Container(
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
                                  color: ApplicationColor
                                      .textSubTitleColor,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: steps[index].books.map<Widget>((stepCourse) => InkWell(
                                    onTap: () async {
                                      if (!await launchUrl(Uri.parse(steps[index].books[index].url))) {
                                        throw 'Could not launch book link';
                                      }
                                    },
                                    child: Text(
                                      "- " + stepCourse.title,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: ApplicationFont
                                            .regular,
                                        decoration: TextDecoration
                                            .underline,
                                        color: ApplicationColor
                                            .textSubTitleColor,
                                      ),
                                    ),
                                  )).toList(),
                                ),

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      itemCount: steps.length,
    );
  }

void onBookTapped() {}

  /// TODO


}
