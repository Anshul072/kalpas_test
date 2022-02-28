import 'package:flutter/material.dart';
import 'package:kalpas_test/widgets/card.dart';

import '../model/post.dart';


class Favs extends StatelessWidget {
  final List<Post> posts;
  Favs({required this.posts});
  @override

  Widget build(BuildContext context) {
    print("in favs news:$posts");
    List<Post> favPosts=[];
    for(var i=0;i<posts.length;i++){
      if(posts[i].isLiked){
       favPosts.add(posts[i]);
      }
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width:MediaQuery.of(context).size.width*0.98,
                height: MediaQuery.of(context).size.height*0.85,
                child: ListView(
                  children: favPosts.map(
                          (e) => NewsCard(post: e)
                  ).toList(),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height*0.09,
                    width: MediaQuery.of(context).size.width*0.48,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("News"))),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.48,
                    height: MediaQuery.of(context).size.height*0.09,
                    child: ElevatedButton(onPressed: (){

                    }, child: const Text("Favs"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
