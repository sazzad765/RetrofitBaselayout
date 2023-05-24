import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_client.dart';
import 'package:flutter_retrofit/core/view/home/home_screen.dart';
import 'package:flutter_retrofit/service/interceptors.dart';
import 'package:flutter_retrofit/utils/route/route.dart';
import 'package:flutter_retrofit/utils/shared_preferences.dart';
import 'package:flutter_retrofit/utils/static_content/static_string.dart';
import 'package:flutter_retrofit/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final pref = SharedPref();
    final client = RestClient(Dio(BaseOptions(
        contentType: "application/json", baseUrl: StaticString.baseUrl))
      ..interceptors.add(CustomInterceptors(pref: pref)));
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => Layout()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: customTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        navigatorKey: navigatorKey,
        home: const HomeScreen(),
      ),
    );
  }
}
