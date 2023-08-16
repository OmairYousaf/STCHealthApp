import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stc_health_test/constants/styles.dart';

class STCHealthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? btnLabel;
  final double? width;
  final double? height;

  const STCHealthButton({
    super.key,
    this.onTap,
    this.btnLabel,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? 342,
          height: height ?? 75,
          decoration: BoxDecoration(
              color: StcHealthStyles.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(36))),
          child: Center(
            child: Text(
              btnLabel!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
        ));
  }
}

class ActionButton extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final String icon;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const ActionButton(
      {super.key,
      this.color,
      required this.icon,
      this.iconColor,
      this.height,
      this.width,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: height ?? 40,
        height: width ?? 40,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(36))),
        child: SvgPicture.asset(icon,
            color: iconColor ?? Colors.black, fit: BoxFit.scaleDown),
      ),
    );
  }
}

// class STCBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final List<Widget> widgets;
//   final List<String> icons;
//   final List<String> labels;
//   final int totalCount;
//   final void Function(int)? itemChanged;

//   const STCBottomNavigationBar(
//       {super.key,
//       required this.currentIndex,
//       this.itemChanged,
//       required this.widgets,
//       required this.icons,
//       required this.labels,
//       this.totalCount = 0});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 0,
//       selectedItemColor: StcHealthStyles.primaryColor,
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//       currentIndex: currentIndex,
//       onTap: itemChanged,
//       items: [
//         for (int item = 0; item < widgets.length; item++) ...{
//           BottomNavigationBarItem(
//             icon: (item == 3 && totalCount > 0)
//                 ? Badge(
//                     label: Text(
//                       totalCount.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     child: SvgPicture.asset(icons[item],
//                         color: StcHealthStyles.primaryColor),
//                   )
//                 : SvgPicture.asset(icons[item],
//                     color: StcHealthStyles.primaryColor),
//             label: labels[item],
//             activeIcon: (item == 3 && totalCount > 0)
//                 ? Badge(
//                     label: Text(
//                       totalCount.toString(),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     child: SvgPicture.asset(icons[item],
//                         color: StcHealthStyles.primaryColor))
//                 : SvgPicture.asset(icons[item],
//                     color: StcHealthStyles.primaryColor),
//           )
//         }
//       ],
//     );
//   }
// }
