class BookList {
  List<Book>? listofbook;

  BookList({this.listofbook});
  factory BookList.fromMap(Map<String, dynamic> map) {
    return BookList(listofbook: generateList(map));
  }
}

List<Book> generateList(Map<String, dynamic> map) {
  List<Book> books = [];

  for (var item in map['items']) {
    Book abook = Book.fromMap(item);
    books.add(abook);
  }
  return books;
}

class Book {
  String? selfLink;
  VolumeInfo? volumeInfo;

  Book({this.selfLink, this.volumeInfo});
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
        selfLink: map['selfLink'],
        volumeInfo: VolumeInfo.fromMap(map['volumeInfo']));
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? discription;

  ImageLink? imageLink;
  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.discription,
    this.imageLink,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      title: map['title'] ?? 'Data Not Found',
      subtitle: map['subtitle'] ?? 'Data Not Found',
      authors: List<String>.from(map['authors'] ?? [' Data Not Found']),
      publisher: map['publisher'] ?? 'Data Not Found',
      publishedDate: map['publishedDate'] ?? ' Data Not Found',
      discription: map['description'] ?? 'Data Not Found',
      imageLink: ImageLink.fromMap(map['imageLinks'] ??
          {
            "smallThumbnail":
                "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
            "thumbnail":
                "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg"
          }),
    );
  }
}

class ImageLink {
  String? smallThumbnail;
  String? thumbnail;
  ImageLink({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLink.fromMap(Map<String, dynamic> map) {
    return ImageLink(
      smallThumbnail: map['smallThumbnail'],
      thumbnail: map['thumbnail'],
    );
  }
}

class IndustryIdentifiers {}
