import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/uitl/modified.dart';

class TvShows extends StatelessWidget {

  final List tvshows_list;

  TvShows({required this.tvshows_list});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'TV shows',size: 20,),
          SizedBox(height: 10.0,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshows_list.length,
              itemBuilder: (context, index) {
              return Container(
                width: 250,
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  tvshows_list[index]['backdrop_path'],

                          ),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: modified_text(
                        size: 15,
                        text: tvshows_list[index]['original_name'] != null
                            ? tvshows_list[index]['original_name']
                            : 'Loading'
                      ),
                    )
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}
