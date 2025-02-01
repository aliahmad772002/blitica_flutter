class User {
  final String name;
  final String picture;
  final int age;
  final String phone;
  final String city;

  User({
    required this.name,
    required this.picture,
    required this.age,
    required this.phone,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: '${json["name"]["first"]} ${json["name"]["last"]}',
      picture: json["picture"]["large"],
      age: json["dob"]["age"],
      phone: json["phone"],
      city: json["location"]["city"],
    );
  }
}
