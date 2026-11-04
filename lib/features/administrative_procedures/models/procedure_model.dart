
class Procedure {
  final String id;
  final String category;
  final String title;
  final String description;
  final List<String> requirements;
  final List<String> documents;
  final List<String> steps;
  final String officialUrl;

  const Procedure({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.requirements,
    required this.documents,
    required this.steps,
    required this.officialUrl,
  });
}
