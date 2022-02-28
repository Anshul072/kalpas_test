import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kalpas_test/home/favourites.dart';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../widgets/card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchNews();
    // print(futurePost);
  }
  List<Post>news=[];
  @override
  Widget build(BuildContext context) {
    print("news:$news");

    /// another approach can be applied if there was api call to make a post fav
    // return SafeArea(
    //     child: DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //         bottomNavigationBar: TabBar(
    //           tabs: [
    //             Tab(
    //               child: SizedBox(
    //                 height: MediaQuery.of(context).size.height*0.09,
    //                 width: MediaQuery.of(context).size.width*0.48,
    //                 child: Row(
    //                   children: const [
    //                     Icon(
    //                       Icons.list_outlined,
    //                       color: Colors.black,
    //                     ),
    //                     Text(
    //                         'News',
    //                       style: TextStyle(
    //                         color: Colors.black
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Tab(
    //               child: SizedBox(
    //                 height: MediaQuery.of(context).size.height*0.09,
    //                 width: MediaQuery.of(context).size.width*0.48,
    //                 child: Row(
    //                   children: const [
    //                     Icon(
    //                         Icons.favorite_border_sharp,
    //                       color: Colors.black,
    //                     ),
    //                     Text(
    //                       'Favs',
    //                       style: TextStyle(
    //                         color: Colors.black
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         body: TabBarView(
    //           children: [
    //             SizedBox(
    //                 width:MediaQuery.of(context).size.width*0.98,
    //                 height: MediaQuery.of(context).size.height*0.85,
    //                 child: FutureBuilder<List<Post>>(
    //                   future: futurePost,
    //                   builder: (context, snapshot) {
    //                     if (snapshot.hasData) {
    //                       news = snapshot.data!;
    //                       // print("in future:$news");
    //                       for(var i=0;i<snapshot.data!.length;i++) {
    //                         return ListView(
    //                           children: snapshot.data!.map(
    //                                   (e) => NewsCard(post: e)
    //                           ).toList(),
    //                         );
    //                       }
    //                     } else if (snapshot.hasError) {
    //                       return Text('${snapshot.error}');
    //                     }
    //                     // By default, show a loading spinner.
    //                     return const Center(child:CircularProgressIndicator());
    //                   },
    //                 )
    //             ),
    //             Favs(posts: news),
    //           ],
    //         )
    //       ),
    //     )
    // );
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                            width:MediaQuery.of(context).size.width*0.98,
                            height: MediaQuery.of(context).size.height*0.85,
                            child: FutureBuilder<List<Post>>(
                              future: futurePost,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  news = snapshot.data!;
                                  // print("in future:$news");
                                  for(var i=0;i<snapshot.data!.length;i++) {
                                    return ListView(
                                      children: snapshot.data!.map(
                                              (e) => NewsCard(post: e)
                                      ).toList(),
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                // By default, show a loading spinner.
                                return const Center(child:CircularProgressIndicator());
                              },
                            )
                        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height*0.09,
                      width: MediaQuery.of(context).size.width*0.48,
                      child: ElevatedButton(onPressed: (){
                      }, child: const Text("News"))),
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.48,
                      height: MediaQuery.of(context).size.height*0.09,
                      child: ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Favs(posts:news)
                        ));
                      }, child: const Text("Favs"))),
                ],
              )
            ],
          ),
        ),
    );
  }
}
Future <List<Post>> fetchNews() async {
  final response = await http.get(Uri.parse('https://api.first.org/data/v1/news'));
  // print("response :${response.body}");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    var body = jsonDecode(response.body);
    // print("body:${body['data'][1]['title']}");
    List<Post> news=[];
    for(var i=0;i<body['data'].length; i++){
      news.add(
        Post.fromJson(body['data'][i]),
      );
    }
    // print("news:$news");
    return news;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}