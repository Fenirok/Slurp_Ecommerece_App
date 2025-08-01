import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slurp/MainPage/bloc/navigation_bloc.dart';
import 'package:slurp/model/Products.dart';
import 'package:slurp/model/PromotionsCategories.dart';
import 'package:slurp/ProductDetails.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is ProductDetailsNavigation) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: state.product),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Slider
            Center(
              child: Container(
                height: screenHeight * 0.50, // ~470px on 820px screen
                width: double.infinity,
                decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius:
                        BorderRadius.circular(screenWidth * 0.026)), // ~10px
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: FoodData.promotions.length,
                  itemBuilder: (context, index) {
                    return _buildPromotionCard(FoodData.promotions[index]);
                  },
                ),
              ),
            ),

            // Page Indicator
            SizedBox(height: screenHeight * 0.012), // ~10px
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                FoodData.promotions.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01), // ~4px
                  width: screenWidth * 0.021, // ~8px
                  height: screenWidth * 0.021, // ~8px
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.orange
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.037), // ~30px

            // Categories Section
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.052), // ~20px
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CATEGORIES',
                    style: TextStyle(
                      fontSize: screenWidth * 0.047, // ~18px
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: screenWidth * 0.037, // ~14px
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.018), // ~15px

            // Categories List
            Container(
              height: screenHeight * 0.122, // ~100px
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.052), // ~20px
                itemCount: FoodData.categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryCard(FoodData.categories[index]);
                },
              ),
            ),

            SizedBox(height: screenHeight * 0.037), // ~30px

            // Products Section
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.052), // ~20px
              child: Text(
                'FEATURED PRODUCTS',
                style: TextStyle(
                  fontSize: screenWidth * 0.047, // ~18px
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.018), // ~15px

            // Products Grid
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.052), // ~20px
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.039, // ~15px
                  mainAxisSpacing: screenHeight * 0.018, // ~15px
                  childAspectRatio: 0.75,
                ),
                itemCount: ProductData.getDummyProducts().length,
                itemBuilder: (context, index) {
                  final product = ProductData.getDummyProducts()[index];
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<NavigationBloc>()
                          .add(NavigateToProductDetails(product));
                    },
                    child: _buildProductCard(product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionCard(PromotionModel promotion) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.052, // ~20px
        vertical: screenHeight * 0.024, // ~20px
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.052), // ~20px
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.156), // ~60px
        child: Stack(
          children: [
            // Background Image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(promotion.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),

            // Content
            Positioned(
              bottom: screenHeight * 0.024, // ~20px
              left: screenWidth * 0.052, // ~20px
              right: screenWidth * 0.052, // ~20px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promotion.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.042, // ~16px
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.012), // ~10px
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.052, // ~20px
                      vertical: screenHeight * 0.0098, // ~8px
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(screenWidth * 0.052), // ~20px
                    ),
                    child: Text(
                      promotion.buttonText,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(CategoryModel category) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.039), // ~15px
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.182, // ~70px
            height: screenWidth * 0.182, // ~70px
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.0098), // ~8px
          Text(
            category.name,
            style: TextStyle(
              fontSize: screenWidth * 0.039, // ~12px
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      //margin: EdgeInsets.only(right: screenWidth * 0.06), // ~15px
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.08), // ~10px
        color: Colors.transparent,
        /*
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: screenWidth * 0.013, // ~5px
            offset: Offset(0, screenHeight * 0.0024), // ~2px
          ),
        ],
        */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              height: screenHeight * 0.244, // ~90px
              width: screenWidth * 0.437, // ~160px
              //margin: EdgeInsets.only(right: screenWidth * 0.049), // ~15px
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenWidth * 0.026), // ~10px
                ),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Product Info and Add to Cart Button
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.026), // ~10px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.042, // ~14px
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: screenHeight * 0.0049), // ~4px

                  // Price and Add to Cart Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.042, // ~16px
                        ),
                      ),

                      // Add to Cart Button
                      GestureDetector(
                        onTap: () {
                          // Handle add to cart
                          print('Added ${product.name} to cart');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.021, // ~8px
                            vertical: screenHeight * 0.0049, // ~4px
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(
                                screenWidth * 0.039), // ~15px
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                            size: screenWidth * 0.057, // ~16px
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
