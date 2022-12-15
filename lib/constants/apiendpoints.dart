class APIEndPoints {
  static const String BASE_URL =
      "https://honeyback.lingerislam.com/index.php/api/";
  static const String BASE_URL1 = "https://linger.scsy.in/api/api/";
  static const String BASE_URL2 =
      "http://13.232.41.89/lingerlaravel/api/public/index.php/api/";

  // https://api.aladhan.com/v1/timingsByAddress/12-04-2022?address=Lucknow
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

  static const String timing = "https://aladhan.com/prayer-times-api";
  static const String SIGN_IN = "signin";
  static const String SIGN_UP = "user/signup";
  static const String HOME = "user/home";
  static const String OTP = "user/otp_verification";
  static const String QUESTION = "user/question";
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
}
