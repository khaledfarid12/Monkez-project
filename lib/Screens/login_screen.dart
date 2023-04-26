class User {
  late String _firstName,
      _lastName,
      _userName,
      _email,
      _nationalId,
      _password,
      _confirmPassword;

  void setData(
      String password,
      String userName,
      String email,
      String natiinalId,
      String confirmPassword,
      String firstName,
      String lastName) {
    _password = password;
    _email = email;
    _firstName = firstName;
    _confirmPassword = confirmPassword;
    _lastName = lastName;
    _nationalId = natiinalId;
    _email = email;
  }

  String getData() {
    return _password;
    return _firstName;
    return _email;
    return _firstName;
    return _firstName;
    return _firstName;
    return _firstName;
    return _firstName;
  }
}
