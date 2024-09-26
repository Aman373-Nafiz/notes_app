abstract class Authrepo {
  Future<bool> signIn(String email, String password);
  Future<bool> register(String email, String password);
}
