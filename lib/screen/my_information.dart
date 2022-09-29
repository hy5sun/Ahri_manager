import 'package:ahri_manager/screen/input_user_information.dart';
import 'package:flutter/material.dart';
import 'package:ahri_manager/plus/user_helper.dart';
import 'package:ahri_manager/data/user_information.dart';

//내정보 조회, 배경테마설정
class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);
  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  List<user_information> user_infotmations=[]; //유저정보 리스트
  final UserHelper helper=UserHelper();

  @override
  void initState(){
    helper.init().then((value){
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내 정보"),
      ),
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          Text("내 정보를 표기합니다."),
          Text('이름: ${user_infotmations.first.name}'),
          Text('몸무게: ${user_infotmations.first.weight}'),
          Text('종: ${user_infotmations.first.species}'),
          Text('성별: ${user_infotmations.first.gender}'),
          Text('중성화: ${user_infotmations.first.neu}'),
          Text("생일: ${user_infotmations.first.selectedyear}년 ${user_infotmations.first.selectedmonth}월 ${user_infotmations.first.selectedday}일"),
          ElevatedButton(
            child: const Text('정보 수정'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StartScreen()));
            },
          ),
      ],
      ),
    );
  }
  void updateScreen(){
    user_infotmations=helper.getuserinformation();
    setState(() {});
  }
}