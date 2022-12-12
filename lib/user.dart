class User {
  final int id;
  final String name;
  final double weight;

  User(this.id, this.name, this.weight);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "weight": weight,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['name'], json['weight']);
  }
}
