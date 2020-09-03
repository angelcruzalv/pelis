import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movies_model.dart';

class HorizontalMovie extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;

  HorizontalMovie({Key key, @required this.movies, @required this.nextPage})
      : super(key: key);
  final _pageController = new PageController(
    viewportFraction: 0.4,
    initialPage: 1,
  );
  @override
  Widget build(BuildContext context) {
    final _sreenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });
    return Container(
      height: _sreenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: _pageController,
        children: _cardsList(context),
      ),
    );
  }

  List<Widget> _cardsList(BuildContext context) {
    return movies.map((movie) {
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
            SizedBox(
              height: 10.0,
            ),
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
