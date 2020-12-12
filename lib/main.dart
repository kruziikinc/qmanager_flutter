import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qmanagement/screen/CustomerHomeScreen.dart';
import 'package:qmanagement/screen/ForgotPasswordScreen.dart';
import 'package:qmanagement/screen/NotificationsScreen.dart';
import 'package:qmanagement/screen/Profile.dart';
import 'package:qmanagement/screen/SignUpScreen.dart';
import 'package:qmanagement/screen/SplashScreen.dart';
import 'package:qmanagement/screen/changePassword.dart';
import 'package:qmanagement/utils/AppColors.dart';
import 'package:qmanagement/utils/AppLanguage.dart';
import 'package:qmanagement/utils/AppLocalizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (context) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            SignUpScreen.routeName: (_) => SignUpScreen(),
            CustomerHomeScreen.routeName: (_) => CustomerHomeScreen(),
            ForgotPasswordScreen.routeName: (_) => ForgotPasswordScreen(),
            ChangePassword.routeName: (_) => ChangePassword(),
            Profile.routeName: (_) => Profile(),
            NotificationsScreen.routeName: (_) => NotificationsScreen(),
          },
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: AppColors.primaryColor,
            accentColor: AppColors.accentColor,
            toggleableActiveColor: Colors.red,

            // Define the default font family.
            fontFamily: 'OpenSans',
          ),
          //locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          home: AppLang(),
        );
      }),
    );
  }
}

class AppLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Scaffold(body: SplashScreen());
  }
}
