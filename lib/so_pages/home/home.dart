import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_images.dart';
import 'package:liberty/so_constants/so_style.dart';
import 'package:liberty/so_pages/player/player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  static final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();
  PersistentBottomSheetController _bottomSheetController;
  bool _isPlayerShown;
  int _value = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPlayerShown = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _isPlayerShown ? SizedBox() : Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              transform: Matrix4.translationValues(0, 0.2, 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: borderRadiusTop(Radius.circular(20))
              ),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _isPlayerShown = true;
                  });
                  _scaffoldState.currentState.showBottomSheet((BuildContext context) => PlayerPage(context: context))
                  ..closed.whenComplete((){
                    if(mounted){
                      setState(() {
                        _isPlayerShown = false;
                      });
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Oge Ogwe', style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white)),
                        Text('Oge Ogwe', style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.skip_previous, color: Colors.white,), onPressed: () => debugPrint('Skip back')),
                        IconButton(icon: Icon(Icons.play_arrow, color: Colors.white,), onPressed: () => debugPrint('Play')),
                        IconButton(icon: Icon(Icons.skip_next, color: Colors.white,), onPressed: () => debugPrint('Skip forward')),
                      ],
                    )
                  ],
                ),
              )
          ),
          BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white.withOpacity(1),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            currentIndex: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home',
                    style: Theme.of(context).textTheme.body2.copyWith(
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  title: Text('Favourites',
                    style: Theme.of(context).textTheme.body2.copyWith(
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile',
                    style: Theme.of(context).textTheme.body2.copyWith(
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
              ),

            ],
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                        <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  height: 250,
                                  margin: EdgeInsets.only(top: 100),
                                  child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 30,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 0.9,
                                      ),
                                      itemCount: 4,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: SoImages.cardBg,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.center,
                                                repeat: ImageRepeat.noRepeat
                                            ),
                                            borderRadius: BorderRadiusDirectional.circular(20),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.5),
                                                borderRadius: BorderRadiusDirectional.circular(20)
                                            ),
                                            child: Builder(
                                              builder: (BuildContext context){
                                                return Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width / 2,
                                                        child: Text('Leave the light on',
                                                          style: Theme.of(context).textTheme.display1.copyWith(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: 'Playfair Display'
                                                          ),
                                                        ),
                                                      ),
                                                      Text('31st August, 2019',
                                                        style: Theme.of(context).textTheme.body2.copyWith(
                                                            fontFamily: 'Nunito Sans',
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            height: 1.5
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 1),
                                                                      shape: BoxShape.circle,
                                                                      image: DecorationImage(
                                                                        image: SoImages.profileImg,
                                                                        fit: BoxFit.fill,
                                                                      )
                                                                  ),
                                                                  height: 30,
                                                                  width: 30
                                                              ),
                                                              SizedBox(width: 5),
                                                              Text('Oge Ogwe',
                                                                style: Theme.of(context).textTheme.body1.copyWith(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          InkWell(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Theme.of(context).accentColor
                                                              ),
                                                              child: Icon(
                                                                Icons.play_arrow,
                                                                color: Colors.white,
                                                              ),
                                                              padding: EdgeInsets.all(15),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      }
                                  )
                              ),
                              SizedBox(height: 24),
                              Text("Popular",
                                style: Theme.of(context).textTheme.display1.copyWith(
                                    fontFamily: 'Playfair Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('based on all-time streams',
                                style: Theme.of(context).textTheme.body2.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC4C4C4),
                                    height: 1.5
                                ),
                              ),
                              Builder(
                                builder: (BuildContext context){
                                  return Container(
                                    height: MediaQuery.of(context).size.height / 3.75,
                                    margin: EdgeInsets.only(top: 10),
                                    child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.4,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 40,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index){
                                        return SizedBox(
                                          width: MediaQuery.of(context).size.width / 0.3,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: SoImages.listImg,
                                                      fit: BoxFit.contain,
                                                      repeat: ImageRepeat.noRepeat,
                                                    ),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                height: 65,
                                                width: 65,
                                              ),
                                              SizedBox(width: 15),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text("Living right by God",
                                                    style: Theme.of(context).textTheme.body2.copyWith(
                                                        fontFamily: 'Nunito Sans',
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text('By Oge Ogwe',
                                                    style: Theme.of(context).textTheme.body1.copyWith(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFFC4C4C4),
                                                        height: 1.5
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: 12,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ]
                    ),
                  )
                ],
              ),
              Positioned(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Home',
                            style: Theme.of(context).textTheme.display1.copyWith(
                                color: Colors.black,
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text('Latest audio content',
                            style: Theme.of(context).textTheme.body2.copyWith(
                                color: Color(0xFFC4C4C4),
                                fontWeight: FontWeight.w600,
                                height: 1.2
                            ),
                          )
                        ],
                      ),
                      InkWell(
                        splashColor: Theme.of(context).splashColor,
                        onTap: () => debugPrint('Searching'),
                        child: Icon(Icons.search,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                ),
                top: 0,
                left: 0,
                right: 0,
              )
            ],
          ),
        )
      ),
    );
  }
}
