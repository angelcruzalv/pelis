import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> movies;

  const CardSwiper({Key key, @required this.movies}) : super(key: key);
  // CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20.0),
    
      child: Swiper(
          itemWidth: _screenSize.width * .7,
          itemHeight: _screenSize.height * .5,
          itemCount: 10,
          layout: SwiperLayout.STACK,
          
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Image.network("https://images-na.ssl-images-amazon.com/images/I/71niXI3lxlL._AC_SY741_.jpg",
                  fit: BoxFit.fill,),
            );
          },
          // itemCount: 3,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
        ),
    );
  }
}