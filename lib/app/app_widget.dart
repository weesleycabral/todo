import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit, FontSizeResolvers;
import 'package:todo/app/routes/routes.dart';

import 'ui/pages/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      fontSizeResolver: FontSizeResolvers.height,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: _appBuilder,
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _ready());
  }

  Widget _appBuilder(_, __) {
    return const MaterialApp(
      home: Routes(),
    );
  }

  void _ready() async {
    FlutterNativeSplash.remove();
  }
}
