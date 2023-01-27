import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_demo/model/picsumdemo.dart';
import 'package:flutter_mvvm_demo/services/services.dart';

class ListPictureViewModel {
  List<PictureViewModel>? pictures;
  Future<void> fetchPictures() async {
    final apiResult = await Services().fetchPicturesAPI();
    this.pictures = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  final PicsumDemo? picsumDemo;
  PictureViewModel(this.picsumDemo);
}
