import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Crear un logger
  final Logger _logger = Logger('AuthService');

  // Iniciar sesión con email y contraseña
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      _logger.info('Intentando iniciar sesión con $email');
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _logger.info('Inicio de sesión exitoso');
      return userCredential.user;
    } catch (e) {
      _logger.severe('Error en el inicio de sesión: $e');
      return null;
    }
  }

  // Registrar un nuevo usuario
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      _logger.info('Registrando usuario $email');
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _logger.info('Registro exitoso');
      return userCredential.user;
    } catch (e) {
      _logger.severe('Error al registrar usuario: $e');
      return null;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    try {
      _logger.info('Cerrando sesión...');
      await _auth.signOut();
      _logger.info('Sesión cerrada correctamente');
    } catch (e) {
      _logger.severe('Error al cerrar sesión: $e');
    }
  }

  // Obtener el usuario actual
  User? getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      _logger.info('Usuario actual: ${user.email}');
    } else {
      _logger.info('No hay usuario autenticado');
    }
    return user;
  }
}
