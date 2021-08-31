import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/util/model/tasbih.dart';
import '../bloc/selected_tasbih_bloc.dart';
import '../screen/selected_tasbih_screen.dart';
import '../../utils/sirat_card.dart';

class TasbihCard extends StatelessWidget {
  const TasbihCard(
    this.tasbih,
    this.index,
  );

  final Tasbih tasbih;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SelectedTasbihBloc(tasbih),
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
                  index.toString(),
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
                tasbih.name,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tasbih.counter.toString(),
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
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/tasbih_icon/svg/favorite.svg',
                color: Theme.of(context).primaryColor,
                width: 20.w,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {},
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
