const baseUrl = "https://twitter-clone.onthewifi.com:2023/api/v1/";
const base = "https://twitter-clone.onthewifi.com:2023";

/// This class contains the endpoints for various API requests.
class EndPoints {
  static const socketUrl = base;

  /// Endpoint for getting user information.
  static const getMe = "/auth/me";

  /// Endpoint for user login.
  static const login = "/auth/signin";

  /// Endpoint for user registration.
  static const register = "/auth/signup";

  /// Endpoint for confirming user email.
  static const confirmEmail = "/auth/verifyEmail";

  /// Endpoint for confirming profile email.
  static const confirmProfileEmail = "/profile/verifyEmail";

  /// Endpoint for forgetting password.
  static const forgetPassword = "/auth/forgetPassword";

  /// Endpoint for resetting password.
  static const resetPassword = "/auth/resetPassword";

  /// Endpoint for adding a tweet.
  static const addTweet = "/tweets/add";

  /// Endpoint for updating username.
  static const updateUsername = "/profile/updateUsername";

  /// Endpoint for updating email.
  static const updateEmail = "/profile/updateEmail";

  /// Endpoint for updating password.
  static const updatePassword = "/auth/updatePassword";

  /// Endpoint for updating banner image.
  static const updateBanner = "/profile/updateBanner";

  /// Endpoint for deleting banner image.
  static const deleteBanner = "/profile/deleteBanner";

  /// Endpoint for updating profile picture.
  static const updatePicture = "/profile/updatePicture";

  /// Endpoint for deleting profile picture.
  static const deletePicture = "/profile/deletePicture";

  /// Endpoint for updating user profile.
  static const updateProfile = "/profile/updateProfile";

  /// Endpoint for getting notifications.
  static const getNotifications = "/notifications";

  /// Endpoint for getting conversations.
  static const getConversations = "/conversations";

  /// Endpoint for starting a conversation.
  static const startConversation = "/conversations/startConversation";

  /// Endpoint for getting the count of unseen conversations.
  static const unseenConversationsCnt = "/conversations/unseenConversationsCnt";

  /// Endpoint for getting messages history of a conversation.
  static getMessagesHistory(String conversationId) =>
      "/conversations/$conversationId/history";

  /// Endpoint for checking if an email is found.
  static isEmailFound(String email) => "/users/$email/isEmailFound";

  /// Endpoint for getting user profile.
  static getUserProfile(String username) => "/profile/$username";

  /// Endpoint for resending confirmation email.
  static const resendConfirmEmail = "/auth/resendConfirmEmail";

  /// Endpoint for getting timeline data.
  static getTimelineData(int page) => "/users/$page/timeline";
  static getUserTweets(String username, int page) =>
      "/users/$username/tweets/$page";
  static getUserLikedTweets(String username, int page) =>
      "/users/$username/likedTweets/$page";
  static followUser(String username) => "/users/$username/follow";

  /// Endpoint for unfollowing a user.
  static unfollowUser(String username) => "/users/$username/unfollow";

  /// Endpoint for muting a user.
  static muteUser(String username) => "/users/$username/mute";

  /// Endpoint for unmuting a user.
  static unmuteUser(String username) => "/users/$username/unmute";

  /// Endpoint for blocking a user.
  static blockUser(String username) => "/users/$username/block";

  /// Endpoint for unblocking a user.
  static unblockUser(String username) => "/users/$username/unblock";

  /// Endpoint for getting muted users.
  static mutedUsers(String username) => "/users/mutedUsers";

  /// Endpoint for getting likers data of a tweet.
  static getLikersData(String tweetId) => "/tweets/$tweetId/likers";

  /// Endpoint for getting retweeters data of a tweet.
  static getRetweetersData(String tweetId) => "/tweets/$tweetId/retweeters";

  /// Endpoint for getting repliers data of a tweet.
  static getRepliersData(String tweetId) => "/tweets/$tweetId/replies";

  /// Endpoint for adding a like to a tweet.
  static addLike(String tweetId) => "/tweets/$tweetId/addLike";

  /// Endpoint for deleting a like from a tweet.
  static deleteLike(String tweetId) => "/tweets/$tweetId/deleteLike";

  /// Endpoint for adding a retweet to a tweet.
  static addRetweet(String tweetId) => "/tweets/$tweetId/retweet";

  /// Endpoint for deleting a retweet from a tweet.
  static deleteRetweet(String tweetId) => "/tweets/$tweetId/deleteRetweet";

  /// Endpoint for adding a reply to a tweet.
  static addReply(String tweetId) => "/tweets/$tweetId/addReply";

  /// Endpoint for getting trending data.
  static getTrendingData() => "/trends";

  /// Endpoint for getting followers data of a user.
  static getFollowersData(String username) => "/users/$username/followers";

  /// Endpoint for getting following data of a user.
  static getFollowingData(String username) => "/users/$username/followings";

  /// Endpoint for deleting a tweet.
  static deleteTweet(String tweetId) => "/tweets/$tweetId/deleteTweet";
  
  /// Represents the endpoint for deleting a reply to a tweet.
  static deleteReply(String tweetId, String replyId) =>
    "/tweets/$tweetId/deleteReplies/$replyId";

  /// Endpoint for getting muted users data.
  static getMutersData() => "/users/mutedUsers";

  /// Endpoint for getting blocked users.
  static getBlockersData() => "/users/blockedUsers";

  /// Endpoint for searching users.
  static searchUsers(int page, String query) =>
      "/users/search/$page?query=$query";

  /// Endpoint for searching tweets.
  static searchTweets(int page, String query) =>
      "/tweets/search/$page?query=$query";

  /// Endpoint for getting mentions of a user.
  static getMentions(int page, String username) =>
      "/users/$username/mentions/$page";
}
