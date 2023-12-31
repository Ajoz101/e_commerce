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

  /*
   * Items
   */
  static const String items = "$root/items/items_view.php";
  static const String search = "$root/items/search.php";

/*
 *  FAVORITES  
 */

  static const String faveAdd = "$root/favorites/add.php";
  static const String faveRemove = "$root/favorites/delete.php";
  static const String faveDisplay = "$root/favorites/display_fave.php";

/*
 *  CART  
 */

  static const String cartAdd = "$root/cart/addToCart.php";
  static const String cartRemove = "$root/cart/removeFromCart.php";
  static const String cartDisplay = "$root/cart/view.php";
  static const String cartgetCount = "$root/cart/getItemsCount.php";
}
