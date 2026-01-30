import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_exam/core/app_colors.dart';
import 'package:route_exam/core/app_theme.dart';
import 'package:route_exam/providers/catalog_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    CatalogProvider catalogProvider = Provider.of<CatalogProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blue),
        title: Text('My Cart', style: AppTheme.price.copyWith(fontSize: 18)),
        centerTitle: true,
        actions: [
          Badge(
            label: Text(catalogProvider.itemCount.toString()),
            isLabelVisible: catalogProvider.itemCount > 0,
            backgroundColor: Colors.red,
            alignment: Alignment.topLeft,
            offset: Offset(-5,0),
            child: Image.asset('assets/images/cart.png'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  height: 135,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.containerBg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Items Total', style: AppTheme.cartDescription),
                          Row(
                            children: [
                              Text('EGP ', style: AppTheme.cartCurrency),
                              Text(
                                '${catalogProvider.calculateTotal()}',
                                style: AppTheme.cartPrice,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping Fee', style: AppTheme.cartDescription),
                          Text('Free', style: AppTheme.free),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: AppTheme.cartDescription),
                          Row(
                            children: [
                              Text('EGP ', style: AppTheme.cartCurrency),
                              Text(
                                '${catalogProvider.calculateTotal()}',
                                style: AppTheme.cartPrice,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '${catalogProvider.itemCount} Items',
                  style: AppTheme.cartDescription,
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.separated(
                    itemCount: catalogProvider.items.toSet().toList().length,
                    separatorBuilder: (context, index) => SizedBox(height: 11),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        height: 128,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.containerBg,
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            Container(
                              width: 72,
                              height: 95,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.imageBg,
                              ),
                              child: Image.asset(
                                catalogProvider.items[index].image,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 3,
                                          children: [
                                            Text(
                                              catalogProvider.items[index].name,
                                              style: AppTheme.price.copyWith(
                                                fontSize: 16,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              catalogProvider
                                                  .items[index]
                                                  .description,
                                              style: AppTheme.cartDescription
                                                  .copyWith(fontSize: 12),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        style: IconButton.styleFrom(
                                          side: BorderSide(
                                            color: AppColors.imageBg,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          catalogProvider.remove(
                                            catalogProvider.items[index],
                                          );
                                        },
                                        icon: Image.asset(
                                          'assets/images/delete.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'EGP ',
                                            style: AppTheme.cartCurrency,
                                          ),
                                          Text(
                                            '${catalogProvider.items[index].price}',
                                            style: AppTheme.cartPrice,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 28,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: AppColors.imageBg,
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 4,
                                          children: [
                                            IconButton(
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                ),
                                                backgroundColor:
                                                    AppColors.imageBg,
                                              ),
                                              onPressed: () {
                                                catalogProvider.remove(
                                                  catalogProvider.items[index],
                                                );
                                              },
                                              icon: Text(
                                                '-',
                                                style: TextStyle(
                                                  color: AppColors.gray,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${catalogProvider.countGeneral(catalogProvider.items)[catalogProvider.items[index]]}',
                                            ),
                                            IconButton(
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                ),
                                                backgroundColor: AppColors.blue,
                                              ),
                                              onPressed: () {
                                                catalogProvider.add(
                                                  catalogProvider.items[index],
                                                );
                                              },
                                              icon: Text(
                                                '+',
                                                style: TextStyle(
                                                  color: AppColors.containerBg,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(color: AppColors.containerBg),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
