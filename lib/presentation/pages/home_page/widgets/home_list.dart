part of 'widgets.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
      if (state is CategoriesSuccessState) {
        return ListView.separated(
            itemBuilder: (context, categoryIndex) => Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 20.h, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.categories[categoryIndex].title,
                          style: TextStyle(
                              color: ApplicationColor.textSubTitleColor,
                              fontWeight: ApplicationFont.bold,
                              fontSize: 18.sp)),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 120.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, courseIndex) => InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, CourseDescriptionPage.routeName,
                                arguments: {
                                  "course": state.categories[categoryIndex]
                                      .courses[courseIndex],
                                }),
                            borderRadius: BorderRadius.circular(25.r),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    height: 70.h,
                                    width: 70.w,
                                    imageUrl: state.categories[categoryIndex]
                                        .courses[courseIndex].image.isEmpty ? "https://0.0.0.0/" : state.categories[categoryIndex]
                                        .courses[courseIndex].image,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          //AssetImage(PresentationAssetPath.ACTIVITY_DEFAULT),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ApplicationColor.white),
                                        color: ApplicationColor.primaryColor,
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.all(10.h),
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 3.0,
                                        ),
                                      )),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ApplicationColor.white),
                                        color: PresentationHelperFunctions
                                            .generateRandomColor,
                                      ),
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                              state.categories[categoryIndex]
                                                  .courses[courseIndex].title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: ApplicationColor.white,
                                                  fontWeight:
                                                      ApplicationFont.regular,
                                                  fontSize: 15.sp)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                      state.categories[categoryIndex]
                                          .courses[courseIndex].title,
                                      style: TextStyle(
                                          color: ApplicationColor
                                              .textSubTitleColor,
                                          fontWeight: ApplicationFont.regular,
                                          fontSize: 14.sp,
                                          letterSpacing: 1)),
                                ],
                              ),
                            ),
                          ),
                          itemCount:
                              state.categories[categoryIndex].courses.length,
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 20.w,
                  endIndent: 20.w,
                ),
            itemCount: state.categories.length);
      } else if (state is CategoriesFailureState) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
