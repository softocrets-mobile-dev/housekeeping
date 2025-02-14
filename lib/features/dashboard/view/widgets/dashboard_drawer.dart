import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housekeeping_pro/common/dialogs/logout_view.dart';
import 'package:housekeeping_pro/common/toast_message/toast_message.dart';
import 'package:housekeeping_pro/common/utils/dashboard_utils.dart';
import 'package:housekeeping_pro/common/widgets/text_widget.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/assets/app_images.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';
import 'package:housekeeping_pro/features/authenticaiton/view/login_page.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    super.key,
    required this.onItemTap,
    required this.selectedIndex,
  });

  final int selectedIndex;
  final Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blackColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              AppImages.logo,
              color: Colors.white,
              colorBlendMode: BlendMode.color,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: DashboardUtils().tabs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = DashboardUtils().tabs[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      item.icon,
                      colorFilter: ColorFilter.mode(
                        selectedIndex == index
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: TextWidget(
                      text: item.title,
                      color: selectedIndex == index
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                    ),
                    onTap: () {
                      onItemTap(index);
                    },
                    selected: selectedIndex == index,
                    selectedTileColor: Colors.grey[200],
                  ),
                );
              },
            ),
            Spacer(),
            InkWell(
              onTap: () async {
                await showAdaptiveDialog<bool>(
                  context: context,
                  builder: (ctx) {
                    return LogoutView();
                  },
                ).then((v) async {
                  if (v == null || !v) return;
                  try {
                    await LocalStorage.getInstance().clearAll();
                    if (context.mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginPage.route, (route) => false);
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ToastMessage.show(
                          message: e.toString(), context: context);
                    }
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 35, bottom: 50),
                child: Row(
                  spacing: 20,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      size: 28.r,
                      color: AppColors.whiteColor,
                    ),
                    TextWidget(
                      text: 'Logout',
                      color: AppColors.whiteColor,
                      fontSize: 20.sp,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
