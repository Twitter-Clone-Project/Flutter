const baseUrl = "http://10.0.2.2:2023/api/v1";

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
  static getUserProfile(String username) => "/profile/$username";
  static const resendConfirmEmail = "/auth/resendConfirmEmail";
  static getTimelineData(int page) => "/users/$page/timeline";
  static getUserTweets(String userId, int page) => "users/$userId/tweets/$page";


  //GET Posts of a user
// /users/{userId}/tweets/{pageNum}

  //GET Likes (tweets) of a user
// /users/{userId}/likedTweets/{pageNum}

//TODO FOR BACKEND: Get Replies of a user to view it in the profile
//TODO FOR BACKEND: Get Posts that has Media
}
