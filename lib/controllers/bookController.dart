//kitapların alınması ve yönetilmesi ile ilgili işlevleri içeriyor

import 'package:books_app/data/bookdata.dart';
import 'package:get/get.dart';
import 'package:books_app/book_services/services.dart';
import '../book_services/service2.dart';

class BookController extends GetxController {
  var getbooks = <BookData>[]
      .obs; //içinde bulunduğu widget'ın otomatik olarak güncellenmesini sağlar
  var isLoading = true
      .obs; //veriler yüklenirken veya yüklenmediğinde durumu kontrol etmek için kullanılır
  BookServices service = BookServices();
  SearchedBookServices searchedBook = SearchedBookServices();
  @override
  void onInit() {
    callBooksList();
    super.onInit();
  }

  //callBooksList fonksiyonu, service.getAllBooks metodu aracılığıyla
  //kitap verilerini alır. Bu veriler getbooks listesine atanır.
  void callBooksList() async {
    try {
      var result = await service.getAllBooks();
      isLoading.value = true;
      if (result != null) {
        getbooks.assignAll(result);
      } else {
        print('Null');
      }
    } finally {
      isLoading.value = false;
    }

    update();
  }
}
