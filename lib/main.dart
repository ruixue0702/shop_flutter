import 'package:flutter/material.dart';
import './config/index.dart';
import './provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';
// void main() => runApp(MyApp());
void main() {
  var currentIndexProvide = CurrentIndexProvide();
  var providers = Providers();

  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  
  runApp(ProviderNode(child: MyApp(), providers: providers));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: KString.mainTitle, // Flutter 女装商城
        debugShowCheckedModeBanner: false,
        // 制定主题
        theme: ThemeData(
          primaryColor: KColor.primaryColor,
        ),
        home: IndexPage(),
      ),
    );
  }
}
