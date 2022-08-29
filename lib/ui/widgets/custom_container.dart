import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.isHeader,
    required this.isScrollView,
    this.onTitle = "",
    this.isCenter = false,
    this.isBackButton = false,
    this.isBottomInset = false,
    required this.child,
    this.bottomChild,
    this.floatingButton,
    this.isLoading = false,
    this.isCenterFloatingButton = false,
    this.isShare = false,
    this.onPressedShare,
    this.backgroundColor = Colors.white,
  });

  final bool isHeader;
  final bool isScrollView;
  final String onTitle;
  final bool isBackButton;
  final bool isCenter;
  final bool isBottomInset;
  final Widget child;
  final Widget? bottomChild;
  final Widget? floatingButton;
  final bool isLoading;
  final bool isCenterFloatingButton;
  final bool isShare;
  final Function()? onPressedShare;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.1,
      progressIndicator: SpinKitFadingCircle(color: mainColor),
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        appBar: (isHeader)
            ? _appBar(
                context,
                isCenter,
                appBarColor,
                onTitle,
                isBackButton,
              )
            : null,
        resizeToAvoidBottomInset: isBottomInset,
        body: (isScrollView)
            ? SingleChildScrollView(
                child: child,
              )
            : child,
        bottomNavigationBar: bottomChild,
        floatingActionButton: floatingButton,
        floatingActionButtonLocation: (isCenterFloatingButton)
            ? FloatingActionButtonLocation.centerDocked
            : FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  _appBar(
    BuildContext context,
    bool isCenter,
    Color color,
    String onTitle,
    bool isBackButton,
  ) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Container(
          decoration: BoxDecoration(
            color: appBarColor,
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: (isBackButton)
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
                Container(
                    width: Get.width - 120,
                    child: Align(
                      alignment:
                          (isCenter) ? Alignment.center : Alignment.centerLeft,
                      child: Text(onTitle, style: whiteBoldFontStyle20),
                    )),
                Container(
                  width: 50,
                  child: (isShare)
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: onPressedShare,
                            icon: Icon(
                              FontAwesomeIcons.shareAlt,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
