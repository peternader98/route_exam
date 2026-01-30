import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_exam/core/app_colors.dart';
import 'package:route_exam/core/app_theme.dart';
import 'package:route_exam/models/catalog_item_model.dart';
import 'package:route_exam/providers/catalog_provider.dart';
import 'package:route_exam/screens/cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  static const String routeName = 'catalog';

  @override
  Widget build(BuildContext context) {
    CatalogProvider catalogProvider = Provider.of<CatalogProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'),
        actions: [
          Badge(
            label: Text(catalogProvider.itemCount.toString()),
            isLabelVisible: catalogProvider.itemCount > 0,
            backgroundColor: Colors.red,
            alignment: Alignment.topLeft,
            offset: Offset(5,10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: Image.asset('assets/images/cart.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 9),
            const Text(
              'Recommendations',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 164 / 216,
                ),
                itemCount: CatalogItemModel.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.containerBg,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.imageBg,
                            ),
                            child: Image.asset(
                              CatalogItemModel.items[index].image,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              spacing: 4,
                              children: [
                                Text(
                                  CatalogItemModel.items[index].description,
                                  style: AppTheme.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 10),
                                    Text('4.5 (132 reviews)', style: AppTheme.review),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${CatalogItemModel.items[index].price} EGP',
                                        style: AppTheme.price,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<CatalogProvider>(context, listen: false).add(CatalogItemModel.items[index]);
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16),
                                            ),
                                          ),
                                          builder: (context) {
                                            return Container(
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(CatalogItemModel.items[index].name, style: AppTheme.title.copyWith(fontSize: 16),),
                                                  Row(
                                                    children: [
                                                      Text('Added to cart ', style: AppTheme.title.copyWith(fontSize: 16),),
                                                      Image.asset('assets/images/check_mark.png'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 24),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: AppColors.blue,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pushNamed(context, CartScreen.routeName);
                                                    },
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                          'View Cart',
                                                          style: TextStyle(color: AppColors.containerBg),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 16),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: AppColors.containerBg,
                                                      foregroundColor: AppColors.blue,
                                                      side: BorderSide(color: AppColors.blue),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(16),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                          'Continue Shopping',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset('assets/images/add_to_cart.png'),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
