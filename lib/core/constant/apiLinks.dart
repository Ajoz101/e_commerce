class AppLinks {
  static const String server = "https://ahmed101.000webhostapp.com";
  static const String test = "$server/test.php";
  // static const String root = "https://ahmed101.000webhostapp.com";
  static const String root = "http://10.0.2.2/ecommerce_backend";
  /*
   * Auth
   */
  static const String signup = "$server/auth/signup.php";
  static const String verify = "$server/auth/verify.php";
  static const String login = "$server/auth/login.php";

  /*
   * FORGOT PASS 
   */

  static const String checkemail = "$server/forgotpass/checkemail.php";
  static const String resetpass = "$server/forgotpass/resetpassword.php";
  static const String verifyForgotPass =
      "$server/forgotpass/verifyforgotpass.php";

  /*
       * Home
       */
  static const String homePage = "$root/home.php";
}
