// ignore
class BaseApi {
  // static String baseUrl = 'http://13.126.89.69/lingerlaravel/api/public/index.php/api/';
  static String baseUrl = 'https://honeyback.lingerislam.com/index.php/api/';
  static String baseUrl1 = 'https://api.aladhan.com/v1/';
  static String login = 'signin';

  static const SUNNAH_ID = "SUNNAH_ID";
  static const SUKOON_ID = "SUKOON_ID";
  static const AUDIO_ID = "AUDIO_ID";
  static const CHAPTER_ID = "CHAPTER_ID";
  static const USER_ID = "USER_ID";
  static const HEROIC_TYPE_ID = "HEROIC_TYPE_ID";
  static const HEROIC_TYPE_DETAILS_ID = "HEROIC_TYPE_DETAILS_ID";
  static const ISLAMIC_FESTIVALS_DETAILS_ID = "ISLAMIC_FESTIVALS_DETAILS_ID";
  static const DUA_WAZIFA_DETAILS_ID = "DUA_WAZIFA_DETAILS_ID";
  static const COURSE_DETAILS_ID = "COURSE_DETAILS_ID";

  static const getAllChaptersOfSurah =
      "https://api.quran.com/api/v4/chapters?language=en";
  static const getChaptersDetails = "https://api.quran.com/api/v4/chapters/";

  static const String timing = "timingsByAddress/";
  static const String SIGN_IN = "signin";
  static const String SIGN_UP = "user/signup";
  static const String HOME = "user/home";
  static const String OTP = "user/otp_verification";
  static const String QUESTION = "user/otp_verification";
  static const String NOTE = "user/note";
  static const String ANSWER = "user/answer";
  static const String RESULT = "user/result";
  static const String PROFILE_UPDATE = "user/profile-update";
  static const String PERSONSAL_PROFILE = "user/personal-profile";
  static const String OTHER_USER_PROFILE = "user/other-user-profile/$USER_ID";
  static const String PROFILE_IMAGE = "user/profile-image";
  static const String DELETE_PROFILE_IMAGE = "user/delete-profile-image";
  static const String LIKE = "user/like";
  static const String FOLLOW = "user/follow";
  static const String SUNNAH_DETAILS = "user/sunnah-details/$SUNNAH_ID";
  static const String SUNNAH = "user/sunnah";
  static const String SUKOON = "user/sukoon";
  static const String SUKOON_DETAILS = "user/sukoon-details/$SUKOON_ID";
  static const String SUKOON_LIKE = "user/sukoon-like";
  static const String REQUEST_BABY_NAME = "user/request-baby-name";
  static const String REPLY_BABY_NAME = "user/reply-baby-name";
  static const String SOCIAL_MEDIA_SIGNIN = "social-media-signin";
  static const String MOBILE_OTP_SIGNIN = "mobile-otp-signin";
  static const String OTP_VERIFICATION = "otp-verification";
  static const String UPDATE_PASSWORD = "update-password";
  static const String RESET_PASSWORD_EMAIL = "reset-password-email";
  static const String REST_PASSWORD_MOBILE = "reset-password-mobile";
  static const String NAMAZTIME = "user/namazTime";
  static const String QURAN_DETAILS = "user/quran-details";
  static const String QURAN = "user/quran";
  static const String DETAILS = "user/library/audio/details/$AUDIO_ID";
  static const String LIBRARY = "user/library";
  static const String QURAN_SEARCH = "user/quran-search";
  static const String CHAPTER = "user/library/book/chapter/$CHAPTER_ID";
  static const String CHAPTER_DETAILS = "user/library-book-chapter-details";
  static const String PAYMENT = "user/payment";
  static const String ISLAM = "user/islam";
  static const String ISLAM_HEROES = "user/islamic-heroes";
  static const String ISLAM_HEROES_TYPE =
      "user/islamic/heroes/type/$HEROIC_TYPE_ID";
  static const String ISLAM_HEROES_TYPE_DETAILS =
      "user/islamic/heroes/type/details/$HEROIC_TYPE_DETAILS_ID";
  static const String ISLAM_FESTIVALS = "user/islamic-festivals";
  static const String ISLAM_FESTIVALS_DETAILS =
      "user/islamic-festivals/details/$ISLAMIC_FESTIVALS_DETAILS_ID";
  static const String REQUEST_KHWAB = "user/request-khwab-ki-tabeer";
  static const String REPLY_KHWAB = "user/reply-khwab-ki-tabeer";
  static const String DUA_WAZIFA_DETAILS =
      "user/dua-wazifa/details/$DUA_WAZIFA_DETAILS_ID";
  static const String DUA_WAZIFA = "user/dua-wazifa";
  static const String COURSE_DETAILS = "user/course/details/$COURSE_DETAILS_ID";
  static const String COURSE = "user/course";
  static const String PROFIlE_COURSE = "user/profile-cover";
  static const String SLOT_INACTIVE = "user/slot-inactive";
  static const String SUBSCRIPTION = "user/subscription";
  static const String REFER = "user/refer";
  static const String WALLET = "user/wallet";
  static const String BANK_DETAILS = "user/bank-details";
  static const String STORE = "admin/other-user/store";
  static const String ALLBOOKS = "user/library/allbook";
  static const String SINGLEBOOK = "user/library/book/singleBook";
  static const String AUDIOLIKE = "user/library/audio-like";
  static const String CONTINUEREADING = "user/library/continue-reading";
  static const String LIKEPICOFTHEDAY = "user/like-pic-of-the-day-image";

  static const String shopDashboard = "user/v2/home";
  static const String products = "user/v2/product";
  static const String addToCart = "user/v2/cart/store";
  static const String getMyCart = "user/v2/cart";
  static const String getProductDetails = "user/v2/product/details";
  static const String likeProducts = "user/v2/product/like";
  static const String myFavoriteProducts = "user/v2/product/favorite";

  static const String addReview = "product/review/store";
  static const String getReviews = "user/v2/product/review";
  static const String orderSummary = "user/v2/order/summary";
  static const String orderMessage = "user/v2/order/message";
  static const String makeOrder = "user/v2/order";
  static const String getMyOrders = "user/v2/myorder";
  static const String cencelOrderById = "user/v2/order/cancel";
  static const String getOrderById = "user/v2/order/show";
  static const String getArticleById = "user/v2/article/details";
  static const String addPaymentMethod = "user/v2/order/payment/method/store";
  static const String updatePaymentMethod =
      "user/v2/order/payment/method/update";

  /// get request
  static const String getOrderAddresses = "user/v2/order/address";
  static const String addOrderAddress = "user/v2/order/address/store";
  static const String editOrderAddress = "user/v2/order/address/update";
  static const String deleteOrderAddress = "user/v2/order/address/delete";
  static const String seeAll = "user/v2/product/see/all";
  static const String getPaymentMethods = "user/v2/order/payment/method";
}
