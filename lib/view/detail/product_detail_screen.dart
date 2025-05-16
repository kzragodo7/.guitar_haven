import 'package:flutter/material.dart';
import 'package:guitar_haven/models/product_model.dart';
import 'package:guitar_haven/utils/constants.dart';
import 'package:guitar_haven/services/cart_service.dart';

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

  void _addToCart() {
    CartService().addToCart(
      widget.product,
      quantity,
      selectedColor,
      selectedSize,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.product.name} added to cart!'),
        backgroundColor: const Color.fromARGB(255, 252, 161, 133),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: AppTextStyles.subHeader),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppConstantsColor.darkBrown),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel
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
            const SizedBox(height: 16),
            Text(product.name, style: AppTextStyles.subHeader),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkBrown,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                color: AppConstantsColor.darkBrown,
              ),
            ),
            const SizedBox(height: 20),

            // Color selector
            if (product.availableColors.isNotEmpty) ...[
              Text('Select Color', style: AppTextStyles.subHeader),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children:
                    product.availableColors.map((color) {
                      final isSelected = selectedColor == color;
                      return ChoiceChip(
                        label: Text(color),
                        selected: isSelected,
                        selectedColor: const Color.fromARGB(255, 243, 152, 124),
                        onSelected:
                            (_) => setState(() => selectedColor = color),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),
            ],

            // Size selector
            if (product.availableSizes.isNotEmpty) ...[
              Text('Select Size', style: AppTextStyles.subHeader),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children:
                    product.availableSizes.map((size) {
                      final isSelected = selectedSize == size;
                      return ChoiceChip(
                        label: Text(size),
                        selected: isSelected,
                        selectedColor: AppConstantsColor.lightBrown,
                        onSelected: (_) => setState(() => selectedSize = size),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),
            ],

            // Quantity selector
            Text('Quantity', style: AppTextStyles.subHeader),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: _decrementQuantity,
                  icon: const Icon(Icons.remove_circle_outline),
                  color: AppConstantsColor.darkBrown,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 218, 207),
                  ),
                ),
                IconButton(
                  onPressed: _incrementQuantity,
                  icon: const Icon(Icons.add_circle_outline),
                  color: AppConstantsColor.darkBrown,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: AppButtonStyle.primary,
                onPressed: _addToCart,
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
