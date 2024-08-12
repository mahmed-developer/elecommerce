// models/product.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product_model.dart';

// Provider to fetch the list of products
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  QuerySnapshot querySnapshot =
  await FirebaseFirestore.instance.collection('products').get();

  return querySnapshot.docs.map((doc) {
    return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
});

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Convert a Product object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Create a Product object from a Map
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
    );
  }
}
