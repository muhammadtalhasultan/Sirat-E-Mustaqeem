import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/bloc/time_format/time_format_bloc.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/timing_controller.dart';
import '../../../core/util/model/timing.dart';

enum TimingProps {
  Fajr,
  Dhuhr,
  Asr,
  Maghrib,
  Isha,
}

Map<TimingProps, String> backgroundAsset = {
  TimingProps.Fajr: 'assets/images/praying_time/svg/morning.svg',
  TimingProps.Dhuhr: 'assets/images/praying_time/svg/noon.svg',
  TimingProps.Asr: 'assets/images/praying_time/svg/afternoon.svg',
  TimingProps.Maghrib: 'assets/images/praying_time/svg/evening.svg',
  TimingProps.Isha: 'assets/images/praying_time/svg/night.svg',
};

class SuccessWidgetController {
  final Timings timings;
  final BuildContext context;
  late final int timingCount;
  late final List<Map<String, String>> timingsList;

  SuccessWidgetController(this.timings, this.context) {
    final controller = TimingController(timings);
    timingCount = controller.timingCount;
    timingsList = controller.timingsList;
  }

  String setBackgroundImage() {
    switch (timingCount) {
      case 0:
        return backgroundAsset[TimingProps.Fajr]!;
      case 1:
        return backgroundAsset[TimingProps.Dhuhr]!;
      case 2:
        return backgroundAsset[TimingProps.Asr]!;
      case 3:
        return backgroundAsset[TimingProps.Maghrib]!;
      case 4:
        return backgroundAsset[TimingProps.Isha]!;
      default:
        return backgroundAsset[TimingProps.Fajr]!;
    }
  }

  String generateIslamicDate(Timing timing) {
    return '${timing.data.date.hijri.day} ${timing.data.date.hijri.month.en} ${timing.data.date.hijri.year}';
  }

  List<Widget> generateTimingList() {
    return List.generate(
      timingsList.length,
      (index) => Container(
        decoration: index == timingCount
            ? BoxDecoration(
                color: kDarkPlaceholder.withOpacity(0.8),
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              )
            : null,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                timingsList[index].entries.first.key,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TimeFormatBloc, TimeFormatState>(
                builder: (context, state) {
                  return Text(
                    state.is24
                        ? timingsList[index].entries.first.value
                        : convertTimeTo12HourFormat(
                            timingsList[index].entries.first.value),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
