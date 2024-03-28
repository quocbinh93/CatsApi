import 'package:Gatitos/pages/breed_info_page.dart';
import 'package:Gatitos/pages/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:Gatitos/pages/home_page.dart';
import 'package:Gatitos/pages/cat_detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Gatitos/pages/login_page.dart';
import 'package:Gatitos/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Gatitos/pages/change_password.dart';


void main() async {
  // Khởi tạo Firebase App
  try {
    // Đảm bảo Flutter đã khởi tạo xong trước khi sử dụng Firebase
    WidgetsFlutterBinding.ensureInitialized();
    // Sử dụng Firebase.initializeApp để khởi tạo ứng dụng Firebase
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        // Các tùy chọn cho ứng dụng Firebase, ví dụ: appId, apiKey, projectId
        appId: '1:448133683719:android:c10c9ccddb3f83ce4e68a2',
        apiKey: 'AIzaSyDlUbO4t2BA2h25k_2JystpFD7QrpEQcSI',
        projectId: 'thecatapi-104b8',
        messagingSenderId: 'your_messaging_sender_id',
        databaseURL: 'your_database_url',
        storageBucket: 'your_storage_bucket',
      ),
    );
  } catch (e) {
    // Xử lý nếu có lỗi khi khởi tạo Firebase
    print('Lỗi: $e');
  }
  // Khởi chạy ứng dụng Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Details',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'fav': (context) => FavPage(),
        'detail': (context) => CatDetail(),
        'breed': (context) => BreedInfo(),
        'login':(context) => LoginPage(),
        'register':(context) => RegisterPage(),
        'change':(context) => ChangePasswordPage(),
      },
    );
  }
}
