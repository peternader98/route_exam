class CatalogItemModel {
  String image;
  String name;
  String description;
  int price;

  CatalogItemModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  static List<CatalogItemModel> items = [
    CatalogItemModel(
      image: 'assets/images/tv.png',
      name: 'Samsung 65-Inch Neo QLED 4K Smart TV',
      description: 'Samsung 65-Inch Neo QLED 4K Smart TV QA6...',
      price: 32899,
    ),
    CatalogItemModel(
      image: 'assets/images/laptop.png',
      name: 'Apple',
      description: 'Apple 2025 MacBook Air 13-inch Laptop with....',
      price: 51000,
    ),
    CatalogItemModel(
      image: 'assets/images/watch.png',
      name: 'POLAR Ignite',
      description: 'POLAR Ignite 3 GPS Smartwatch iPhone ....',
      price: 19500,
    ),
    CatalogItemModel(
      image: 'assets/images/headset.png',
      name: 'Anker',
      description: 'Soundcore by Anker Life Q30 Hybrid Active Noise...',
      price: 3950,
    ),
    CatalogItemModel(
      image: 'assets/images/mobile.png',
      name: 'HONOR',
      description: 'HONOR 400 5G Smartphone, 200MP AI ....',
      price: 21999,
    ),
    CatalogItemModel(
      image: 'assets/images/speaker.png',
      name: 'JBL',
      description: 'JBL Go 4 Portable Bluetooth Speaker with I...',
      price: 1899,
    ),
  ];
}
