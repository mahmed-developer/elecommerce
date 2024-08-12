import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elecommerce/model/product_model.dart';

class ProductService {
  final CollectionReference productCollection =
  FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(ProductModel product) async {
    try {
      await productCollection.add(product.toMap());
    } catch (e) {
      print("Failed to add product: $e");
    }
  }
}