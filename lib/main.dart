// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:discount_me_app/res/app_const/appRoutes.dart';
import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_home.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_home_screen.dart';

import 'res/app_const/appNames.dart';

void main() {
  runApp(
      MyApp()
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),  // Your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),

          // home: BrokerHome(),

          initialRoute: RouteNames.splashViewOne,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
