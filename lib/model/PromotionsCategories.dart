class PromotionModel {
  final String title;
  final String image;
  final String buttonText;

  PromotionModel({
    required this.title,
    required this.image,
    required this.buttonText,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      title: json['title'],
      image: json['image'],
      buttonText: json['buttonText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'buttonText': buttonText,
    };
  }
}

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}

class FoodData {
  static final List<PromotionModel> promotions = [
    PromotionModel(
      title: 'FRESH ITALIAN PIZZA',
      image:
          'https://plus.unsplash.com/premium_photo-1673439304183-8840bd0dc1bf?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHx8MHx8fDA%3D',
      buttonText: 'Order Now',
    ),
    PromotionModel(
      title: 'GOURMET BURGER COLLECTION',
      image:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop',
      buttonText: 'Try Today',
    ),
    PromotionModel(
      title: 'HEALTHY SALAD BOWLS',
      image:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400&h=300&fit=crop',
      buttonText: 'Explore Menu',
    ),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(
      name: 'Pizza',
      image:
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGl6emF8ZW58MHx8MHx8fDA%3D',
    ),
    CategoryModel(
      name: 'Burgers',
      image:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=100&h=100&fit=crop',
    ),
    CategoryModel(
      name: 'Salads',
      image:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=100&h=100&fit=crop',
    ),
    CategoryModel(
      name: 'Pasta',
      image:
          'https://plus.unsplash.com/premium_photo-1664472682525-0c0b50534850?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3BhZ2hldHRpJTIwdG9tYXRvfGVufDB8fDB8fHww',
    ),
    CategoryModel(
      name: 'Desserts',
      image:
          'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=100&h=100&fit=crop',
    ),
  ];
}
