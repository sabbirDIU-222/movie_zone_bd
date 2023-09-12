import 'package:flutter/material.dart';
import 'package:flutter_task_manager_app/uitl/modified.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, lunch_on;

  Description(
      {required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.lunch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios_new),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.5],
                          ),
                        ),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                    bottom: 10,
                      child: modified_text(text: ' * Average rating'+vote,size: 18,color: Colors.amber,)),

                ],

              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10.0),
              child: modified_text(
                text: name!=null ? name : 'Not Loded', size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: modified_text(
                text: 'Releasing on - ' + lunch_on, size: 15,
              ),
            ),

            Row(children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),

              Flexible(child: Container(
                padding: EdgeInsets.all(10.0),
                child: modified_text(text: description,size: 19,),
              ))
            ],),

          ],
        ),
      ),
    );
  }
}
