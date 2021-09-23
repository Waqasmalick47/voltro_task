import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voltro_task/providers/summery_provider.dart';
import 'package:voltro_task/screens/ui/bottom_navigation.dart';
import 'package:voltro_task/utils/routes.dart';
import 'package:voltro_task/utils/themes.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SummeryProvider()),
      ],
      child: MaterialApp(
        title: 'Voltro Task',
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Routes.generateRoute,
        home: BottomNavigationScreen(),
      ),
    );
  }
}
