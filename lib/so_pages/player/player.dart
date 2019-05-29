import 'package:flutter/material.dart';
import 'package:liberty/so_constants/so_images.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    @required this.context
  });

  final BuildContext context;

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  int _value = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(widget.context).size.height + 1,
          width: MediaQuery.of(widget.context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: SoImages.listImg,
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              alignment: Alignment.center,
            ),
          ),
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Theme.of(widget.context).primaryColor.withOpacity(0.33), Theme.of(widget.context).primaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          transform: Matrix4.translationValues(0, 1, 0),
        ),
        Stack(
          children: <Widget>[
            Positioned(
              child: IconButton(icon: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 40), onPressed: () => null),
              top: 20,
              left: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('31st August, 2019', style: Theme.of(widget.context).textTheme.body1.copyWith(
                              color: Colors.white
                          )),
                          Text('Living Right by God', style: Theme.of(widget.context).textTheme.display2.copyWith(
                              fontFamily: 'Playfair Display',
                              color: Colors.white
                          ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 30,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                        style: BorderStyle.solid
                                    ),
                                    image: DecorationImage(
                                        image: SoImages.profileImg
                                    ),
                                    shape: BoxShape.circle
                                ),
                              ),
                              Text('Oge Ogwe', style: Theme.of(widget.context).textTheme.body2.copyWith(
                                  color: Colors.white
                              ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.white,),
                                  onPressed: null,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.cloud_download, color: Colors.white,),
                                color: Colors.white,
                                onPressed: null,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('0:00', style: Theme.of(widget.context).textTheme.body2.copyWith(
                              color: Colors.white
                          )),
                          Slider(
                            min: 1,
                            max: 10,
                            value: _value.toDouble(),
                            onChanged: (double val){
                              setState(() {
                                _value = val.round();
                              });
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white.withOpacity(0.5),
                          ),
                          Text('3:45', style: Theme.of(widget.context).textTheme.body2.copyWith(
                              color: Colors.white
                          ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.skip_previous, color: Colors.white),
                            onPressed: () => debugPrint('Skip'),
                          ),
                          InkWell(
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                ),
                                child: Icon(Icons.pause)
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.skip_next, color: Colors.white),
                              onPressed: () => debugPrint('Skipppppp')
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
