import 'package:flangapp_app/enum/action_type.dart';
import 'package:flangapp_app/models/navigation_item.dart';

import '../enum/background_mode.dart';
import '../enum/load_indicator.dart';
import '../enum/template.dart';

class Config {

  /// *** App config *** ///
  // App name
  static String appName = "Codecanyon";
  // App link
  static String appLink = "https://codecanyon.net/";
  // Display page name without app name (after 1 page)
  static bool displayTitle = true;
  // Main color (any HEX color)
  static String color = "#262626";
  // Active color (any HEX color)
  static String activeColor = "#6ca12b";
  // Icon color color (any HEX color)
  static String iconColor = "#6ca12b";
  // Title color (true - white, false - black)
  static bool isDark = true;
  // Pull to refresh enabled
  static bool pullToRefresh = true;
  // User agent
  static String userAgent = "";
  // Admin email
  static String appEmail = "sitenative@yandex.ru";
  // Template
  static Template appTemplate = Template.tabs;
  // Loading indicator style
  static LoadIndicator indicator = LoadIndicator.line;
  // Loading indicator color
  static String indicatorColor = "#6ca12b";

  /// *** Access ** ///
  // Access to camera
  static bool accessCamera = true;
  // Access to microphone
  static bool accessMicrophone = true;
  // Access to geolocation
  static bool accessLocation = true;

  /// *** Drawer settings *** ///
  // Title
  static String drawerTitle = "Flangapp";
  // Subtitle
  static String drawerSubtitle = "Convert site to app";
  // Background mode
  static BackgroundMode drawerBackgroundMode = BackgroundMode.image;
  // Background color (any HEX color)
  static String drawerBackgroundColor = "#0e74e9";
  // Title color (true - white, false - black)
  static bool drawerIsDark = true;
  // Background image name
  static String drawerBackgroundImage = "drawer_background.png";
  // Logo image name
  static String drawerLogoImage = "logo.png";
  // Display logo
  static bool drawerIsDisplayLogo = false;

  /// *** Splashscreen settings *** ///
  // Background color (any HEX color)
  static String splashBackgroundColor = "#0e74e9";
  // Text color (any HEX color)
  static String splashTextColor = "#ffffff";
  // Is image background
  static bool splashIsBackgroundImage = true;
  // Background image name
  static String splashBackgroundImage = "splash_screen.png";
  // Tagline
  static String splashTagline = "Top digital assets and services";
  // Delay display (seconds)
  static int splashDelay = 4;
  // Logo image name
  static String splashLogoImage = "splash_logo.png";
  // Display logo
  static bool splashIsDisplayLogo = true;

  /// *** PUSH OneSignal settings *** ///
  // App ID
  static String osAppID = "79224610-f8e6-4659-a6e2-d3bb9175cb19";
  // Signing
  static String osSigning = "bb08a651499a8d8b9e499c1da2f7935ed432717f0d98993dd0300cd5461c5b20";
  // Enabled android?
  static bool osAndroidEnabled = true;

  /// *** Website styles *** ///
  // List div for hide in app
  static List<String> cssHideBlock = [".shared-global_header-mobile_menu_component__headerMobile", ".shared-global_header-global_header_component__desktopHeader", ".canvas__header", ".shared-global_header-global_header_component__headerWrapper"];

  /// *** Localization *** ///
  // Name offline image
  static String offlineImage = "wifi.png";
  // Error internet connection (offline)
  static String messageErrorOffline = "No internet connection";
  // Error open web page
  static String messageErrorBrowser = "Failed to load the page. Please try again later!";
  // Name error page image
  static String errorBrowserImage = "error.png";
  // Title about exit from app (Android)
  static String titleExit = "Confirmation";
  // Message about exit from app (Android)
  static String messageExit = "Are you sure you want to exit the app?";
  // Confirm button about
  static String actionYesDownload = "Yes";
  // Cancel button
  static String actionNoDownload = "No";
  // Contact us email (About screen)
  static String contactBtn = "Contact us with email";
  // Back
  static String backBtn = "Return back";

  /// *** Navigation *** ///
  // Main app navigation
  static List<NavigationItem> mainNavigation = [
    NavigationItem(
      name: "Home",
      icon: "home-outline.svg",
      type: ActionType.internal,
      value: "https://codecanyon.net/"
    ),
    NavigationItem(
      name: "Market",
      icon: "albums-outline.svg",
      type: ActionType.internal,
      value: "https://codecanyon.net/category/mobile"
    ),
    NavigationItem(
      name: "Cart",
      icon: "cart-outline.svg",
      type: ActionType.internal,
      value: "https://codecanyon.net/cart"
    ),
    NavigationItem(
      name: "Most popular",
      icon: "flame-outline.svg",
      type: ActionType.internal,
      value: "https://codecanyon.net/top-sellers"
    ),
    NavigationItem(
      name: "Forum",
      icon: "chatbubbles-outline.svg",
      type: ActionType.internal,
      value: "https://forums.envato.com/"
    )
  ];
  // Bar app navigation
  static List<NavigationItem> barNavigation = [
    NavigationItem(
      name: "Share",
      icon: "share-social-outline.svg",
      type: ActionType.share,
      value: ""
    ),
    NavigationItem(
      name: "Help center",
      icon: "ellipsis-horizontal-outline.svg",
      type: ActionType.openModal,
      value: ""
    )
  ];
  // Modal app navigation
  static List<NavigationItem> modalNavigation = [
    NavigationItem(
      name: "Buying and Item Support",
      icon: "help-buoy-outline.svg",
      type: ActionType.internal,
      value: "https://help.market.envato.com/hc/en-us/categories/200216004"
    ),
    NavigationItem(
      name: "Licenses",
      icon: "cube-outline.svg",
      type: ActionType.internal,
      value: "https://help.market.envato.com/hc/en-us/sections/200616950"
    ),
    NavigationItem(
      name: "Your Account",
      icon: "person-circle-outline.svg",
      type: ActionType.internal,
      value: "https://help.market.envato.com/hc/en-us/categories/200211970"
    ),
    NavigationItem(
      name: "Copyright and Trademarks",
      icon: "ribbon-outline.svg",
      type: ActionType.internal,
      value: "https://help.market.envato.com/hc/en-us/categories/200211980"
    ),
    NavigationItem(
      name: "Tax & Compliance",
      icon: "card-outline.svg",
      type: ActionType.internal,
      value: "https://help.market.envato.com/hc/en-us/categories/200211990"
    ),
  ];
}