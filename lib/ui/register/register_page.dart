import 'package:flutter/material.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/common/theme/lang_const.dart';
import 'package:mecar_test/common/theme/textStyle.dart';
import 'package:mecar_test/common/widget/my_text_view.dart';
import 'package:mecar_test/ui/login/login_page.dart';
import 'package:mecar_test/utils/localization.dart';
import 'package:mecar_test/utils/navigate_util.dart';
import 'package:mecar_test/utils/toastUtil.dart';
import 'package:mecar_test/utils/uiUtil.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  RegisterScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final RegisterBloc _registerBloc = sl<RegisterBloc>();
  TextEditingController _userController, _passController, _rePassController;

  @override
  void initState() {
    super.initState();
    //Call this method first when LoginScreen init
    _userController = new TextEditingController();
    _passController = new TextEditingController();
    _rePassController = new TextEditingController();
    _registerBloc.listen(onStateChange);
  }

  Future<void> onStateChange(RegisterState state) async {
    if (state.status != null) {
      switch (state.status) {
        case RegisterStatus.success:
        //TODO: go to home page
          ToastUtil.showToast("Register success");
         NavigateUtil.openPage(context, LoginScreen.routeName);
          break;
        case RegisterStatus.fail:
          {
            if (state.isUserNameExist) {
              ToastUtil.showToast("Username have been already existed");
            } else if (!state.isUserNameValid) {
              ToastUtil.showToast("Username is invalid");
            } else if (!state.isPasswordValid) {
              ToastUtil.showToast("Password is invalid");
            } else if (!state.isPasswordTheSame) {
              ToastUtil.showToast("Password and re-password are not the same");
            }
          }
          break;
        default:
      }
    }
  }

  void doRegister(String userName, String pass, String rePass) {
    _registerBloc.add(RegisterButtonPress(userName: userName, password: pass, rePassword: rePass));
  }

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            NavigateUtil.pop(context);
          },
          child: makeImageWidget("assets/image/back_icon.png", width: 15, height: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              MyTextView(
                text: localization.trans(Lang.register),
                textAlign: TextAlign.start,
                textStyle: textLargexxx.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32,),
              TextFormField(
                controller: _userController,
                textAlign: TextAlign.start,
                maxLines: 1,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.visiblePassword,
                style: textSmallxxx.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  filled: false,
                  contentPadding: EdgeInsets.only(left: 17, top: 17, bottom: 17),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),

                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _passController,
                textAlign: TextAlign.start,
                maxLines: 1,
                obscureText: true,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.visiblePassword,
                style: textSmallxxx.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  filled: false,
                  contentPadding: EdgeInsets.only(left: 17, top: 17, bottom: 17),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),

                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: _rePassController,
                textAlign: TextAlign.start,
                maxLines: 1,
                obscureText: true,
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.visiblePassword,
                style: textSmallxxx.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  filled: false,
                  contentPadding: EdgeInsets.only(left: 17, top: 17, bottom: 17),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),

                ),
              ),
              SizedBox(height: 16,),
              Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Colors.black,
                    child: Center(
                      child: MyTextView(
                        textAlign: TextAlign.center,
                        text: localization.trans(Lang.register_splash),
                        textStyle: textSmallxx.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onPressed: () {
                      doRegister(_userController.text, _passController.text, _rePassController.text);
                    },
                  )
              ),
              SizedBox(height: 32,),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: localization.trans(Lang.by_sign_up) + " ",
                    style: textSmallxx.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: localization.trans(Lang.term_of_service) + " ",
                        style: textSmallxx.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        )
                      ),
                      TextSpan(
                          text: localization.trans(Lang.and) + " ",
                          style: textSmallxx.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )
                      ),
                      TextSpan(
                          text: localization.trans(Lang.privacy_policy),
                          style: textSmallxx.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          )
                      ),
                      TextSpan(
                          text: ".",
                          style: textSmallxx.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _registerBloc.close();
    super.dispose();
  }
}
