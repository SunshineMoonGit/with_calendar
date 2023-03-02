import 'package:flutter/material.dart';
import 'package:with_calendar/common/data/color_data.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        renderGroupThumb(),
        renderGroupState(),
      ],
    );
  }

  //그룹 썸네일 세팅 (Gesture 세팅 X)
  Widget test({required index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          _groupTest[index]['thumbImg'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  renderGroupThumb() {
    return Container(
      color: ColorStyles.color_4,
      width: 70,
      height: double.infinity,
      //리스트로 반복
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_groupTest.length, (index) => test(index: index)), // 그룹 데이터 갯수, index값으로 정렬
        ),
      ),
    );
  }

  renderGroupState() {
    return Expanded(
      child: Container(
        color: ColorStyles.color_1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text('공지사항'),
                    Text(_groupTest[0]['groupNotification']),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: const [
                    Text('오늘의 일정'),
                    Text('오늘의 일정은 아직 없습니다...'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List _groupTest = [
  {
    'groupId': 'sdsdsd',
    'groupName': '송중기',
    'thumbImg': 'asset/img/0.jpg',
    'groupNotification': '1. 오늘은 송중기 팬 사인회가 열리는 날입니다.\n 참석 부탁드립니다.',
    'groupCalendar': ['dd', '11'],
  },
  {
    'groupId': 'sdsdsd',
    'groupName': '송중기',
    'thumbImg': 'asset/img/1.jpg',
    'groupNotification': '1. 오늘은 송중기 팬 사인회가 열리는 날입니다.\n 참석 부탁드립니다.',
    'groupCalendar': ['dd', '11'],
  },
  {
    'groupId': 'sdsdsd',
    'groupName': '송중기',
    'thumbImg': 'asset/img/2.jpg',
    'groupNotification': '1. 오늘은 송중기 팬 사인회가 열리는 날입니다.\n 참석 부탁드립니다.',
    'groupCalendar': ['dd', '11'],
  },
  {
    'groupId': 'sdsdsd',
    'groupName': '송중기',
    'thumbImg': 'asset/img/3.jpg',
    'groupNotification': '1. 오늘은 송중기 팬 사인회가 열리는 날입니다.\n 참석 부탁드립니다.',
    'groupCalendar': ['dd', '11'],
  },
];
