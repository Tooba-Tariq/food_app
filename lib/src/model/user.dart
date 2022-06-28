class User {
  String id;
  String firstName;
  String lastName;
  String username;
  String phoneNo;
  String address;
  String status;
  int age;
  String image;
  String bio;

  User({
    required this.address,
    required this.age,
    required this.bio,
    required this.firstName,
    required this.id,
    required this.image,
    required this.lastName,
    required this.phoneNo,
    required this.username,
    required this.status,
  });
}
