import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/bloc/tasbih/tasbih_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/model/tasbih.dart';
import '../../bookmark/bloc/category_bloc.dart';
import '../../utils/sirat_card.dart';
import '../bloc/selected_tasbih/selected_tasbih_bloc.dart';
import '../controller/tasbih_controller.dart';
import '../screen/selected_tasbih_screen.dart';
import 'bottom_selection.dart';

class TasbihCard extends StatefulWidget {
  const TasbihCard(
    this.tasbih,
    this.index, {
    this.bookmarkScreen = false,
  });

  final Tasbih tasbih;
  final int index;
  final bool bookmarkScreen;

  @override
  State<TasbihCard> createState() => _TasbihCardState();
}

class _TasbihCardState extends State<TasbihCard> {
  late final TextEditingController nameController;
  late final TextEditingController counterController;

  @override
  void initState() {
    nameController = TextEditingController();
    counterController = TextEditingController();
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SelectedTasbihBloc(widget.tasbih),
              child: SelectedTasbihScreen(),
            ),
          ),
        );
      },
      child: SiratCard(
        child: Row(
          children: [
            Container(
              width: 28.w,
              height: 28.w,
              padding: EdgeInsets.symmetric(
                vertical: 4.w,
                horizontal: 8.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2.sp,
                ),
              ),
              child: FittedBox(
                child: Text(
                  widget.index.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Text(
                widget.tasbih.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: 'Uthman'),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.tasbih.counter.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'counts',
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 16.w,
            ),
            GestureDetector(
              onTap: () async {
                await toggleTasbihFavorite(context, widget.tasbih);

                if (widget.bookmarkScreen) {
                  await Future.delayed(Duration.zero);

                  BlocProvider.of<CategoryBloc>(context).add(
                    UpdateFavoriteItem(
                      tasbihs:
                          BlocProvider.of<TasbihBloc>(context).state.tasbihs,
                    ),
                  );
                }
              },
              child: SvgPicture.asset(
                widget.tasbih.favorite == 0
                    ? 'assets/images/tasbih_icon/svg/favorite.svg'
                    : 'assets/images/tasbih_icon/svg/favorite_filled.svg',
                color: Theme.of(context).primaryColor,
                width: 20.w,
              ),
            ),
            SizedBox(
              width: 8.w,
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
                      return BottomSelection(widget.tasbih);
                    });
              },
              child: SvgPicture.asset(
                'assets/images/tasbih_icon/svg/more.svg',
                color: Theme.of(context).primaryColor,
                width: 20.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
