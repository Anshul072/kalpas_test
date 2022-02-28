import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';
class NewsCard extends StatefulWidget {
  final Post post;
  NewsCard({required this.post});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      width:  MediaQuery.of(context).size.width*1,
      child: Card(
        elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.post.isLiked?
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.2,
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      widget.post.isLiked = !widget.post.isLiked;
                    });
                  }, icon: const Icon(
                Icons.favorite_outlined,
                size:40,
                color: Colors.red,
              )),
            ):SizedBox(
              width:  MediaQuery.of(context).size.width*0.2,
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      widget.post.isLiked = !widget.post.isLiked;
                    });
                  }, icon: const Icon(
                Icons.favorite_border_sharp,
                size:40,
                color: Colors.black,
              )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.post.title != null)
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(
                    widget.post.title!.length>85? widget.post.title!.substring(0,85)+'...':widget.post.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if(widget.post.summary!=null)
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(
                    widget.post.summary!.length>85? widget.post.summary!.substring(0,85)+'...':widget.post.summary!,
                  ),
                ),
                if(widget.post.published != null)
                Text(
                    widget.post.published!,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
