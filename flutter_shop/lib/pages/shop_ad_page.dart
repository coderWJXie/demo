import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/shop_app_page.dart';
// 1>.创建组件
class AdPage extends StatefulWidget {
  // 2>.定义构造方法
  const AdPage({Key? key}) : super(key: key);
  // 3>.重写createState()
  @override
  _AdPageState createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {

  @override
  void initState() {
    super.initState();
    // // 延迟执行
    // Future.delayed(const Duration(seconds: 2), () async {
    //   // 第四步：第一个Page等待数据回传（await此处代码会暂停执行等待回传）
    //   // 跳转
    //   final result = await Navigator.of(context).push(
    //     // 第二步：在第一个page中将数据传入第二个page
    //     // 传入数据到下一个页面
    //     MaterialPageRoute(builder: (context) => const AppPage(appName: 'flutter_shop'))
    //   );
    //   print('appName is $result');
    // });
    // 延迟执行
    Future.delayed(const Duration(seconds: 2), () {
      // 跳转
      // Navigator.of(context, rootNavigator: true); // 如果有多个Navigator
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AppPage())
      );
      // // 第二步（无法传递参数）
      // Navigator.of(context).pushNamed('/app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // FIXME - const的用法
            children: const [
              Text(
                '欢迎来到典典的小卖部',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                )
              )
            ]
          )
        ]
      )
    );
  }
}