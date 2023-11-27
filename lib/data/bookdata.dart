//Kitap kapağı, adı, yazarı gibi şeyleri tutacak bir Data Class oluşturmak için
class BookData {
  String bookCover;
  String bookName;
  String author;
  int pageNum;
  double rating;
  String description;

  BookData(
    this.bookCover,
    this.bookName,
    this.author,
    this.pageNum,
    this.rating,
    this.description,
  );
}
