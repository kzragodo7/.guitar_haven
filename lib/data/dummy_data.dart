import '../models/product_model.dart';

final List<Product> dummyProducts = [
  Product(
    id: 'g1',
    name: 'Fender Stratocaster',
    description:
        'Classic electric guitar known for bright tones and versatility.',
    price: 1200.00,
    images: [
      'https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?auto=format&fit=crop&w=800&q=80',
      'https://images.unsplash.com/photo-1503398881876-1cbf367bca36?auto=format&fit=crop&w=800&q=80',
    ],
    availableColors: ['Sunburst', 'Black', 'White'],
    availableSizes: ['Full', '3/4'],
  ),
  Product(
    id: 'g2',
    name: 'Gibson Les Paul',
    description:
        'Warm, rich sound with a heavy body perfect for rock and blues.',
    price: 1500.00,
    images: [
      'https://images.unsplash.com/photo-1533681707659-4b3562d3a044?auto=format&fit=crop&w=800&q=80',
    ],
    availableColors: ['Cherry Sunburst', 'Gold Top'],
    availableSizes: ['Full'],
  ),
  Product(
    id: 'g3',
    name: 'Yamaha Acoustic Guitar',
    description:
        'Smooth tone acoustic guitar, great for beginners and pros alike.',
    price: 350.00,
    images: [
      'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80',
    ],
    availableColors: ['Natural', 'Brown'],
    availableSizes: ['Full', '3/4', '1/2'],
  ),
];
