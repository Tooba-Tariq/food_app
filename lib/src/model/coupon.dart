class Coupon {
  String id;
  String name;
  String code;
  String description;
  // String sellerId;
  String discount;
  bool isUsed;
  String startDate;
  String endDate;
  Coupon({
    required this.id,
    required this.code,
    required this.description,
    required this.discount,
    required this.endDate,
    required this.isUsed,
    required this.name,
    // required this.sellerId,
    required this.startDate,
  });
}
