import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frame/welcome/welcome_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_index.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

// for building the head title of the profile page

  AppBar _buildAppBar() {
    return AppBar(
        title: Text(
      "Profile",
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ));
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
              color: AppColors.primarySecondaryBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(60.w),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ]),
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/account_header.png"),
          ),
        ),
        Positioned(
          bottom: 0.w,
          right: 0.w,
          height: 35.w,
          child: GestureDetector(
            child: Container(
              height: 35.w,
              width: 35.w,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Image.asset("assets/icons/edit.png"),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(5.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1))
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Complete",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          )
        ]),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 0.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: AppColors.primarySecondaryElementText,
            borderRadius: BorderRadius.circular(5.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1))
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Logout",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          )
        ]),
      ),
      onTap: () {
        Get.defaultDialog(
            title: "Are you sure you want to logout?",
            content: Container(),
            onConfirm: () {
              controller.logOut();
            },
            onCancel: () {},
            textCancel: "Cancel",
            textConfirm: "Logout",
            confirmTextColor: Colors.white);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildProfilePhoto(),
                  _buildCompleteBtn(),
                  _buildLogoutBtn()
                ],
              )),
            )
          ]),
        ));
  }
}
