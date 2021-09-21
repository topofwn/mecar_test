import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/common/theme/lang_const.dart';
import 'package:mecar_test/common/theme/textStyle.dart';
import 'package:mecar_test/common/widget/my_text_view.dart';
import 'package:mecar_test/ui/home/home_page.dart';
import 'package:mecar_test/ui/login/bloc/login_bloc.dart';
import 'package:mecar_test/utils/localization.dart';
import 'package:mecar_test/utils/navigate_util.dart';
import 'package:mecar_test/utils/toastUtil.dart';
import 'package:mecar_test/utils/uiUtil.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  LoginScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = sl<LoginBloc>();
  TextEditingController _userNameController, _passController;

  @override
  void initState() {
    super.initState();
    //Call this method first when LoginScreen init
    _userNameController = new TextEditingController();
    _passController = new TextEditingController();
    _loginBloc.listen(onStateChange);
  }

  Future<void> onStateChange(LoginState state) async {
    if (state.status != null) {
      switch (state.status) {
        case LoginStatus.success:
         //TODO: go to home page
         NavigateUtil.openPage(context, HomeScreen.routeName);
          break;
        case LoginStatus.fail:
          ToastUtil.showToast('Login failed. Please try again');
          break;
        default:
      }
    }
  }

  void doLogin(String userName, String pass) {
    _loginBloc.add(LoginButtonPressed(email: userName, password: pass));
  }

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return SafeArea(
      child: Scaffold(
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
                  text: localization.trans(Lang.log_in),
                  textAlign: TextAlign.start,
                  textStyle: textLargexxx.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32,),
                TextFormField(
                  controller: _userNameController,
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
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    doLogin(_userNameController.text, _passController.text);
                  },
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
                        text: localization.trans(Lang.log_in_in_splash),
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
                      doLogin(_userNameController.text, _passController.text);
                    },
                  )
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.close();
    super.dispose();
  }
}
