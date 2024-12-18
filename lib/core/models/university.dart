class University {
  final String alphaTwoCode;
  final String name;
  final List<String> webPages;
  final String country;

  University({
    required this.name,
    required this.alphaTwoCode,
    required this.webPages,
    required this.country,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      alphaTwoCode: json['alpha_two_code'],
      webPages: List<String>.from(json['web_pages']),
      country: json['country'],
    );
  }

}