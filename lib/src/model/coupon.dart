class Coupon {
  String id;
  String name;
  String code;
  String description;
  String userId;
  String discount;
  String image;
  String validity;
  Coupon({
    required this.id,
    required this.code,
    required this.description,
    required this.discount,
    required this.name,
    required this.userId,
    required this.image,
    required this.validity,
  });
}
