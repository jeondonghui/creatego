import 'package:creatego/creatego_theme.dart';
import 'package:mix/mix.dart';

final _toastTitleVariant = Variant('toastTitleVariant');
final _toastMessageVariant = Variant('toastMessageVariant');
final _toastIconVariant = Variant('toastIconVariant');
final _toastCloseIconVariant = Variant('toastCloseIconVariant');

class FxToast extends StatelessWidget {
  final ToastType toastType;
  final String toastTitle;
  final String toastMessage;
  const FxToast({
    Key? key,
    this.toastType = ToastType.success,
    required this.toastMessage,
    required this.toastTitle,
  }) : super(key: key);

  Mix get toastMix => Mix(
        shadow(
          blurRadius: 26,
          offset: const Offset(0, 2),
          spreadRadius: 0,
          color: _getShadowColor(toastType),
        ),
        border(color: _getBgColor(toastType), width: 1),
        crossAxis(CrossAxisAlignment.start),
        paddingHorizontal(12),
        paddingVertical(12),
        rounded(6),
        bgColor(_getBgColor(toastType)),
        _toastTitleVariant(
            textStyle(const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "NotoSansMedium",
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
            )),
            marginBottom(2)),
        _toastMessageVariant(
          textStyle(ThemeTextRegular.sm),
        ),
        _toastIconVariant(height(32), width(32), marginLeft(12)),
        _toastCloseIconVariant(
          height(16),
          width(16),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Box(
      mix: toastMix,
      child: toastMix.row(children: [
        Box(
          variants: [_toastIconVariant],
          child: HeroIcon(_getIcons(toastType)),
        ),
        Box(
          child: toastMix.column(children: [
            Box(
              variants: [_toastTitleVariant],
              child: TextMix(toastTitle),
            ),
            Box(
              variants: [_toastMessageVariant],
              child: TextMix(toastMessage),
            ),
          ]),
        ),
        const Spacer(),
        Box(variants: [_toastCloseIconVariant], child: HeroIcon(HeroIcons.x)),
      ]),
    );
  }

  _getBgColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.error:
        return const Color(0xFFEB5757); //added by Galymzhan red color
      case ToastType.warning:
        return ThemeColors.finex500;
      default:
        return ThemeColors.finex600;
    }
  }

  _getShadowColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.error:
        return const Color(0xFFD70000)
            .withOpacity(10); //added by Galymzhan red color
      case ToastType.warning:
        return const Color(0xFFD70000).withOpacity(10);
      default:
        return const Color(0xFF52D700).withOpacity(10);
    }
  }

  _getIcons(ToastType toastType) {
    //need to add icons like success, error, warning
    switch (toastType) {
      case ToastType.error:
        return HeroIcons.checkCircle;
      case ToastType.warning:
        return HeroIcons.cake;

      default:
        return HeroIcons.wifi;
    }
  }
}

enum ToastType { success, error, warning }
