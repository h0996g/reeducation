abstract final class Validators {
  Validators._();

  static String? required(String? value, [String field = 'Ce champ']) {
    if (value == null || value.trim().isEmpty) {
      return '$field est requis';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "L'email est requis";
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return "Format d'email invalide";
    }
    return null;
  }

  static String? password(String? value, [int minLength = 6]) {
    if (value == null || value.trim().isEmpty) {
      return 'Le mot de passe est requis';
    }
    if (value.length < minLength) {
      return 'Le mot de passe doit contenir au moins $minLength caractères';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.trim().isEmpty) {
      return 'La confirmation du mot de passe est requise';
    }
    if (value != password) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }
}
