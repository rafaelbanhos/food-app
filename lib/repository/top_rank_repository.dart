import 'package:food_app/models/top_rank_model.dart';

class TopRankingRepository {
  static final List<TopRankModel> items = [
    TopRankModel(
      img: 'assets/images/mcdonald.png',
      title: "McDonald's",
      category: 'Lanches',
    ),
    TopRankModel(
      img: 'assets/images/cocobambu.jpg',
      title: 'Coco Bambu',
      category: 'Frutos do Mar',
    ),
    TopRankModel(
      img: 'assets/images/habibs.png',
      title: "Habib's",
      category: 'Lanches',
    ),
    TopRankModel(
      img: 'assets/images/chinainbox.png',
      title: 'China in Box',
      category: 'Chinesa',
    ),
  ];
}
