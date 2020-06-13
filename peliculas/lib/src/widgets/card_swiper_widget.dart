import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/movies_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

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
              child:  FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movies[index].getPosterImg(),),
                fit: BoxFit.cover
              )
            );
          },
          // itemCount: 3,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
        ),
    );
  }
}