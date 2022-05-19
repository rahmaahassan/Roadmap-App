part of 'widgets.dart';


class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
          if(state is CategoriesSuccessState){
            return ListView.separated(
                itemBuilder: (context, categoryIndex) => Padding(
                  padding: EdgeInsets.only(left: 14.w, top: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          state.categories[categoryIndex].title,
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
                          itemBuilder: (context, courseIndex) => InkWell(
                            onTap: () => Navigator.pushNamed(context, CourseDescriptionPage.routeName, arguments: state.categories[categoryIndex].courses[courseIndex]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.r),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 35.r,
                                        backgroundImage: NetworkImage(state.categories[categoryIndex].courses[courseIndex].image),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    Text(state.categories[categoryIndex].courses[courseIndex].title,
                                        style: TextStyle(
                                            color: ApplicationColor.textSubTitleColor,
                                            fontWeight: ApplicationFont.regular,
                                            fontSize: 16.sp)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          itemCount: state.categories[categoryIndex].courses.length,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  color: Colors.grey,
                  indent: 14.w,
                  endIndent: 14.w,
                ),
                itemCount: state.categories.length
            );
          } else if(state is CategoriesFailureState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}
