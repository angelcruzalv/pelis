import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';

import 'package:peliculas/src/providers/movies_provider.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: Container(
        child: Column(
         children:<Widget>[
            _swiperCards()
          ]           
        )
     ),
   );
  }

  Widget _swiperCards() {

    return FutureBuilder(
      future: moviesProvider.getNowPlaying(), 
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if(snapshot.hasData){
          return CardSwiper(
            movies: snapshot.data
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        
      },
    );
    //  moviesProvider.getNowPlaying();

    // return CardSwiper(movies: [1,2,3,4,5]);
    // return Container();
  }
}