import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_workshop_afternoon/model/album.dart';
import 'package:flutter_workshop_afternoon/service/album_api.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AlbumApi albumApi = AlbumApi();
  late List<Album> allAlbum = [];

  Future<String?> getAllAlbum() async {
    var response = await albumApi.fetchAlbum();
    setState(() {
      List res = json.decode(response.body);
      allAlbum = res.map((album) => Album.fromJson(album)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: allAlbum.length,
        itemBuilder: (context,index){
          final item = allAlbum[index];
          return Card(
            child: ListTile(
              leading: Image(image: NetworkImage(item.thumbnailUrl),),
              title: Text(item.title),
              subtitle: Text('${item.id}'),
            ),
          );
        },
      ),
    );
  }
}
