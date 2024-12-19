import 'package:get/get.dart';
import '../../../../data/models/admin_user/admin_user_model.dart';
import '../../../../services/firebase_functions_services.dart';

class PermissionsController extends GetxController {
  final FirebaseFunctionsService _services = FirebaseFunctionsService();

  List<AdminUserModel> _listUsers = []; // Lista completa de usuarios
  List<AdminUserModel> _filteredUsers = []; // Lista filtrada
  List<AdminUserModel> get filteredUsers => _filteredUsers;

  bool _loading = true;
  bool get loading => _loading;

  @override
  Future<void> onInit() async {
    // Obtiene directamente la lista de AdminUserModel
    _listUsers = await _services.getAllUsers();
    _filteredUsers = _listUsers; // Inicialmente, muestra toda la lista
    _loading = false;
    update(['view']);
    super.onInit();
  }

  // Filtro en tiempo real
  void filterUsers(String query) {
    if (query.isEmpty) {
      _filteredUsers = _listUsers; // Restablece la lista si no hay consulta
    } else {
      final lowerQuery = query.toLowerCase();

      _filteredUsers = _listUsers.where((user) {
        final email = user.email?.toLowerCase() ?? '';
        final uid = user.uid.toLowerCase();
        final claims = user.customClaims.toString().toLowerCase();
        // Verifica si la consulta coincide con uid, email o permisos
        return uid.contains(lowerQuery) ||
            email.contains(lowerQuery) ||
            claims.contains(lowerQuery);
      }).toList();
    }
    update(['view']); // Actualiza la vista
  }

  // Reinicia el filtro
  void resetFilter() {
    _filteredUsers = _listUsers; // Restablece la lista completa
    update(['view']); // Actualiza la vista
  }
}
