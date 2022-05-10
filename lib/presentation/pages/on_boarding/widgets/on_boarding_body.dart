part of 'widgets.dart';

class OnBoardingBody extends StatefulWidget {
   const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: PresentationAssetPath.ON_BOARDING_PAGE1,
        title: ApplicationTextValue.ONBOARDING_PAGE1_TITLE,
        body: ApplicationTextValue.ONBOARDING_PAGE1_BODY),
    BoardingModel(
        image: PresentationAssetPath.ON_BOARDING_PAGE2,
        title: ApplicationTextValue.ONBOARDING_PAGE2_TITLE,
        body: ApplicationTextValue.ONBOARDING_PAGE2_BODY),
    BoardingModel(
        image: PresentationAssetPath.ON_BOARDING_PAGE3, title: '', body: ''),
  ];

  bool isLast = false;

  void submit() {
    // SharedPreferenceUtils.getString(
    //   'onBoarding',
    //   true,
    // ).then((value)
    // {
    //   if (value) {
    //     // navigateAndFinish(
    //     //   context,
    //     //   ShopLoginScreen(),
    //     // );
    //   }
    // });
  } /// TODO

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: ExpandingDotsEffect(
                  dotColor: ApplicationColor.onBoardingDotColor,
                  activeDotColor: ApplicationColor.onBoardingActiveDotColor,
                  dotHeight: 15.h,
                  expansionFactor: 1.01.r,
                  dotWidth: 15.w,
                  spacing: 17.w,
                ),
                count: boarding.length,
              ),
              SizedBox(width: 123.w,),
              FloatingActionButton(
                onPressed: () {
                  if (isLast)
                  {
                    submit();
                  } else {
                    boardController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: ApplicationColor.onBoardingActiveDotColor,
                ),
                backgroundColor: ApplicationColor.onBoardingDotColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

   Widget buildBoardingItem(BoardingModel model) => Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Center(
         child: SizedBox(

           child: ApplicationSVG.image(image: model.image),
         ),
       ),
       SizedBox(
         height: 10.h,
       ),
       Center(
         child: Text(
           '${model.title}',
           style: TextStyle(
               fontSize: 24.sp,
               fontWeight: ApplicationFont.bold,
               color: ApplicationColor.textTitleColor),
         ),
       ),
       SizedBox(
         height: 30.h,
       ),
       Text(
         '${model.body}',
         style: TextStyle(
             fontSize: 18.sp,
             fontWeight: ApplicationFont.regular,
             color: ApplicationColor.textTitleColor),
       ),
     ],
   );
}
