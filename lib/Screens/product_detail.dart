import 'package:elecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController=ref.watch(productProvider);
    return Container();
  }
}
