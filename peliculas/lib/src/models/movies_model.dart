// Generated by https://quicktype.io


class Movie {
  double popularity;
  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;

  Movie({
          this.popularity,
          this.id,
          this.video,
          this.voteCount,
          this.voteAverage,
          this.title,
          this.releaseDate,
          this.originalLanguage,
          this.originalTitle,
          this.genreIds,
          this.backdropPath,
          this.adult,
          this.overview,
          this.posterPath,
  });

  Movie.fromJsonMap( Map<String, dynamic > json){
    voteCount        = json ['vote_count'];
    id               = json ['id'];
    video            = json ['video'];
    voteAverage      = json ['vote_average'] / 1;
    title            = json ['title'];
    popularity       = json ['popularity'] /1;
    posterPath       = json ['poster_path'];
    originalLanguage = json ['original_language'];
    releaseDate      = json ['releaseDate'];
    originalTitle    = json ['original_title'];
    genreIds         = json ['genreIds'].cast<int>();
    backdropPath     = json ['backdrop_path'];
    adult            = json ['adult'];
    overview         = json ['overview'];
  } 
}

