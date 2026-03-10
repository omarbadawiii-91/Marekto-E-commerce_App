import 'favorite_table.dart';
import 'purches_table.dart';

class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? productName;
  String? price;
  String? oldPrice;
  String sale;
  String? description;
  String? category;
  dynamic imageUrl;
  List<FavoriteTable>? favoriteTable;
  List<PurchesTable>? purchesTable;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale = '0',
    this.description,
    this.category,
    this.imageUrl,
    this.favoriteTable,
    this.purchesTable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['product_id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    productName: json['product_name'] as String?,
    price: json['price'] as String?,
    oldPrice: json['old_price'] as String?,
    sale: json['sale'] as String,
    description: json['description'] as String?,
    category: json['category'] as String?,
    imageUrl: json['image_url'] as dynamic,
    favoriteTable: (json['favorite_table'] as List<dynamic>?)
        ?.map((e) => FavoriteTable.fromJson(e as Map<String, dynamic>))
        .toList(),
    purchesTable: (json['purches_table'] as List<dynamic>?)
        ?.map((e) => PurchesTable.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'created_at': createdAt?.toIso8601String(),
    'product_name': productName,
    'price': price,
    'old_price': oldPrice,
    'sale': sale,
    'description': description,
    'category': category,
    'image_url': imageUrl,
    'favorite_table': favoriteTable?.map((e) => e.toJson()).toList(),
    'purches_table': purchesTable?.map((e) => e.toJson()).toList(),
  };
}
