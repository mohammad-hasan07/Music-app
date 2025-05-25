import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:music_app/theme/colors.dart';
import 'package:music_app/view/dashboard/dashboard_screen.dart';
import 'package:music_app/view_model/service_view_model.dart';
import 'firebase_options.dart';
import 'helper/di.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<ServiceViewModel>()),
      ],
      child: MaterialApp(
        title: 'Music App',
        home: DashboardScreen(),
        theme: themeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
