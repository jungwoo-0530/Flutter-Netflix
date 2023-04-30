import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({required this.movies});

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();

    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Topbar와 겹치지 않도록 패딩. home_screen에서 stack을 사용했으므로 패딩을 안주면 겹친다.
          Container(
            padding: const EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            }),
          ),
          //사랑/로맨스/판타지
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: const TextStyle(fontSize: 11),
            ),
          ),
          //내가 찜한 콘텐츠, 재생, 정보
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //내가 찜한 콘텐츠
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                      const Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                //재생 버튼
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text(
                          '재생',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.info)),
                      const Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 슬라이더 동그라미
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

//슬라이더 밑 동그라미(Indicator)
List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];

  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? const Color.fromRGBO(255, 255, 255, 0.9)
            : const Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }

  return results;
}
