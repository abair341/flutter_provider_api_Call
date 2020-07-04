import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_flutter/models/dept_info_provider.dart';
import 'package:provider_api_flutter/models/img_list_provider.dart';
import 'package:provider_api_flutter/screens/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dept_Info_Provider>(
          create: (_) => Dept_Info_Provider(),
        ),
        ChangeNotifierProvider<Img_List_Provider>(
          create: (_) => Img_List_Provider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
