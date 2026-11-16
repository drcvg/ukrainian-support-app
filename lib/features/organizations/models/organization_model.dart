import 'organization_location_model.dart';

class Organization {
  final String id;
  final String name;
  final String category;
  final String description;
  final String city;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String modalidadAtencion;
  final String estadoUbicacion;
  final List<OrganizationLocation> locations;

  const Organization({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.city,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    this.modalidadAtencion = 'no_confirmada',
    this.estadoUbicacion = 'pendiente',
    this.locations = const [],
  });
}
