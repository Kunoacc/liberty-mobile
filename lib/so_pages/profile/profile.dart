import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_style.dart';
import 'package:liberty/so_pages/player/player.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey();
  bool _isPlayerShown;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPlayerShown = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
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
                  _scaffold.currentState.showBottomSheet((BuildContext context) => PlayerPage(context: context))
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
    );
  }
}
