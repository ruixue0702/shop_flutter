# Flutter 商城
## 依赖安装
- pubspec.yaml

```dart
cupertino_icons: ^0.1.2
  dio: ^2.0.7
  flutter_swiper: ^1.1.4
  flutter_screenutil: ^0.5.1
  url_launcher: ^5.0.1
  flutter_easyrefresh: ^1.2.7
  provide: ^1.0.2
  fluttertoast: ^3.0.1
  fluro: ^1.4.0
  flutter_html: ^0.9.6
  sqflite: ^1.1.0
  shared_preferences: ^0.5.1
```

## 目录结构
- lib
  - config
    - color.dart
    - font.dart
    - http_conf.dart
    - length.dart
    - string.dart
  - model
  - pages
  - provide
  - routers
  - service
    - http_service.dart
  - main.dart

## 状态管理
- Scoped Model （比较早的一种状态解决方案）
- Redux （过于复杂，action reducer，）
- Bloc （比redux 简单一些，比较好用）
- State （小项目可用）
- Provide （Google 开源项目，简单的逻辑即可）
  - 和Scoped Model一样，Provide 也是借助了 InheritWidget，将共享状态放到顶层 MaterialApp 之上。底层部件通过 Provider 获取该状态，并通过混合 ChangeNotifier 通知依赖于该状态的组件刷新

### 当前状态索引处理