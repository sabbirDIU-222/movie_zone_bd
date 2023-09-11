import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/uitl/modified.dart';

class TrendingMovies extends StatelessWidget {
  final List trandingmovies;

  TrendingMovies({required this.trandingmovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Tranding Movies',
            size: 26,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trandingmovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
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
                                          trandingmovies[index]['poster_path']))),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          child: modified_text(
                            text: trandingmovies[index]['title'] != null
                                ? trandingmovies[index]['title']
                                : 'not found',
                          ),
                        ),
                      ],
                    ),
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
