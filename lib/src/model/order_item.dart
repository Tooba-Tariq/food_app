class OrderItem {
  String id;
  String couponId;
  String userId;
  String sellerId;
  String date;
  String time;
  String itemId;
  String quantity;
  String location;
  String price;
  String status;
  OrderItem({
    required this.id,
    required this.couponId,
    required this.sellerId,
    required this.userId,
    required this.date,
    required this.itemId,
    required this.location,
    required this.price,
    required this.quantity,
    required this.status,
    required this.time,
  });
}
