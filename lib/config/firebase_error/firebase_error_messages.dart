class FirebaseErrors {
  static String getMessage(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
      case 'email-already-in-use':
        return "This e-mail address is already in use, please use a different e-mail address.";
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        return "User not found please register.";
      case 'The password is invalid or the user does not have a password.':
        return 'password not valid';
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        return 'Please check your internet connection';
      case 'ERROR_USER_NOT_FOUND':
      case 'user-not-found':
        return 'No user found with this email.';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Too many requests to log into this account.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Server error, please try again later';
      case 'ERROR_INVALID_EMAIL':
      case 'invalid-email':
        return "The email address is badly formatted.";
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return "The e-mail address in your Facebook account has been registered in the system before. Please login by trying other methods with this e-mail address.";
      case 'ERROR_WRONG_PASSWORD':
      case 'wrong-password':
        return "E-mail address or password is incorrect.";
      default:
        return "An error has occurred";
    }
  }
}
