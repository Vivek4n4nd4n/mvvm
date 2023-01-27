import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/viewmodel/listviewmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ListPictureViewModel listPictureViewModel = ListPictureViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('MvvM model'),),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return StaggeredGridView.countBuilder(
              
              itemCount: listPictureViewModel.pictures?.length,
              itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.blueGrey,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '${listPictureViewModel.pictures![index].picsumDemo?.downloadUrl}',
                  fit: BoxFit.cover,
                ),
              ),
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(2, index.isEven ? 4 :2 ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              crossAxisCount: 2,
            );
            
          }
        },
      ),
    );
  }
}
