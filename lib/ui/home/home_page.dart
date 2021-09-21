import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/common/theme/_theme.dart';
import 'package:mecar_test/common/theme/textStyle.dart';
import 'package:mecar_test/common/widget/my_text_view.dart';
import 'package:mecar_test/ui/base/base_widget.dart';
import 'package:mecar_test/utils/localization.dart';
import 'package:mecar_test/utils/uiUtil.dart';
import 'package:mecar_test/utils/utils.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  HomeScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}



class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc = sl<HomeBloc>();

  @override
  void initState() {
    super.initState();
    //Call this method first when LoginScreen init
    _homeBloc.listen(onStateChange);

  }

  //this function work for Android
  Future<bool> onBackPress() {
    return Future(() => false);
  }

  Future<void> onStateChange(HomeState state) async {

  }

  Widget buildScreenListImage(HomeState state) {
    var localization = Localization.of(context);
    List<String> listImageName = new List();
    for (int i = 0; i < state.listImageLength; i++) {
      listImageName.add("assets/image/image_" + i.toString() + ".jpg");
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            MyTextView(
              textAlign: TextAlign.start,
              text: localization.trans(Lang.discover),
              textStyle: textLargexxx.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32,),
            MyTextView(
              textAlign: TextAlign.start,
              text: localization.trans(Lang.what_new),
              textStyle: textSmallxx.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 24,),
            makeImageWidget("assets/image/what_new_image.jpg", width: MediaQuery.of(context).size.width - 32, height: MediaQuery.of(context).size.width - 32),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                makeCircleImageWidget("assets/image/home_avatar.jpg", size: 30),
                SizedBox(width: 8,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextView(
                      text: "Ridhwan Nordin",
                      textAlign: TextAlign.start,
                      textStyle: textSmallxx.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 3,),
                    MyTextView(
                      text: "@ridzjcob",
                      textAlign: TextAlign.start,
                      textStyle: textSmallx.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 48,),
            MyTextView(
              textAlign: TextAlign.start,
              text: localization.trans(Lang.browse_all),
              textStyle: textSmallxx.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 24,),
            StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisCount: 4,
                itemCount: state.listImageLength,
                itemBuilder: (BuildContext context, int index) => Image.asset(listImageName[index]),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
            ),
            SizedBox(height: 32,),
            state.listImageLength < 30 ? Container(
              height: 52,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: MyTextView(
                      textAlign: TextAlign.center,
                      text: localization.trans(Lang.see_more),
                      textStyle: textSmallxx.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _homeBloc.add(SeeMoreButtonPressed(maxLength: state.listImageLength + 10));
                  }
              ),
            ) : Container(),
            SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: BlocProvider(
          create: (_) => _homeBloc,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return  Scaffold(
                  resizeToAvoidBottomInset: true,
                  bottomNavigationBar: BottomNavigationBar(
                    elevation: 2,
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    onTap: (int index) {
                      _homeBloc.add(ChangeTab(position: index));
                    },
                    currentIndex: state.tabPosition,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                          label: "Home",
                          icon: state.tabPosition != 0 ?
                          makeImageWidget("assets/icon/home_icon.png", height: 15, width: 15, color: Colors.black) :
                          Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFFF00D6),
                                  Color(0xFFFF4D00),
                                ]
                              )
                            ),
                            child: Center(
                              child: makeImageWidget("assets/icon/home_icon.png", height: 15, width: 15, color: Colors.white),
                            ),
                          ),
                      ),
                      BottomNavigationBarItem(
                        label: "Search",
                        icon: state.tabPosition != 1 ?
                        makeImageWidget("assets/icon/search_icon.png", height: 15, width: 15, color: Colors.black) :
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFF00D6),
                                    Color(0xFFFF4D00),
                                  ]
                              )
                          ),
                          child: Center(
                            child: makeImageWidget("assets/icon/search_icon.png", height: 15, width: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Plus",
                        icon: state.tabPosition != 2 ?
                        makeImageWidget("assets/icon/plus_icon.png", height: 15, width: 15, color: Colors.black) :
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFF00D6),
                                    Color(0xFFFF4D00),
                                  ]
                              )
                          ),
                          child: Center(
                            child: makeImageWidget("assets/icon/plus_icon.png", height: 15, width: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Comment",
                        icon: state.tabPosition != 3 ?
                        makeImageWidget("assets/icon/comment_icon.png", height: 15, width: 15, color: Colors.black) :
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFF00D6),
                                    Color(0xFFFF4D00),
                                  ]
                              )
                          ),
                          child: Center(
                            child: makeImageWidget("assets/icon/comment_icon.png", height: 15, width: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Person",
                        icon: state.tabPosition != 4 ?
                        makeImageWidget("assets/icon/person_icon.png", height: 15, width: 15, color: Colors.black) :
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFF00D6),
                                    Color(0xFFFF4D00),
                                  ]
                              )
                          ),
                          child: Center(
                            child: makeImageWidget("assets/icon/person_icon.png", height: 15, width: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  body: IndexedStack(
                    index: state.tabPosition,
                    children: [
                      Container(color: Colors.green,),
                      Container(color: Colors.blue,),
                      buildScreenListImage(state),
                      Container(color: Colors.red,),
                      Container(color: Colors.yellow,),
                    ],
                  )

              );
            },
          ),

        )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _homeBloc.close();
    super.dispose();
  }
}
