class Rate {
  String? ratesId;
  DateTime? createdAt;
  String? userId;
  String? productId;
  int? rates;

  Rate({this.ratesId, this.createdAt, this.userId, this.productId, this.rates});

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    ratesId: json['rates_id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    userId: json['user_id'] as String?,
    productId: json['product_id'] as String?,
    rates: json['rates'] as int? ,
  );

  Map<String, dynamic> toJson() => {
    'rates_id': ratesId,
    'created_at': createdAt?.toIso8601String(),
    'user_id': userId,
    'product_id': productId,
    'rates': rates,
  };
}
