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
  static getUserTweets(String userId, int page) => "/users/$userId/tweets/$page";
  static getUserLikedTweets(String userId, int page) => "/users/$userId/likedTweets/$page";
  static followUser(String username) => "/users/$username/follow";
  static unfollowUser(String username) => "/users/$username/unfollow";
  static muteUser(String username) => "/users/$username/mute";
  static unmuteUser(String username) => "/users/$username/unmute";
  static blockUser(String username) => "/users/$username/block";
  static unblockUser(String username) => "/users/$username/unblock";
  static mutedUsers(String username) => "/users/mutedUsers"; //TODO in settings
}
