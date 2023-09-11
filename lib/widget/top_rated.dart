import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/uitl/modified.dart';

class TopRatedMovies extends StatelessWidget {
  final List topratedmovies;

  TopRatedMovies({required this.topratedmovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Top Rated Movies',
            size: 22,
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topratedmovies.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topratedmovies[index]['poster_path']))),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: modified_text(
                          text: topratedmovies[index]['title'] != null
                              ? topratedmovies[index]['title']
                              : 'not found',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
