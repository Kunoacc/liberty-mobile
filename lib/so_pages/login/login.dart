import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_images.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:liberty/so_utils/so_theme.dart';

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
        pagination: new SwiperPagination(),
      ),
    );
  }

  IndexedWidgetBuilder _swipeBuilder(MediaQueryData mediaQuery){
    return (BuildContext context, int index){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           SizedBox(
             width: mediaQuery.size.width / 1.5,
             height: mediaQuery.size.width / 1.5,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 30.0),
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
}
