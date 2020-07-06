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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      constraints: BoxConstraints.expand(height: 225),
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Color.fromRGBO(69, 7, 83, 1.0),
                                Color.fromRGBO(153, 0, 190, 1.0)
                              ],
                              begin: const FractionalOffset(1.0, 1.0),
                              end: const FractionalOffset(0.2, 0.2),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'My App',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    constraints: BoxConstraints.expand(
                        height: MediaQuery.of(context).size.height - 80),
                    child: ListView(
                        padding: EdgeInsets.all(10),
                        scrollDirection: Axis.vertical,
                        children: [
                          _swiperCards2(moviesProvider.getPupularMovies()),
                          _swiperCards(moviesProvider.getPupularMovies()),
                          _swiperCards2(moviesProvider.getPupularMovies()),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        /* body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(69, 7,83, 1.0),
              Color.fromRGBO(153, 0, 190, 1.0),        
              ],
            ) 
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(), //no scroll
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 15.0, left:  10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('My Movies',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0,),
              Container(
                height: MediaQuery.of(context).size.height-50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0)),
                ),
                child: ListView(
                  primary: false,
                  children: <Widget>[
                    _swiperCards(moviesProvider.getNowPlaying()),
                    _swiperCards2(moviesProvider.getPupularMovies()),
                    _swiperCards2(moviesProvider.getPupularMovies()),
                  ],
                ),

              )
            ],
          ),  
        ) */
      ),
    );
    /* return Scaffold(
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
   ); */
  }

  Widget _swiperCards(Future<List<Movie>> future) {
    return FutureBuilder(
      future: future,
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Ahora en cines',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              CardSwiper(movies: snapshot.data),
            ],
          );
        } else {
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
        SizedBox(
          height: 5.0,
        ),
        FutureBuilder(
          future: future,
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return HorizontalMovie(
                movies: snapshot.data,
              );
            } else {
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
