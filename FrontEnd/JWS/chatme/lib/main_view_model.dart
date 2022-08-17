import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatme/firebase_auth_remote_data_source.dart';
import 'package:chatme/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;


class MainViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final _database = FirebaseFirestore.instance;

  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  MainViewModel(this._socialLogin);

  Future login() async {

    Future<UserCredential> userCredsFuture;

    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();

      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(),
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
        'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,
        'password': 'password',
      });

      await FirebaseAuth.instance.signInWithCustomToken(token);

      await _database.collection('users').doc("kakao:" + user!.id.toString()).set({
        'uid': "kakao:" + user!.id.toString(),
        'username': user!.kakaoAccount!.profile!.nickname,
      }, SetOptions(merge: true));
    }

    print(user);
  }

  Future logout() async {
    await _socialLogin.logout();
    await FirebaseAuth.instance.signOut();
    isLogined = false;
    user = null;
  }
}