import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/models/page_view_item_model.dart';
import 'package:easy_localization/easy_localization.dart';

/// Application Constants
/// Centralized constant definitions
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  //-----OnBoarding-----//
  static List<PageViewItemModel> onBoardingPages(BuildContext context) {
    return [
      PageViewItemModel(
        backgroundImage: AppImages.onBoardingBg1,
        iconImage: AppImages.onBoardingIcon1,
        title:
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'onboarding_title1'.tr(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(width: 5.w),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fruit',
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(color: AppColors.primary),
                          ),
                          TextSpan(
                            text: 'Hub',
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(color: AppColors.secondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                .animate()
                .fade(delay: 100.ms, duration: 400.ms)
                .slideY(
                  begin: .5,
                  delay: 100.ms,
                  duration: 400.ms,
                  curve: Curves.easeOutQuart,
                )
                .scale(
                  begin: const Offset(.7, .7),
                  end: const Offset(1, 1),
                  delay: 100.ms,
                  duration: 400.ms,
                  curve: Curves.easeOutBack,
                ),
        subtitle: 'onboarding_desc1'.tr(),
      ),

      PageViewItemModel(
        backgroundImage: AppImages.onBoardingBg2,
        iconImage: AppImages.onBoardingIcon2,
        title:
            Text(
                  'onboarding_title2'.tr(),
                  style: Theme.of(context).textTheme.displayMedium,
                )
                .animate()
                .fade(delay: 100.ms, duration: 400.ms)
                .slideY(
                  begin: .5,
                  delay: 100.ms,
                  duration: 400.ms,
                  curve: Curves.easeOutQuart,
                )
                .scale(
                  begin: const Offset(.7, .7),
                  end: const Offset(1, 1),
                  delay: 100.ms,
                  duration: 400.ms,
                  curve: Curves.easeOutBack,
                ),
        subtitle: 'onboarding_desc2'.tr(),
      ),
    ];
  }
  ////-----End OnBoarding-----////

  //-----API Configuration-----//
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = 'v1';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  ////-----End API Configuration-----////

  //-----Storage Keys-----//
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
  static const String onboardingKey = 'onboarding_completed';
  ////-----End Storage Keys-----////

  //-----Pagination-----//
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  ////-----End Pagination-----////

  //-----Animation Durations-----//
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  ////-----End Animation Durations-----////

  //-----Spacing-----//
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double padding = 16.0;
  ////-----End Spacing-----////

  //-----Border Radius-----//
  static const double radiusSM = 4.0;
  static const double radiusMD = 8.0;
  static const double radiusLG = 12.0;
  static const double radiusXL = 16.0;
  static const double radiusRound = 999.0;
  ////-----End Border Radius-----////

  //-----Icon Sizes-----//
  static const double iconSizeSM = 16.0;
  static const double iconSizeMD = 24.0;
  static const double iconSizeLG = 32.0;
  static const double iconSizeXL = 48.0;
  ////-----End Icon Sizes-----////

  //-----Image Sizes-----//
  static const double avatarSizeSM = 32.0;
  static const double avatarSizeMD = 48.0;
  static const double avatarSizeLG = 64.0;
  static const double avatarSizeXL = 96.0;
  ////-----End Image Sizes-----////

  //-----Validation-----//
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  ////-----End Validation-----////

  //-----File Upload-----//
  static const int maxFileSize = 10 * 1024 * 1024; // 10 MB
  static const List<String> allowedImageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
  ];
  static const List<String> allowedDocumentExtensions = ['pdf', 'doc', 'docx'];
  ////-----End File Upload-----////

  //-----Date Formats-----//
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  ////-----End Date Formats-----////

  //-----Regular Expressions-----//
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
  static final RegExp urlRegex = RegExp(
    r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
  );
  ////-----End Regular Expressions-----////

  //-----Error Messages-----//
  static const String genericErrorMessage =
      'Something went wrong. Please try again.';
  static const String networkErrorMessage =
      'No internet connection. Please check your network.';
  static const String timeoutErrorMessage =
      'Request timeout. Please try again.';
  static const String unauthorizedErrorMessage =
      'Unauthorized. Please login again.';
  ////-----End Error Messages-----////
}
