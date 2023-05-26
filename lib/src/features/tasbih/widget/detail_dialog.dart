import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';
import '../bloc/input/input_bloc.dart';

class DetailDialog extends StatelessWidget {
  const DetailDialog({
    required this.title,
    required this.nameController,
    required this.counterController,
    required this.submitFunction,
  });

  final String title;
  final TextEditingController nameController;
  final TextEditingController counterController;
  final void Function()? submitFunction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: kCardPadding,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: kBottomSheetBorderRadius,
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: BlocBuilder<InputBloc, InputState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add New Tasbih',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text(title),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        contentPadding: kInputFieldPadding,
                        hintText: 'Input tasbih name here',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                      ),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ),
                    if (state is InputNameError || state is InputError)
                      Column(
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tashbih name cannot be empty',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text('Tasbih counts:'),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      controller: counterController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onSubmitted: (_) {
                        if (nameController.text == '' &&
                            counterController.text == '') {
                          BlocProvider.of<InputBloc>(context)
                              .add(SetInputError());
                        } else if (nameController.text == '') {
                          BlocProvider.of<InputBloc>(context)
                              .add(SetInputNameError());
                        } else if (counterController.text == '') {
                          BlocProvider.of<InputBloc>(context)
                              .add(SetInputCountError());
                        } else {
                          submitFunction!();
                          Navigator.of(context).pop();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        contentPadding: kInputFieldPadding,
                        hintText: 'Input tasbih counts here',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                      ),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                    ),
                    if (state is InputCountError || state is InputError)
                      Column(
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tashbih counter cannot be empty',
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.error,
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(
                                0,
                                40.h,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            'assets/images/tasbih_icon/svg/close.svg',
                            color: kDarkTextColor,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                ),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(
                                0,
                                40.h,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (nameController.text == '' &&
                                counterController.text == '') {
                              BlocProvider.of<InputBloc>(context)
                                  .add(SetInputError());
                            } else if (nameController.text == '') {
                              BlocProvider.of<InputBloc>(context)
                                  .add(SetInputNameError());
                            } else if (counterController.text == '') {
                              BlocProvider.of<InputBloc>(context)
                                  .add(SetInputCountError());
                            } else {
                              submitFunction!();
                              Navigator.of(context).pop();
                            }
                          },
                          child: SvgPicture.asset(
                            'assets/images/tasbih_icon/svg/check.svg',
                            color: kDarkTextColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
