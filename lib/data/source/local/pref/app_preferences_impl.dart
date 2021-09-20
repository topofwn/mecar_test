import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;
  final Box box;

  AppPreferencesImpl({
    @required this.sharedPreferences,
    @required this.box,
  });

  @override
  String getAppConfig() {
    return box.get(AppPreferences.CACHED_APP_CONFIG, defaultValue: null);
  }

  @override
  void saveAppConfig(String data) {
    box.put(AppPreferences.CACHED_APP_CONFIG, data);
  }

  @override
  String getDashboard() {
    return box.get(AppPreferences.CACHED_DASHBOARD, defaultValue: null);
  }

  @override
  void saveDashboard(String data) {
    box.put(AppPreferences.CACHED_DASHBOARD, data);
  }

  @override
  String getNotificationSetting() {
    return box.get(AppPreferences.CACHED_NOTIFICATION_ITEMS,
        defaultValue: null);
  }

  @override
  void saveNotificationSetting(String data) {
    box.put(AppPreferences.CACHED_NOTIFICATION_ITEMS, data);
  }

  @override
  String getNotificationHistory() {
    return box.get(AppPreferences.CACHED_NOTIFICATION_HISTORY_ITEMS,
        defaultValue: null);
  }

  @override
  void saveNotificationHistory(String data) {
    box.put(AppPreferences.CACHED_NOTIFICATION_HISTORY_ITEMS, data);
  }

  @override
  String getStaticContent() {
    return box.get(AppPreferences.CACHED_STATIC_CONTENTS, defaultValue: null);
  }

  @override
  void saveStaticContent(String data) {
    box.put(AppPreferences.CACHED_STATIC_CONTENTS, data);
  }

  @override
  String getAccessToken() {
    return box.get(AppPreferences.CACHED_ACCESS_TOKEN, defaultValue: null);
  }

  @override
  String getUserInfo() {
    return box.get(AppPreferences.CACHED_CURRENT_USER, defaultValue: null);
  }

  @override
  void saveAccessToken(String data) {
    box.put(AppPreferences.CACHED_ACCESS_TOKEN, data);
  }

  @override
  void saveUserInfo(String data) {
    box.put(AppPreferences.CACHED_CURRENT_USER, data);
  }

  @override
  Future<void> clearUserData() async {
    if (box.containsKey(AppPreferences.CACHED_CURRENT_USER)) {
      await box.delete(AppPreferences.CACHED_CURRENT_USER);
    }
    if (box.containsKey(AppPreferences.CACHED_ACCESS_TOKEN)) {
      await box.delete(AppPreferences.CACHED_ACCESS_TOKEN);
    }
  }

  @override
  String getHelpItems() {
    return box.get(AppPreferences.CACHED_APP_HELP_ITEMS, defaultValue: null);
  }

  @override
  String getReportItems() {
    return box.get(AppPreferences.CACHED_APP_REPORT_ITEMS, defaultValue: null);
  }

  @override
  void saveHelpItems(String data) {
    box.put(AppPreferences.CACHED_APP_HELP_ITEMS, data);
  }

  @override
  void saveReportItems(String data) {
    box.put(AppPreferences.CACHED_APP_REPORT_ITEMS, data);
  }

  @override
  String getTips() {
    return box.get(AppPreferences.CACHED_TIPS, defaultValue: null);
  }

  @override
  void saveTips(String data) {
    box.put(AppPreferences.CACHED_TIPS, data);
  }

  @override
  String getServiceDetail(String id) {
    return box.get(AppPreferences.CACHED_SERVICE_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void saveServiceDetail(String id, String data) {
    box.put(AppPreferences.CACHED_SERVICE_DETAIL + '_' + id, data);
  }

  @override
  String getPeriodList(String serviceId) {
    return box.get(AppPreferences.CACHED_PERIOD_LIST + '_' + serviceId,
        defaultValue: null);
  }

  @override
  void savePeriodList(String serviceId, String data) {
    box.put(AppPreferences.CACHED_PERIOD_LIST + '_' + serviceId, data);
  }

  @override
  String getAvailablePeriodList(String serviceId) {
    return box.get(
        AppPreferences.CACHED_AVAILABLE_PERIOD_LIST + '_' + serviceId,
        defaultValue: null);
  }

  @override
  void saveAvailablePeriodList(String serviceId, String data) {
    box.put(
        AppPreferences.CACHED_AVAILABLE_PERIOD_LIST + '_' + serviceId, data);
  }

  @override
  String getListStores() {
    return box.get(AppPreferences.CACHED_STORE_LIST, defaultValue: null);
  }

  @override
  void saveListStores(String data) {
    box.put(AppPreferences.CACHED_STORE_LIST, data);
  }

  @override
  String getMyVouchers(String index) {
    return box.get(AppPreferences.CACHED_MY_VOUCHERS + '_' + index,
        defaultValue: null);
  }

  @override
  void saveMyVouchers(String index, String data) {
    box.put(AppPreferences.CACHED_MY_VOUCHERS + '_' + index, data);
  }

  @override
  String getMyBooking() {
    return box.get(AppPreferences.CACHED_APP_MY_BOOKING, defaultValue: null);
  }

  @override
  void saveMyBooking(String data) {
    box.put(AppPreferences.CACHED_APP_MY_BOOKING, data);
  }

  @override
  String getVouchers() {
    return box.get(AppPreferences.CACHED_VOUCHERS, defaultValue: null);
  }

  @override
  void saveVouchers(String data) {
    box.put(AppPreferences.CACHED_VOUCHERS, data);
  }

  @override
  String getVoucherDetail(String id) {
    return box.get(AppPreferences.CACHED_APP_VOUCHER_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void saveVoucherDetail(String id, String data) {
    box.put(AppPreferences.CACHED_APP_VOUCHER_DETAIL + '_' + id, data);
  }

  @override
  String getTipPromotionList(String id) {
    return box.get(AppPreferences.CACHED_TIP_PROMOTION_LIST + '_' + id,
        defaultValue: null);
  }

  @override
  void saveTipPromotionList(String id, String data) {
    box.put(AppPreferences.CACHED_TIP_PROMOTION_LIST + '_' + id, data);
  }

  @override
  String getTipPromotionDetail(String id) {
    return box.get(AppPreferences.CACHED_TIP_PROMOTION_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void saveTipPromotionDetail(String id, String data) {
    box.put(AppPreferences.CACHED_TIP_PROMOTION_DETAIL + '_' + id, data);
  }

  @override
  String getBookingDetail(String id) {
    return box.get(AppPreferences.CACHED_APP_BOOKING_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void saveBookingDetail(String id, String data) {
    box.put(AppPreferences.CACHED_APP_BOOKING_DETAIL + '_' + id, data);
  }

  @override
  String getServices(String id) {
    return box.get(AppPreferences.CACHED_APP_LIST_SERVICES + '_' + id,
        defaultValue: null);
  }

  @override
  void saveServices(String id, String data) {
    box.put(AppPreferences.CACHED_APP_LIST_SERVICES + '_' + id, data);
  }

  @override
  String getPromotions() {
    return box.get(AppPreferences.CACHED_LIST_PROMOTIONS, defaultValue: null);
  }

  @override
  void savePromotions(String data) {
    box.put(AppPreferences.CACHED_LIST_PROMOTIONS, data);
  }

  @override
  String getPromotionDetail(String id) {
    return box.get(AppPreferences.CACHED_TIP_PROMOTION_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void savePromotionDetail(String id, String data) {
    box.put(AppPreferences.CACHED_TIP_PROMOTION_DETAIL + '_' + id, data);
  }

  @override
  String getCategories() {
    return box.get(AppPreferences.CACHED_APP_CATEGORIES, defaultValue: null);
  }

  @override
  void saveCategories(String data) {
    box.put(AppPreferences.CACHED_APP_CATEGORIES, data);
  }

  @override
  String getMyVoucherDetail(String id) {
    return box.get(AppPreferences.CACHED_MY_VOUCHER_DETAIL + '_' + id,
        defaultValue: null);
  }

  @override
  void saveMyVoucherDetail(String id, String data) {
    box.put(AppPreferences.CACHED_MY_VOUCHER_DETAIL + '_' + id, data);
  }

  @override
  bool canShowStartScreen() {
    return box.get(AppPreferences.CACHED_SHOW_START_SCREEN,
        defaultValue: true);
  }

  @override
  void saveStartScreen() {
    box.put(AppPreferences.CACHED_SHOW_START_SCREEN, false);
  }
}
