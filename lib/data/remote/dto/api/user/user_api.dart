import 'package:cloud_firestore/cloud_firestore.dart';

/*
REST API 서버와 통신하기 위한 객체이지만 해당 객체는 Firebase와 통신만 진행하기 때문에 코드제네레이터가 불필요
-> 추상 클래스를 선언하지 않았다.
통신을 위한 FireStore객체만 생성하였다.
 */
class UserApi {
  /*
  FirebaseFirestore.instance는 딱 한번만 생성되게 되어있다. -> 인스턴스가 여러개 생성될 경우 에러 발생
  여러 곳에 호출 되더라도 인스턴스의 재생성을 막기 위해 singleton pattern으로 구현
   */
  UserApi._();
  static final _instance = UserApi._();
  factory UserApi() => _instance;

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  FirebaseFirestore get fireStore => _fireStore;
}
