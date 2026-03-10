class PurchesTable {
  String? id;
  String? userId;
  bool? isBought;
  DateTime? createdAt;
  String? productId;

  PurchesTable({
    this.id,
    this.userId,
    this.isBought,
    this.createdAt,
    this.productId,
  });

  factory PurchesTable.fromJson(Map<String, dynamic> json) => PurchesTable(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    isBought: json['is_bought'] as bool?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    productId: json['product_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'is_bought': isBought,
    'created_at': createdAt?.toIso8601String(),
    'product_id': productId,
  };
}
