import 'package:flutter/material.dart';

import '../model/book.dart';

/// Book Data Provider containing the list of the books and all the
/// functions requires
class BooksProvider with ChangeNotifier {
  final List<Book> _bookList = <Book>[
    Book(
      author: 'S S Bhavikatti',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
      id: '1',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201016.jpg',
      sem: 1,
      subID: 'cv1001',
      title: 'Basic civil Engineering S S Bhavikatti',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/basic-civil-engineering-s-s-bhavikatti.pdf',
    ),
    Book(
      author: 'Punmia',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/Basic%20Civil%20Engineering%20By%20Punmia.PDF',
      id: '2',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201145.jpg',
      sem: 1,
      subID: 'cv1001',
      title: 'Basic Civil Engineering By Punmia',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/Basic%20Civil%20Engineering%20By%20Punmia.PDF',
    ),
    Book(
      author: 'R S Khurmi',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/Engineering%20Mechanics%20By%20R%20S%20Khurmi.pdf',
      id: '3',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/IMG_20210917_201601.jpg',
      sem: 2,
      subID: 'me1001',
      title: 'Engineering Mechanics By R S Khurmi',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/civil/Engineering%20Mechanics%20By%20R%20S%20Khurmi.pdf',
    ),
    Book(
      author: 'Robert L. Boylestad Louis Nashelsky',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Electronics/Electronic%20Devices%20and%20Circuit%20Theory%20(11th%20Edition)%20by%20Robert%20L.%20Boylestad,%20Louis%20Nashelsky%20(z-lib.org).pdf',
      id: '4',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Electronics/IMG_20210917_200630.jpg',
      sem: 1,
      subID: 'ec1001',
      title: 'Electronic Devices and Circuit Theory',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Electronics/Electronic%20Devices%20and%20Circuit%20Theory%20(11th%20Edition)%20by%20Robert%20L.%20Boylestad,%20Louis%20Nashelsky%20(z-lib.org).pdf',
    ),
    Book(
      author: 'B.S. Grewal',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EM-2/B.S.%20Grewal.pdf',
      id: '5',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EM-2/IMG_20210917_201706.jpg',
      sem: 1,
      subID: 'ma1101',
      title: 'Higher Engineering Mathematics',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EM-2/B.S.%20Grewal.pdf',
    ),
    Book(
      author: 'N. D. Bhatt',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Engg%20Drawing/Engineering%20Drawing%20by%20N.%20D.%20Bhatt%20by%20N.%20D.%20Bhatt%20(z-lib.org).pdf',
      id: '6',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Engg%20Drawing/953a499656473630e8c623a95428c144.jpg',
      sem: 1,
      subID: 'me1002',
      title: 'Engineering Drawing by N. D. Bhatt',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Engg%20Drawing/Engineering%20Drawing%20by%20N.%20D.%20Bhatt%20by%20N.%20D.%20Bhatt%20(z-lib.org).pdf',
    ),
    Book(
      author: 'Bharucha E',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Bharucha%20E.pdf',
      id: '7',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/IMG_20210917_202021.jpg',
      sem: 1,
      subID: 'cy1002',
      title: 'Environmental Studies"',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Bharucha%20E.pdf',
    ),
    Book(
      author: 'G. TYLER MILLER, JR.',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Environmental%20Science%20-%20Miller.pdf',
      id: '8',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/IMG_20210917_201902.jpg',
      sem: 1,
      subID: 'cy1002',
      title: 'Environmental Science - Miller',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Environmental%20Science%20-%20Miller.pdf',
    ),
    Book(
      author: 'AK De',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Environmental%20Studies%20-%20AK%20De.pdf',
      id: '9',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/IMG_20210917_201750.jpg',
      sem: 1,
      subID: 'cy1002',
      title: 'Environmental Studies - AK De',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/EVS/Environmental%20Studies%20-%20AK%20De.pdf',
    ),
    Book(
      author: 'Resnick Halliday',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Physics/Resnick%20Halliday.pdf',
      id: '10',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Physics/IMG_20210917_200314.jpg',
      sem: 1,
      subID: 'py1001',
      title: 'Fundamentals of Physics',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem1/Physics/Resnick%20Halliday.pdf',
    ),
    Book(
      author: 'Jain and Jain',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Chemistry/Engineering_Chemistry_by_Jain_and_Jain.pdf',
      id: '11',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Chemistry/IMG_20210917_202113.jpg',
      sem: 2,
      subID: 'cy1001',
      title: 'Engineering_Chemistry_by_Jain_and_Jain',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Chemistry/Engineering_Chemistry_by_Jain_and_Jain.pdf',
    ),
    Book(
      author: 'Kulshreshtha D.C',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/Basic%20Electrical%20Engineering%20by%20Kulshreshtha%20D.C.%20(z-lib.org).pdf',
      id: '12',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/91UUJx-UyZL.jpg',
      sem: 2,
      subID: 'ee1001',
      title: 'Basic Electrical Engineering by Kulshreshtha D.C',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/Basic%20Electrical%20Engineering%20by%20Kulshreshtha%20D.C.%20(z-lib.org).pdf',
    ),
    Book(
      author: 'Nagsarkar',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/Power%20System%20Analysis%20Power%20System%20Analysis%20by%20Nagsarkar,%20T.%20K.,%20Sukhija,%20M.%20S%20(z-lib.org).pdf',
      id: '13',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/51Z+NoeAysL.jpg',
      sem: 2,
      subID: 'ee1001',
      title: 'Power System Analysis Power System Analysis by Nagsarkar',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Electrical/Power%20System%20Analysis%20Power%20System%20Analysis%20by%20Nagsarkar,%20T.%20K.,%20Sukhija,%20M.%20S%20(z-lib.org).pdf',
    ),
    Book(
      author: 'B.S. Grewal',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Maths/B.S.%20Grewal.pdf',
      id: '14',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Maths/IMG_20210917_201706.jpg',
      sem: 2,
      subID: 'ma1101',
      title: 'Higher Engineering Mathematics',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/Maths/B.S.%20Grewal.pdf',
    ),
    Book(
      author: 'Meenakshi Raman',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/LN1001/Raman,%20Meenakshi_%20Sharma,%20Sangeeta%20-%20Technical%20communication_%20principles%20and%20practice-Oxford%20University%20Press%20(2015).pdf',
      id: '15',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/LN1001/51dKnCox8ZL.jpg',
      sem: 2,
      subID: 'ln1001',
      title:
          'Technical communication_ principles and practice-Oxford University',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/LN1001/Raman,%20Meenakshi_%20Sharma,%20Sangeeta%20-%20Technical%20communication_%20principles%20and%20practice-Oxford%20University%20Press%20(2015).pdf',
    ),
    Book(
      author: 'Yashavant Kanetkar',
      courseID: 'btech',
      departmentID: 'fy',
      downloadUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/PSUC/Let%20Us%20C%20by%20Yashavant%20Kanetkar%20(z-lib.org).pdf',
      id: '16',
      imgUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/PSUC/letusc.jpg',
      sem: 2,
      subID: 'cs1001',
      title: 'Let Us C by Yashavant Kanetkar',
      viewUrl:
          'https://blacktimber-labs.github.io/LiberDeck-Resources/sem2/PSUC/Let%20Us%20C%20by%20Yashavant%20Kanetkar%20(z-lib.org).pdf',
    ),
  ];

  /// Getter to make a copy of the List.
  List<Book> get bookList {
    return _bookList;
  }

  /// Function to add book to the list
  void addBook(Book book) {
    bookList.add(book);
    notifyListeners();
  }

  /// Function to change the save status of the book.
  void changeStatus(Book book) {
    book.saveStatus = !book.saveStatus;
    notifyListeners();
  }

  /// Function to showcase the final list of the book semester wise.
  List<Book> findBook(
    String courseID,
    String departmentID,
    int sem,
    String subID,
  ) {
    final List<Book> finalbookList = bookList
        .where(
          (Book element) =>
              (element.courseID
                  .toLowerCase()
                  .contains(courseID.toLowerCase())) &&
              (element.departmentID
                  .toLowerCase()
                  .contains(departmentID.toLowerCase())) &&
              (element.subID.toLowerCase().contains(subID.toLowerCase())) &&
              element.sem == sem,
        )
        .toList();
    return finalbookList;
  }
}
