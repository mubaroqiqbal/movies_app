import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/constants/sizes.dart';
import 'package:movies_app/ui/dashboard/dashboard_page.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'global-observer',
      builder: (context) {
        return ScreenUtilInit(
          designSize: Size(Sizes.appSreenWidth, Sizes.appScreenHeight),
          builder: (context, widget) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Movies App",
            locale: Locale("id"),
            localizationsDelegates: [
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: DashboardPage(),
          ),
        );
      },
    );
  }
}
