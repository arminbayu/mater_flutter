import 'package:master/shared/theme.dart';
import 'package:master/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final slideList = [
  'assets/images/slide_1.jpg',
  'assets/images/slide_2.jpg',
  'assets/images/slide_3.jpg',
  'assets/images/slide_4.jpg'
];

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: Get.height / 100 * 67,
                decoration: new BoxDecoration(
                  color: Color(0xFF42b7ea),
                  border: Border.all(
                    color: Color(0xFF42b7ea),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
              ),
              Container(
                height: 20,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slideList.length; i++)
                      if (i == _currentPage)
                        SlideDots(true)
                      else
                        SlideDots(false)
                  ],
                ),
              ),
              CustomButton(
                onPressed: () => Get.toNamed("/home"),
                onText: Text('getting'.tr, style: whiteBoldFontStyle16),
                margin: EdgeInsets.all(40),
                onRadius: 50,
                isActive: true,
                btnColor: mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;
  static double? screenWidth;
  static double? screenHeight;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    screenWidth = Get.width;
    screenHeight = Get.height / 100 * 65;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage(slideList[index]),
          width: screenWidth,
          height: screenHeight,
        )
      ],
    );
  }
}

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? mainColor : greyColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
