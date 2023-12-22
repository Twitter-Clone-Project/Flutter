const baseUrl = "https://10.0.2.2:2023/api/v1/";
const base = "https://10.0.2.2:2023";

class EndPoints {
  static const socketUrl = base;
  static const getMe = "/auth/me";
  static const login = "/auth/signin";
  static const register = "/auth/signup";
  static const confirmEmail = "/auth/verifyEmail";
  static const forgetPassword = "/auth/forgetPassword";
  static const resetPassword = "/auth/resetPassword";
  static const addTweet = "/tweets/add";
  static const updateUsername = "/profile/updateUsername";
  static const updateEmail = "/profile/updateEmail";
  static const updateBanner = "/profile/updateBanner";
  static const deleteBanner = "/profile/deleteBanner";
  static const updatePicture = "/profile/updatePicture";
  static const deletePicture = "/profile/deletePicture";
  static const updateProfile = "/profile/updateProfile";
  static const getNotifications = "/notifications";
  static const getConversations = "/conversations";
  static getUserProfile(String username) => "/profile/$username";
  static const resendConfirmEmail = "/auth/resendConfirmEmail";
  static getTimelineData(int page) => "/users/$page/timeline";
  static getUserTweets(String username, int page) =>
      "/users/$username/tweets/$page";
  static getUserLikedTweets(String username, int page) =>
      "/users/$username/likedTweets/$page";
  static followUser(String username) => "/users/$username/follow";
  static unfollowUser(String username) => "/users/$username/unfollow";
  static muteUser(String username) => "/users/$username/mute";
  static unmuteUser(String username) => "/users/$username/unmute";
  static blockUser(String username) => "/users/$username/block";
  static unblockUser(String username) => "/users/$username/unblock";
  static mutedUsers(String username) => "/users/mutedUsers";
  static getLikersData(String tweetId) => "/tweets/$tweetId/likers";
  static getRetweetersData(String tweetId) => "/tweets/$tweetId/retweeters";
  static getRepliersData(String tweetId) => "/tweets/$tweetId/replies";
  static addLike(String tweetId) => "/tweets/$tweetId/addLike";
  static deleteLike(String tweetId) => "/tweets/$tweetId/deleteLike";
  static addRetweet(String tweetId) => "/tweets/$tweetId/retweet";
  static deleteRetweet(String tweetId) => "/tweets/$tweetId/deleteRetweet";
  static addReply(String tweetId) => "/tweets/$tweetId/addReply";
  static getTrendingData() => "/trends";
  static getFollowersData(String username) => "/users/$username/followers";
  static getFollowingData(String username) => "/users/$username/followings";
  static deleteTweet(String tweetId) => "/tweets/$tweetId/deleteTweet";
  static deleteReply(String tweetId, String replyId) =>
      "/tweets/$tweetId/deleteReplies/$replyId";

  static searchUsers(String query) => "/users/search?query=$query";
  static searchTweets(String query) => "/tweets/search?query=$query";

}
