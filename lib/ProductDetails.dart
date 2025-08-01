import 'package:flutter/material.dart';
import 'package:slurp/model/Products.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF3E3C5),
              //Color(0xFFF4B679),
              Color(0xFFF6F6F6),
              //Color(0xFF5BE6F1),
              Color(0xFFCAF8FD),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.6, // 60% of screen height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.1), // ~40px
                      bottomRight: Radius.circular(screenWidth * 0.1), // ~40px
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.1),
                      bottomRight: Radius.circular(screenWidth * 0.1),
                    ),
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: screenHeight * 0.06, // Status bar padding
                  left: screenWidth * 0.05,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),
                ),

                // Favorite button
                Positioned(
                  top: screenHeight * 0.06,
                  right: screenWidth * 0.05,
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: screenWidth * 0.06,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.03),

            // Product Details Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.065, // ~26px
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Rating and Reviews
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < widget.product.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.orange,
                            size: screenWidth * 0.05,
                          );
                        }),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        '${widget.product.rating}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        '(${widget.product.reviewCount} reviews)',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  // Description
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  // Price and Add to Cart Section
                  Row(
                    children: [
                      // Price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              '\$${widget.product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.065,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart Button
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            // Handle add to cart
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${widget.product.name} added to cart!'),
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.08),
                            ),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {
                      // Handle add to cart
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${widget.product.name} added to cart!'),
                          backgroundColor: Colors.orange,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 94, 218, 227),
                        borderRadius: BorderRadius.circular(screenWidth * 0.08),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
