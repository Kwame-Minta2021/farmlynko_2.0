import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmlynko/feature/buyer/model/cropcare_model.dart';
import 'package:farmlynko/shared/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class CultivationDetailScreen extends ConsumerWidget {
  const CultivationDetailScreen({required this.cropCareModel, super.key});

  final CropCareModel cropCareModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(1.h),
              height: 4.h,
              width: 4.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h)),
              child: Padding(
                padding: EdgeInsets.only(left: .8.h),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          )),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100.h,
          ),
          Container(
            width: double.infinity,
            height: 35.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(cropCareModel.image),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2.5.h),
                    topRight: Radius.circular(2.5.h),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(2.h),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Html(
                        data: cropCareModel.content,
                      ),
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
