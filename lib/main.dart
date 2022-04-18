import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shiper/config/app_colors.dart';
import 'package:shiper/config/app_constants.dart';
import 'package:shiper/generated/l10n.dart';
import 'package:shiper/providers/store.dart';
import 'package:shiper/screens/login_screen.dart';
import 'package:shiper/screens/main_screen.dart';
import 'package:shiper/screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstants.designWidth,
          AppConstants.designHeight,
        ),
        builder: () => _builder(),
      ),
    );
  }

  MaterialApp _builder() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // setup locale
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ja', 'JP'),
      // title
      title: '',
      // theme
      theme: ThemeData(
        primaryColor: AppColors.c2196F3,
      ),
      // navigation
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/': (context) => const MainScreen(),
        '/product': (context) => const ProductDetailScreen(),
      },
    );
  }
}
