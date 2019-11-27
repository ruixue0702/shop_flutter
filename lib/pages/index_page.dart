import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/provide/current_index_provide.dart';
import '../config/index.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import '../provide/current_index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 屏幕适配


class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.homeTitle), // 首页
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.categoryTitle), // 分类
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.shoppingCartTitle), // 购物车
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.memberTitle), // 会员中心
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context); // 实例化 
    return Provide<CurrentIndexProvide>( // 监听通知
      builder: (context, child, val) {
        // 取到当前索引状态值
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex, // 索引绑定
              items: bottomTabs,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index); // 改变索引值
            },
          ),
          body: IndexedStack(
            index: currentIndex, // 索引绑定
            children: tabBodies,
          ),
        );
      },
    );
  }
}