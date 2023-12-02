const baseUrl = "http://10.0.2.2:2023/api/v1";

class EndPoints {
  static const login = "/auth/signin";
  static const register = "/auth/signup";
  static const confirmEmail = "/auth/verifyEmail";
  static const forgetPassword = "/auth/forgetPassword";
  static const resetPassword = "/auth/resetPassword";
  static const resendConfirmEmail = "/auth/resendConfirmEmail";
  static getTimelineData(int page) => "/users/$page/timeline";
  static getLikersData(String tweetId) => "/tweets/$tweetId/likers";
  static getRetweetersData(String tweetId) => "/tweets/$tweetId/retweeters";
  static getRepliersData(String tweetId) => "/tweets/$tweetId/replies";
  static addLike(String tweetId) => "/tweets/$tweetId/addLike";
  static deleteLike(String tweetId) => "/tweets/$tweetId/deleteLike";
  static addRetweet(String tweetId) => "/tweets/$tweetId/retweet";
  static deleteRetweet(String tweetId) => "/tweets/$tweetId/deleteRetweet";
}
