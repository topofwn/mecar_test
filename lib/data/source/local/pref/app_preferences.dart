abstract class AppPreferences {
  void saveAppConfig(String data);

  String getAppConfig();

  void saveDashboard(String data);

  String getDashboard();

  void saveMyBooking(String data);

  String getMyBooking();

  void saveBookingDetail(String id, String data);

  String getBookingDetail(String id);

  void saveTips(String data);

  String getTips();

  void savePeriodList(String serviceId, String data);

  String getPeriodList(String serviceId);

  void saveAvailablePeriodList(String serviceId, String data);

  String getAvailablePeriodList(String serviceId);

  void saveServiceDetail(String id, String data);

  String getServiceDetail(String id);

  void saveServices(String id, String data);

  String getMyVoucherDetail(String id);

  void saveMyVoucherDetail(String id, String data);

  String getServices(String id);

  void saveCategories(String data);

  String getCategories();

  void saveMyVouchers(String index, String data);

  String getMyVouchers(String index);

  void saveNotificationSetting(String data);

  String getNotificationSetting();

  void saveNotificationHistory(String data);

  String getNotificationHistory();

  void saveStaticContent(String data);

  String getStaticContent();

  void saveUserInfo(String data);

  String getUserInfo();

  void saveAccessToken(String data);

  String getAccessToken();

  Future<void> clearUserData();

  void saveHelpItems(String data);

  String getHelpItems();

  void saveReportItems(String data);

  String getReportItems();

  void saveListStores(String data);

  String getListStores();

  void saveVouchers(String data);

  String getVouchers();

  void savePromotions(String data);

  String getPromotions();

  void saveVoucherDetail(String id, String data);

  String getVoucherDetail(String id);

  void savePromotionDetail(String id, String data);

  String getPromotionDetail(String id);

  void saveTipPromotionList(String id, String data);

  String getTipPromotionList(String id);

  void saveTipPromotionDetail(String id, String data);

  String getTipPromotionDetail(String id);

  void saveStartScreen();

  bool canShowStartScreen();

  static const CACHED_APP_HELP_ITEMS = 'CACHED_APP_HELP_ITEMS';
  static const CACHED_APP_CATEGORIES= 'CACHED_APP_CATEGORIES';
  static const CACHED_PROMOTION_DETAIL = 'CACHED_PROMOTION_DETAIL';
  static const CACHED_APP_LIST_SERVICES = 'CACHED_APP_LIST_SERVICES';
  static const CACHED_APP_BOOKING_DETAIL = 'CACHED_APP_BOOKING_DETAIL';
  static const CACHED_TIP_PROMOTION_LIST = 'CACHED_TIP_PROMOTION_LIST';
  static const CACHED_TIP_PROMOTION_DETAIL = 'CACHED_TIP_PROMOTION_DETAIL';
  static const CACHED_APP_VOUCHER_DETAIL = 'CACHED_APP_VOUCHER_DETAIL';
  static const CACHED_MY_VOUCHER_DETAIL = 'CACHED_MY_VOUCHER_DETAIL';
  static const CACHED_VOUCHERS = 'CACHED_VOUCHERS';
  static const CACHED_APP_MY_BOOKING = 'CACHED_APP_MY_BOOKING';
  static const CACHED_APP_REPORT_ITEMS = 'CACHED_APP_REPORT_ITEMS';
  static const CACHED_APP_CONFIG = 'CACHED_CONFIG';
  static const CACHED_SHOW_START_SCREEN = 'CACHED_SHOW_START_SCREEN';
  static const CACHED_MY_VOUCHERS = 'CACHED_MY_VOUCHERS';
  static const CACHED_DASHBOARD = 'CACHED_DASHBOARD';
  static const CACHED_SERVICE_DETAIL = 'CACHED_SERVICE_DETAIL';
  static const CACHED_TIPS = 'CACHED_TIPS';
  static const CACHED_PERIOD_LIST = 'CACHED_PERIOD_LIST';
  static const CACHED_STORE_LIST = 'CACHED_STORE_LIST';
  static const CACHED_AVAILABLE_PERIOD_LIST = 'CACHED_AVAILABLE_PERIOD_LIST';
  static const CACHED_LIST_PROMOTIONS = 'CACHED_LIST_PROMOTIONS';

  static const CACHED_NOTIFICATION_ITEMS = 'CACHED_NOTIFICATION_ITEMS';
  static const CACHED_NOTIFICATION_HISTORY_ITEMS =
      'CACHED_NOTIFICATION_HISTORY_ITEMS';
  static const CACHED_STATIC_CONTENTS = 'CACHED_STATIC_CONTENTS';
  static const CACHED_CURRENT_USER = 'CACHED_CURRENT_USER';
  static const CACHED_ACCESS_TOKEN = 'CACHED_ACCESS_TOKEN';
}
