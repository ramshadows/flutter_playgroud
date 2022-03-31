/*
Describes a single user. Includes information like the user’s role, profile
picture, full name and app settings.
*/

class User {
  final String firstName;
  final String lastName;
  final String role;
  final String profileImageUrl;
  final int points;
  final bool darkMode;

  User({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.profileImageUrl,
    required this.points,
    required this.darkMode,
  });
}
