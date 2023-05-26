import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/util/constants.dart';
import '../../utils/loading_widget.dart';
import '../bloc/category_bloc.dart';
import 'success_widget.dart';

class BookmarkContent extends StatefulWidget {
  const BookmarkContent();

  @override
  State<BookmarkContent> createState() => _BookmarkContentState();
}

class _BookmarkContentState extends State<BookmarkContent> {
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      BlocProvider.of<CategoryBloc>(context).add(FindAllFavoriteItems());
      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          return LoadingWidget();
        }
        if (state is CategoryDone) {
          return SuccessWidget();
        } else {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: kPagePadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 500.w),
                      child: LottieBuilder.asset(
                        'assets/images/core/json/empty_bookmark.json',
                      ),
                    ),
                    Text(
                      'You have not favorited or bookmarked any Qurans, Tasbihs or Duas.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
