class FavoriteTable {
  String? id;
  String? userId;
  DateTime? createdAt;
  String? productId;
  bool? isFavorite;

  FavoriteTable({
    this.id,
    this.userId,
    this.createdAt,
    this.productId,
    this.isFavorite,
  });

  factory FavoriteTable.fromJson(Map<String, dynamic> json) => FavoriteTable(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    productId: json['product_id'] as String?,
    isFavorite: json['is_favorite'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'created_at': createdAt?.toIso8601String(),
    'product_id': productId,
    'is_favorite': isFavorite,
  };
}
