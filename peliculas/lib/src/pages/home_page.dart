import 'package:flutter/material.dart';

import 'package:peliculas/src/models/movies_model.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';

import 'package:peliculas/src/providers/movies_provider.dart';

import 'package:peliculas/src/widgets/horizontal_card.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas App'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: Container(
        child: ListView(
          children:<Widget>[   
            _swiperCards(moviesProvider.getNowPlaying()),
            SizedBox(height: 20,),
            _swiperCards2(moviesProvider.getPupularMovies()),
            _swiperCards2(moviesProvider.getPupularMovies())
           ],
        )
     ),
   );
  }

  Widget _swiperCards(Future<List<Movie>> future) {

    return FutureBuilder(
      future: future , 
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return Column(
            children: <Widget>[
              SizedBox(height: 10.0,),
              Text('Ahora en cines', style: Theme.of(context).textTheme.subtitle1,),
              CardSwiper(
                movies: snapshot.data
              ),
            ],
          );
        }else{
          return Container();
        }
        
      },
    );
    //  moviesProvider.getNowPlaying();

    // return CardSwiper(movies: [1,2,3,4,5]);
    // return Container();
  }

  Widget _swiperCards2(Future<List<Movie>> future) {

    return Column(
      children: <Widget>[
        Text('Populares'),
        SizedBox(height: 5.0,),
        FutureBuilder(
          future: future , 
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            
            if(snapshot.hasData){
              return HorizontalMovie(movies: snapshot.data,);
            }else{
              return Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            
          },
        ),
      ],
    );
    //  moviesProvider.getNowPlaying();

    // return CardSwiper(movies: [1,2,3,4,5]);
    // return Container();
  }
}