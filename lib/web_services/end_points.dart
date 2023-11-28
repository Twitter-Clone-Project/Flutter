const baseUrl = "http://18.212.103.71:2023/api/v1";

class EndPoints {
  static const login = "/auth/signin";
  static const register = "/auth/signup";
  static const confirmEmail = "/auth/verifyEmail";
  static const forgetPassword = "/auth/forgetPassword";
  static const resetPassword = "/auth/resetPassword";

  static const updateUsername = "/profile/updateUsername";
  static const updateEmail = "/profile/updateEmail";
  static const updateBanner = "/profile/updateBanner";
  static const deleteBanner = "/profile/deleteBanner";
  static const updatePicture = "/profile/updatePicture";
  static const deletePicture = "/profile/deletePicture";
  static const updateProfile = "/profile/update";
  static const getUserProfile = "/profile/";

  static String getUserProfileUrl(String userId) {
    return '$getUserProfile$userId';
  }
  //Usage Example:
  // String userProfileUrl = EndPoints.getUserProfileUrl(userId);

}
