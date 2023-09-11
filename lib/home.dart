import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/uitl/modified.dart';
import 'package:flutter_task_manager_app/widget/top_rated.dart';
import 'package:flutter_task_manager_app/widget/tranding_movies.dart';
import 'package:flutter_task_manager_app/widget/tv_shows.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List trandingMovie = [];
  List topRatedMovie = [];
  List tvshows = [];

  @override
  void initState() {
    loadMovies();
    // TODO: implement initState
    super.initState();
  }

  final String apiKeys = '702170a723d7da97eb0ca9ee387266ec';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDIxNzBhNzIzZDdkYTk3ZWIwY2E5ZWUzODcyNjZlYyIsInN1YiI6IjY0ZmVhY2Y4MmRmZmQ4MDBhZGI2YmU3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YZVYxHZbJpZGlJKDUXdAC4sdvW_VhSfSTfvTFLr9RHs';

  //function for fetching api

  loadMovies() async {
    TMDB tmdb_with_custom_log = TMDB(ApiKeys(apiKeys, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trandingresult =await tmdb_with_custom_log.v3.trending.getTrending();
    Map topRatedResult =await tmdb_with_custom_log.v3.movies.getTopRated();
    Map tvResult =await tmdb_with_custom_log.v3.tv.getPopular();
    setState(() {
      trandingMovie = trandingresult['results'];
      topRatedMovie = topRatedResult['results'];
      tvshows = tvResult['results'];
      print(topRatedMovie);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,

        title: modified_text(text: 'Movie Zone'),
      ),
      body: ListView(
        children: [
          TvShows(tvshows_list: tvshows),
          TrendingMovies(trandingmovies: trandingMovie,),
          TopRatedMovies(topratedmovies: topRatedMovie),
        ],
      ),
    );
  }
}
