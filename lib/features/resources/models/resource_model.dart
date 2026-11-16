class Resource {
  final String id;
  final String title;
  final String category;
  final String description;
  final String officialUrl;
  final String organizationName;
  final DateTime? verificationDate;

  const Resource({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.officialUrl,
    required this.organizationName,
    this.verificationDate,
  });
}