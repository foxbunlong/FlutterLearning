import 'package:company_profile/model/company.dart';

class RepoData {
  static final Company longCompany = new Company(
    name: 'All about Dogs',
    location: 'Ho Chi Minh city, Vietnam',
    logo: 'images/dog_1.jpg',
    backdropPhoto: 'images/dog_2.jpg',
    about:
        "It's all about me. It's all about me. It's all about me. It's all about me. It's all about me. It's all about me. It's all about me. It's all about me. It's all about me. ",
    courses: <Course>[
      new Course(
        title: 'Title of course 1',
        thumbnail: 'images/dog_3.jpg',
        url: 'https://www.google.com.vn/',
      ),
      new Course(
        title: 'Title of course 2',
        thumbnail: 'images/dog_4.jpg',
        url: 'https://www.google.com.vn/',
      ),
      new Course(
        title: 'Title of course 3',
        thumbnail: 'images/dog_3.jpg',
        url: 'https://www.google.com.vn/',
      ),
      new Course(
        title: 'Title of course 4',
        thumbnail: 'images/dog_4.jpg',
        url: 'https://www.google.com.vn/',
      ),
      new Course(
        title: 'Title of course 5',
        thumbnail: 'images/dog_3.jpg',
        url: 'https://www.google.com.vn/',
      ),
    ],
  );
}
