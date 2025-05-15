import 'package:flutter/material.dart';
import 'package:guitar_haven/models/product_model.dart';
import 'package:guitar_haven/utils/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    selectedColor =
        widget.product.availableColors.isNotEmpty
            ? widget.product.availableColors.first
            : null;
    selectedSize =
        widget.product.availableSizes.isNotEmpty
            ? widget.product.availableSizes.first
            : null;
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: AppTextStyles.subHeader),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppConstantsColor.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel (simplified)
            SizedBox(
              height: 250,
              child: PageView(
                children:
                    product.images
                        .map(
                          (url) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(url, fit: BoxFit.cover),
                          ),
                        )
                        .toList(),
              ),
            ),
            SizedBox(height: 16),
            Text(product.name, style: AppTextStyles.header),
            SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: AppTextStyles.priceText,
            ),
            SizedBox(height: 12),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            SizedBox(height: 20),

            // Color selector
            if (product.availableColors.isNotEmpty) ...[
              Text('Select Color', style: AppTextStyles.subHeader),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children:
                    product.availableColors.map((color) {
                      final bool isSelected = selectedColor == color;
                      return ChoiceChip(
                        label: Text(color),
                        selected: isSelected,
                        selectedColor: AppConstantsColor.accentColor,
                        onSelected: (_) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),
            ],

            // Size selector
            if (product.availableSizes.isNotEmpty) ...[
              Text('Select Size', style: AppTextStyles.subHeader),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children:
                    product.availableSizes.map((size) {
                      final bool isSelected = selectedSize == size;
                      return ChoiceChip(
                        label: Text(size),
                        selected: isSelected,
                        selectedColor: AppConstantsColor.accentColor,
                        onSelected: (_) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),
            ],

            // Quantity selector
            Text('Quantity', style: AppTextStyles.subHeader),
            SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: Icon(Icons.remove_circle_outline),
                  color: AppConstantsColor.primaryColor,
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: Icon(Icons.add_circle_outline),
                  color: AppConstantsColor.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 30),

            // Add to Cart button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstantsColor.primaryColor,
                ),
                onPressed: () {
                  // For now just show a snackbar
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Added to cart!')));
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppConstantsColor.accentColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
