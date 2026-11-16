class OrganizationLocation {
  final int id;
  final int organizationId;
  final String? name;
  final String? city;
  final String? address;
  final String? phone;
  final String? email;
  final String attentionMode;
  final String locationStatus;
  final String? sourceUrl;
  final DateTime? verificationDate;
  final bool active;
  final String? identifier;

  const OrganizationLocation({
    required this.id,
    required this.organizationId,
    this.name,
    this.city,
    this.address,
    this.phone,
    this.email,
    required this.attentionMode,
    required this.locationStatus,
    this.sourceUrl,
    this.verificationDate,
    required this.active,
    this.identifier,
  });
}
