// Create this file as: lib/models/product.dart

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String category;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.rating,
    required this.reviewCount,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  // Create from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      description: json['description'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
    );
  }
}

// Dummy Products Data
class ProductData {
  static List<Product> getDummyProducts() {
    return [
      Product(
        id: 1,
        name: "Margherita Pizza",
        price: 12.99,
        imageUrl:
            "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=500",
        description: "Classic pizza with fresh mozzarella, tomatoes, and basil",
        category: "Pizza",
        rating: 4.5,
        reviewCount: 124,
      ),
      Product(
        id: 2,
        name: "Chicken Burger",
        price: 8.99,
        imageUrl:
            "https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=500",
        description: "Juicy grilled chicken burger with lettuce and mayo",
        category: "Burgers",
        rating: 4.3,
        reviewCount: 89,
      ),
      Product(
        id: 3,
        name: "Caesar Salad",
        price: 7.99,
        imageUrl:
            "https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500",
        description: "Fresh romaine lettuce with caesar dressing and croutons",
        category: "Salads",
        rating: 4.2,
        reviewCount: 67,
      ),
      Product(
        id: 4,
        name: "Chocolate Cake",
        price: 5.99,
        imageUrl:
            "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500",
        description: "Rich chocolate cake with creamy frosting",
        category: "Desserts",
        rating: 4.8,
        reviewCount: 156,
      ),
      Product(
        id: 5,
        name: "Spaghetti Carbonara",
        price: 11.99,
        imageUrl:
            "https://images.unsplash.com/photo-1560434019-4558f9a9e2a1?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHNwYWdoZXR0aSUyMGNhcmJvbmFyYXxlbnwwfHwwfHx8MA%3D%3D",
        description: "Classic Italian pasta with eggs, cheese, and pancetta",
        category: "Pasta",
        rating: 4.6,
        reviewCount: 98,
      ),
      Product(
        id: 6,
        name: "Fish Tacos",
        price: 9.99,
        imageUrl:
            "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZmlzaCUyMHRhY29zfGVufDB8fDB8fHww",
        description: "Grilled fish tacos with cabbage slaw and lime",
        category: "Mexican",
        rating: 4.4,
        reviewCount: 78,
      ),
      Product(
        id: 7,
        name: "Iced Coffee",
        price: 3.99,
        imageUrl:
            "https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=500",
        description: "Cold brew coffee served over ice with milk",
        category: "Beverages",
        rating: 4.1,
        reviewCount: 234,
      ),
      Product(
        id: 8,
        name: "BBQ Ribs",
        price: 16.99,
        imageUrl:
            "https://images.unsplash.com/photo-1544025162-d76694265947?w=500",
        description: "Tender pork ribs with smoky BBQ sauce",
        category: "BBQ",
        rating: 4.7,
        reviewCount: 145,
      ),
      Product(
        id: 9,
        name: "Vegetable Stir Fry",
        price: 8.99,
        imageUrl:
            "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500",
        description:
            "Fresh mixed vegetables stir-fried with garlic and soy sauce",
        category: "Asian",
        rating: 4.0,
        reviewCount: 56,
      ),
      Product(
        id: 10,
        name: "Apple Pie",
        price: 4.99,
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6t8bHWxKXl8JGoAiZrenKnlCEvEo3PG6_1Q&s",
        description: "Homemade apple pie with cinnamon and flaky crust",
        category: "Desserts",
        rating: 4.5,
        reviewCount: 112,
      ),
    ];
  }

  // Get products by category
  static List<Product> getProductsByCategory(String category) {
    return getDummyProducts()
        .where((product) => product.category == category)
        .toList();
  }

  // Get popular products (rating >= 4.5)
  static List<Product> getPopularProducts() {
    return getDummyProducts()
        .where((product) => product.rating >= 4.5)
        .toList();
  }

  // Search products by name
  static List<Product> searchProducts(String query) {
    return getDummyProducts()
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Get all categories
  static List<String> getCategories() {
    return getDummyProducts()
        .map((product) => product.category)
        .toSet()
        .toList();
  }
}

// Usage Examples:
/*

// Get all products
List<Product> allProducts = ProductData.getDummyProducts();

// Get products by category
List<Product> pizzas = ProductData.getProductsByCategory("Pizza");

// Get popular products
List<Product> popularProducts = ProductData.getPopularProducts();

// Search products
List<Product> searchResults = ProductData.searchProducts("chicken");

// Get all categories
List<String> categories = ProductData.getCategories();

// Use in ListView.builder
ListView.builder(
  itemCount: allProducts.length,
  itemBuilder: (context, index) {
    final product = allProducts[index];
    return ListTile(
      leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.amber, size: 16),
          Text('${product.rating}'),
        ],
      ),
    );
  },
)

*/