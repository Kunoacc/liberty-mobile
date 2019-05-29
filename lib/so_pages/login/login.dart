import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_images.dart';
import 'package:liberty/so_constants/so_colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:liberty/so_utils/so_theme.dart';
import 'package:liberty/so_constants/so_style.dart';
import 'package:liberty/so_utils/so_route.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  Onboarding Images
  final List<ImageProvider> onboardingImages = [
    SoImages.onboardOne,
    SoImages.onboardTwo,
    SoImages.onboardThree
  ];

  final List<String> descriptions = [
    'Listen Anywhere',
    'Be Edified',
    'Feel Fulfilled'
  ];

  final _controller = new SwiperController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: new Swiper(
        itemCount: onboardingImages.length,
        itemBuilder: _swipeBuilder(media),
        loop: false,
        controller: _controller,
//        viewportFraction: 0.65,
//        scale: 0.8,
        pagination: new SwiperCustomPagination(
          builder: _paginationBuilder(context)
        ),
      ),
    );
  }

  IndexedWidgetBuilder _swipeBuilder(MediaQueryData mediaQuery){
    return (BuildContext context, int index){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 50.0),
           SizedBox(
             width: mediaQuery.size.width / 1.5,
             height: mediaQuery.size.width / 1.5,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
               child: new Image(
                 image: onboardingImages[index],
                 alignment: Alignment.center,
                 fit: BoxFit.contain,
               ),
             )
           ),
          SizedBox(height: 40),
          Text(descriptions[index],
            style: SoTheme.of(context).display2Bold,
            textAlign: TextAlign.center,

          )
        ],
      );
    };
  }

  SwiperPaginationBuilder _paginationBuilder(BuildContext _context){
    return (BuildContext context, SwiperPluginConfig config){
      final _isLastSlide = config.activeIndex + 1 == config.itemCount;

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _paginationDots(
              color: Colors.grey[400],
              activeColor: SoColors.primary,
              activeSize: 16,
              config: config,
              size: 12,
              space: 14
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadiusTop(Radius.circular(25.0)),
              color: SoColors.primary
            ),
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text('Connect With',
                  style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(_context).size.width / 2) - 30,
                      child: RaisedButton(
                        onPressed: () => SoRoute.route.navigateTo(_context, '/home'),
                        color: Colors.white,
                        elevation: 3.0,
                        splashColor: Theme.of(context).splashColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(style: BorderStyle.solid, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image(
                          image: SoImages.google,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: (MediaQuery.of(_context).size.width / 2) - 30,
                      child: RaisedButton(
                        onPressed: () => SoRoute.route.navigateTo(_context, '/home'),
                        color: Colors.white,
                        elevation: 3.0,
                        splashColor: Theme.of(context).splashColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(style: BorderStyle.solid, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image(
                          image: SoImages.facebook,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    };
  }

  List<Widget> _paginationDots({SwiperPluginConfig config, Color activeColor, double activeSize, Color color, double size, double space}) {
    final List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(space),
        child: ClipOval(
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: active ? activeSize : size,
          ),
        ),
      ));
    }
    return list;
  }
}
