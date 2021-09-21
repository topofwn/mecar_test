

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/common/theme/_theme.dart';

import 'package:mecar_test/common/theme/textStyle.dart';
import 'package:mecar_test/common/widget/my_text_view.dart';
import 'package:mecar_test/data/repository/user_repository.dart';
import 'package:mecar_test/ui/base/bloc/base_bloc.dart';
import 'package:mecar_test/ui/login/login_page.dart';
import 'package:mecar_test/ui/register/register_page.dart';
import 'package:mecar_test/utils/localization.dart';
import 'package:mecar_test/utils/navigate_util.dart';
import 'package:mecar_test/utils/uiUtil.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  SplashScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen> {
  BaseBloc _baseBloc = sl<BaseBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBasicInfo();
  }

  void initBasicInfo() {
   _baseBloc.add(Init());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localization = Localization.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/image/background_image.png"
              ),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 20),
            child: Column(

              children: [
                Expanded(
                  child: makeImageWidget("assets/image/splash.png", width: MediaQuery.of(context).size.width / 2, height: 70),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          makeCircleImageWidget("assets/image/avatar.png", size: 30),
                          SizedBox(width: 8,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                text: "Pawel Czerwinski",
                                textAlign: TextAlign.start,
                                textStyle: textSmallxx.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),
                              ),
                              SizedBox(height: 3,),
                              MyTextView(
                                text: "@pawel_czerwinski",
                                textAlign: TextAlign.start,
                                textStyle: textSmallx.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.8)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              NavigateUtil.openPage(context, LoginScreen.routeName);
                            },
                            child: Container(
                              width: ((MediaQuery.of(context).size.width - 30) / 2) - 10,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black, width: 2)
                              ),
                              child: Center(
                               child: MyTextView(
                                 text: localization.trans(Lang.log_in_in_splash),
                                 textAlign: TextAlign.center,
                                 textStyle: textSmallx.copyWith(
                                   fontWeight: FontWeight.w900,
                                   color: Colors.black,
                                 ),

                               ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigateUtil.openPage(context, RegisterScreen.routeName);
                            },
                            child: Container(
                              width: ((MediaQuery.of(context).size.width - 30) / 2) - 10,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.black, width: 2)
                              ),
                              child: Center(
                                child: MyTextView(
                                  text: localization.trans(Lang.register_splash),
                                  textAlign: TextAlign.center,
                                  textStyle: textSmallx.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}