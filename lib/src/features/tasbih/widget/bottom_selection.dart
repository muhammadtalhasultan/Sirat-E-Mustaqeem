import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/model/tasbih.dart';
import '../controller/tasbih_controller.dart';
import 'detail_dialog.dart';

class BottomSelection extends StatefulWidget {
  const BottomSelection(this.tasbih);

  final Tasbih tasbih;

  @override
  State<BottomSelection> createState() => _BottomSelectionState();
}

class _BottomSelectionState extends State<BottomSelection> {
  late final TextEditingController nameController;
  late final TextEditingController counterController;

  @override
  void initState() {
    nameController = TextEditingController();
    nameController.text = widget.tasbih.name;
    counterController = TextEditingController();
    counterController.text = widget.tasbih.counter.toString();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kCardPadding,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: kBottomSheetBorderRadius,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Actions:',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 24.h,
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: kBottomSheetBorderRadius,
                  ),
                  builder: (context) {
                    return DetailDialog(
                      title: 'Edit Tasbih',
                      nameController: nameController,
                      counterController: counterController,
                      submitFunction: () async {
                        await editTasbih(
                          context,
                          widget.tasbih,
                          nameController,
                          counterController,
                        );
                      },
                    );
                  });
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/tasbih_icon/svg/edit.svg',
                  width: 24.w,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text('Edit'),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: () async {
              await copyTasbih(context, widget.tasbih);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/tasbih_icon/svg/copy.svg',
                  width: 24.w,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text('Copy'),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: () async {
              await deleteTasbih(context, widget.tasbih);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/tasbih_icon/svg/delete.svg',
                  width: 24.w,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Delete',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
