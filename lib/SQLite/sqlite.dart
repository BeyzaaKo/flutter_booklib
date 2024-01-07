import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:books_app/jsonModel/users_lists.dart';
import 'package:books_app/jsonModel/users.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  final databaseName = "booksApp.db";

  //Now we must create our user table into our sqlite db

  String users =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrEmail TEXT, usrName TEXT UNIQUE, usrPassword TEXT, profilePicture TEXT)";

  //initDB: uygulama ilk çalıştığında veritabanını oluşturur
  Future<Database> initDB() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  //Login Method: kullanıcı girişini kontrol eder, kullanıcı adı ve şifre eşleşirse true eşleşmezse false döner
  Future<bool> login(Users user) async {
    final Database db = await initDB();

    //Kullanıcı adı ve şifre kontrolü burada yapılır
    var result = await db.rawQuery(
        "select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Signup Method: yeni bir kullanıcıyı veritabanına ekler
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  Future<User?> loginOrSignUp(Users user) async {
    final Database db = await initDB();

    // Kullanıcı adı ve şifre kontrolü burada yapılır
    var result = await db.rawQuery(
        "select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");

    if (result.isNotEmpty) {
      // Kullanıcı girişi başarılıysa User nesnesi oluştur
      return User(username: user.usrName);
    } else {
      // Kullanıcı yoksa, yeni bir kullanıcı oluştur
      await db.insert('users', user.toMap());
      return User(username: user.usrName);
    }
  }

  // Yeni metod: Kullanıcı profili güncelleme
  Future<int> updateUserProfile(String username, String profilePicture) async {
    final Database db = await initDB();

    return db.update(
      'users',
      {'profilePicture': profilePicture},
      where: 'usrName = ?',
      whereArgs: [username],
    );
  }
}
