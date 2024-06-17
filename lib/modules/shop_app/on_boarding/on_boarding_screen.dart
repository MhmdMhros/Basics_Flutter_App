import 'package:myapp/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:myapp/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,

});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boardingmodel1 = [
    BoardingModel(
        image: 'assets/onboarding_1.jpeg',
        title: 'On Boarding 1 Title',
        body: 'On Boarding 1 Body',
    ),
    BoardingModel(
      image: 'assets/onboarding_1.jpeg',
      title: 'On Boarding 2 Title',
      body: 'On Boarding 2 Body',
    ),
    BoardingModel(
      image: 'assets/onboarding_1.jpeg',
      title: 'On Boarding 3 Title',
      body: 'On Boarding 3 Body',
    ),

  ];

  var boardingcontroler = PageController();

  bool islast = false;
  void submit(){
    CacheHelper.SaveData(key: 'onBoarding', value: true).then((value){
      if (value) {
        NavigateToAndReplacement(context, ShopLoginScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: (){
              submit();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardingcontroler,
              onPageChanged: (index){
                if(index == boardingmodel1.length-1){
                  setState(() {
                    islast = true;
                  });
                  // print('last');
                }
                else{
                  setState(() {
                    islast = false;
                  });
                  // print('not last');
                }
              },
              itemBuilder: (context,index) => BuildBoardingItem(boardingmodel1[index]),
              itemCount: boardingmodel1.length,
            )),
            SizedBox(height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingcontroler,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                    activeDotColor: Colors.deepOrange,
                    expansionFactor: 4,
                  ),
                  count: boardingmodel1.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(islast){
                      submit();
                    }
                    else{
                      boardingcontroler.nextPage(
                        duration: Duration(
                        milliseconds: Duration.millisecondsPerSecond,
                      ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: Image(image: AssetImage(
          '${model.image}',
        ),),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
