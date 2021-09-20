import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/common/theme/theme_color.dart';
import 'package:mecar_test/ui/base/bloc/base_bloc.dart';
import 'package:mecar_test/ui/splash/splash_page.dart';
import 'package:mecar_test/utils/localization.dart';
import 'package:mecar_test/utils/myCustomRoute.dart';

void main() async{

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    /* set Status bar color in Android devices. */
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    /* set Status bar icons color in Android devices.*/
    statusBarBrightness:
    Brightness.dark, /* set Status bar icon color in iOS. */
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.inject();
  runApp(BlocProvider<BaseBloc>(
    create: (_) => sl<BaseBloc>(),
    child: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {
    MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mecar test',
          localizationsDelegates: [
            const LocalizationDelegate(),
          ],
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            if (locale == null) {
              print("*language locale is null!!!");
              return supportedLocales.first;
            }
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode ||
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          supportedLocales: [
            const Locale('en', 'US'),
          ],
          onGenerateRoute: myRoute,
          theme: ThemeData(),
          themeMode: ThemeMode.system,
          darkTheme: ThemeData.dark(),
          home: SplashScreen(),
        ));
  }

}
