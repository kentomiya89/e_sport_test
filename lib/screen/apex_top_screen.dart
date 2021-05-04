import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_apex/gen/assets.gen.dart';
import 'package:test_apex/model/tournament_info.dart';

class ApexTop extends StatelessWidget {
  final dummyInfo = List.generate(
      3,
      (index) => TournamentInfo(
            logo: Assets.resource.images.fortnaiteLogo,
            name: 'ほげほげ',
            eventDate: '2021/02/02',
            prizeMoney: '¥10,000',
            type: 'ソロ',
            organizer: 'ほげほげ',
          ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('トップ画面'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            _InfoSliderView(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  // TODO: index指定じゃなくてWidgetの配列用意して、クラスの型判定で区別するのがいいかも?
                  // ヘッダー
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.all(4.0),
                      color: Colors.red,
                      height: 30.0,
                      child: Center(
                        child: Text(
                          '大会情報 FORTNITE',
                          style: _whiteTextStyle(),
                        ),
                      ),
                    );
                  }
                  return _TournamentInfoCard(
                      tournamentInfo: dummyInfo[index - 1]);
                },
                itemCount: dummyInfo.length + 1,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(4, 0, 69, 1),
      ),
    );
  }
}

class _InfoSliderView extends StatelessWidget {
  final imageListForSlideView = [
    Assets.resource.images.apexLog,
    Assets.resource.images.apexLogBlack,
    Assets.resource.images.apexLogWhite
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
        return Image(image: imageListForSlideView[itemIndex]);
      },
      options: CarouselOptions(
        height: 190.0,
        viewportFraction: 0.8,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}

class _TournamentInfoCard extends StatelessWidget {
  final TournamentInfo tournamentInfo;

  _TournamentInfoCard({required this.tournamentInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(49, 43, 101, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: Assets.resource.images.fortnaiteLogo,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '大会名: ${tournamentInfo.name}杯',
                  style: _whiteTextStyle(),
                ),
                Text(
                  '開催日: ${tournamentInfo.eventDate}',
                  style: _whiteTextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '賞金/賞品: ',
                      style: _whiteTextStyle(),
                    ),
                    Text(
                      tournamentInfo.prizeMoney,
                      style: TextStyle(
                        color: Color.fromRGBO(154, 164, 101, 1),
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Image(
                        image: Assets.resource.images.faceWithRollingEyes1f644,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                      ),
                      child: Text(
                        tournamentInfo.organizer,
                        style: _whiteTextStyle(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                width: 50.0,
                height: 30.0,
                child: Center(
                  child: Text(
                    tournamentInfo.type,
                    style: _whiteTextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle _whiteTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
}
