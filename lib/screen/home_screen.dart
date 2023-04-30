import 'package:first_test_app/widget/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/model_movie.dart';
import '../widget/box_slider.dart';
import '../widget/circle_slider.dart';

//home 상단바

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '존윅4',
      'keyword': '범죄/액션/스릴러',
      'poster': 'john_wick_4.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '존윅4',
      'keyword': '범죄/액션/스릴러',
      'poster': 'john_wick_4.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '존윅4',
      'keyword': '범죄/액션/스릴러',
      'poster': 'john_wick_4.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '존윅4',
      'keyword': '범죄/액션/스릴러',
      'poster': 'john_wick_4.jpg',
      'like': false
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            const TopBar(),
            CarouselImage(movies: movies),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(movies: movies),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/netflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1),
            child: const Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
