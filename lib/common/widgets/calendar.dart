import 'package:base_flutter_2/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/theme/app_colors.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({
    required this.onDaySelected,
    this.focusedDay,
    this.selectedDay,
    this.firstDay,
    super.key,
  });
  final DateTime? focusedDay;
  final DateTime? selectedDay;
  final DateTime? firstDay;

  final void Function(DateTime selectedDay) onDaySelected;
  @override
  // ignore: library_private_types_in_public_api
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    _focusedDay = widget.focusedDay ?? DateTime.now().toLocal();
    _selectedDay = widget.selectedDay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tháng ${_focusedDay.month.toString().padLeft(2, '0')} - ${_focusedDay.year}',
                style: context.textTheme.headlineMedium,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month - 1,
                        );
                      });
                    },
                    child: Container(
                      height: 32.w,
                      width: 32.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // boxShadow: [cirContainerShadow],
                      ),
                      // child: Assets.icons.chevronLeft.svg(),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                        );
                      });
                    },
                    child: Container(
                      height: 32.w,
                      width: 32.w,
                      margin: EdgeInsets.only(left: 14.w),
                      padding: EdgeInsets.all(5.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        // boxShadow: [cirContainerShadow],
                      ),
                      // child: Assets.icons.chevronRight.svg(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(16.w),
          SizedBox(
            height: 192.w,
            width: double.maxFinite,
            child: TableCalendar(
              shouldFillViewport: true,
              headerVisible: false,
              firstDay: widget.firstDay ?? DateTime.utc(2020, 1, 1),
              lastDay: DateTime.now().toLocal(),
              focusedDay: _focusedDay,
              onPageChanged: _onPageChanged,
              selectedDayPredicate: _selectedDayPredicate,
              onDaySelected: _onDaySelected,
              headerStyle: _headerStyle,
              calendarStyle: const CalendarStyle(),
              daysOfWeekStyle: _daysOfWeekStyle(context),
              locale: Intl.defaultLocale,
              daysOfWeekHeight: 28.w,
              calendarBuilders: CalendarBuilders(
                dowBuilder: _dowBuilder,
                defaultBuilder: _defaultBuilder,
                disabledBuilder: _disabledBuilder,
                selectedBuilder: _selectedBuilder,
                todayBuilder: _todayBuilder,
                outsideBuilder: _disabledBuilder,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPageChanged(focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  bool _selectedDayPredicate(DateTime date) {
    return isSameDay(_selectedDay, date);
  }

  void _onDaySelected(selectedDay, focusedDay) {
    widget.onDaySelected(selectedDay);
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  final HeaderStyle _headerStyle = const HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
    leftChevronVisible: false,
    rightChevronVisible: false,
  );
  DaysOfWeekStyle _daysOfWeekStyle(BuildContext context) {
    final weekdayStyle = (context.textTheme.bodyMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600);
    final weekendStyle = (context.textTheme.titleMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600);

    return DaysOfWeekStyle(
      weekdayStyle: weekdayStyle,
      weekendStyle: weekendStyle,
    );
  }

  Widget _dowBuilder(BuildContext context, DateTime date) {
    final days = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
    BorderRadiusGeometry? radius;
    if ((date.weekday % 7) == 0) {
      radius = const BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      );
    }
    if ((date.weekday % 7) == 6) {
      radius = const BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
      );
    }
    return Container(
      decoration: BoxDecoration(color: AppPalette.grey50, borderRadius: radius),
      height: 30,
      child: Center(
        child: Text(
          days[date.weekday % 7],
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _defaultBuilder(
    BuildContext context,
    DateTime date,
    DateTime focusedDay,
  ) {
    return SizedBox(
      height: 28.w,
      child: Center(
        child: Text(date.day.toString(), style: context.textTheme.bodyMedium),
      ),
    );
  }

  Widget _selectedBuilder(
    BuildContext context,
    DateTime date,
    DateTime focusedDay,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.colorScheme.primary,
      ),
      width: 40.w,
      height: 28.w,
      child: Center(
        child: Text(
          date.day.toString(),
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _todayBuilder(
    BuildContext context,
    DateTime date,
    DateTime focusedDay,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: context.colorScheme.primary),
      ),
      width: 40.w,
      height: 28.w,
      child: Center(
        child: Text(date.day.toString(), style: context.textTheme.bodyMedium),
      ),
    );
  }

  Widget _disabledBuilder(
    BuildContext context,
    DateTime date,
    DateTime focusedDay,
  ) {
    return SizedBox(
      height: 28.w,
      child: Center(
        child: Text(
          date.day.toString(),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.appColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
