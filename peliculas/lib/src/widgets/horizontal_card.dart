import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movies_model.dart';


class HorizontalMovie extends StatelessWidget {

  final List<Movie> movies;

  const HorizontalMovie({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final _sreenSize = MediaQuery.of(context).size;
    return Container(
      height: _sreenSize.height *0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.4,
          initialPage: 1,
          ),
        children: 
          _cardsList(context),  
      ),
    );
  }

  List<Widget> _cardsList(BuildContext context) {

    return movies.map((movie){
      
      return Container(
        margin: EdgeInsets.only(right: 1.0),
        child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/img/no-image.jpg'),
                          image: NetworkImage(movie.getPosterImg()),
                          fit: BoxFit.cover,
                          height: 160,
                        ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,    
                      style: Theme.of(context).textTheme.caption,                
                    )
                  ],
        ),        
      );
    }).toList();
  }
}