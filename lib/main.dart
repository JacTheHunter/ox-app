import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuckingnum/providers/ShopProvider.dart';
import 'package:fuckingnum/providers/bottom_navigation_provider.dart';
import 'package:fuckingnum/providers/BrandProvider.dart';
import 'package:fuckingnum/providers/feedGridProvider.dart';
import 'package:fuckingnum/providers/my_buys_provider.dart';
import 'package:fuckingnum/providers/product_page-provider.dart';
import 'package:fuckingnum/providers/products_provider.dart';
import 'package:fuckingnum/providers/reviewsProvider.dart';
import 'package:fuckingnum/screens/branddetail_page/brand_detail_page.dart';
import 'package:fuckingnum/screens/models/cart_constructor.dart';
import 'package:fuckingnum/screens/more/myCards.dart';
import 'package:fuckingnum/screens/more/mybuys/details_buy.dart';
import 'package:fuckingnum/screens/product_detail_page/product_detail_page.dart';
import 'package:fuckingnum/screens/shopingpage/shoppingdetailpage.dart';
import 'package:provider/provider.dart';
import 'screens/authentication/intro/screens/app.dart';
import 'screens/cart/check-out-product-page.dart';
import './transitions/rightslide.dart';
import './screens/models/screen_arguments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ReviewsProvider()),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: FeedGridProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BrandProvider(),
        ),
        ChangeNotifierProvider.value(value: ShopProvider()),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: ProductPageProvider(),
        ),
        ChangeNotifierProvider.value(value: MyBuys_Provider()),
        ChangeNotifierProvider.value(value: BottomNavigationTabIndexProvider()),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Oxapp",
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
        home: App(),
        routes: {
          ProductPage.routeName: (ctx) => ProductPage(),
          CheckOutProductPage.routeName: (ctx) => CheckOutProductPage(),
          BrandDetailPage.routeName: (ctx) => BrandDetailPage(),
          ShoppingDetailPage.routeName: (ctx) => ShoppingDetailPage(),
          MyCards.routeName: (ctx) => MyCards(),

        },
        onGenerateRoute: (settings) {
          final ScreenArguments args = settings.arguments;
          if (settings.name == detailsBuy.routeName) {
            return SlideRightRoute(widget: detailsBuy(args.id));
          }
        },
      ),
    );
  }
}
