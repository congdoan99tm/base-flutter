import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/router.dart';
import '../utils/calendar.dart';
import 'buttons/export.dart';

class CalendarPicker extends StatefulWidget {
  const CalendarPicker({
    required this.cb,
    super.key,
    this.rangeStart,
    this.rangeEnd,
  });
  final DateTime? rangeStart, rangeEnd;
  final Function(DateTime from, DateTime to, DateTime fromAgo, DateTime toAgo)
      cb;
  @override
  // ignore: library_private_types_in_public_api
  _CalendarPickerState createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _rangeStart = widget.rangeStart;
    _rangeEnd = widget.rangeEnd;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: CalendarFormat.month,
          rangeSelectionMode: _rangeSelectionMode,
          onDaySelected: _onDaySelected,
          onRangeSelected: _onRangeSelected,
          onFormatChanged: _onFormatChanged,
          onPageChanged: _onPageChanged,
          headerStyle: _headerStyle,
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: _headerTitleBuilder,
            defaultBuilder: _defaultBuilder,
            outsideBuilder: _outSide,
            disabledBuilder: _outSide,
            todayBuilder: _todayBuilder,
            selectedBuilder: _selectedBuilder,
            rangeStartBuilder: _rangeStartBuilder,
            rangeEndBuilder: _rangeEndBuilder,
          ),
          daysOfWeekStyle: _daysOfWeekStyle,
          weekendDays: const [7],
        ),
        _RowButton(
          onPressed: () {
            if (_rangeStart != null) {
              if (_rangeEnd == null) {
                final DateTime holiday =
                    _rangeStart!.subtract(const Duration(days: 1));
                widget.cb(_rangeStart!, _rangeStart!, holiday, holiday);
              } else {
                final Duration difference = _rangeStart!.difference(_rangeEnd!);
                final DateTime startAgo = _rangeStart!.add(difference);
                widget.cb(_rangeStart!, _rangeEnd!, startAgo, _rangeStart!);
              }
            }
          },
        )
      ],
    );
  }

  Container _outSide(context, DateTime date, events) => Container(
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: Text(date.day.toString()),
      );
  FittedBox _headerTitleBuilder(context, DateTime focusedDay) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text('Tháng ${focusedDay.month} / ${focusedDay.year}'),
    );
  }

  Container _defaultBuilder(context, DateTime date, events) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      child: Text(
        date.day.toString(),
      ),
    );
  }

  Container _todayBuilder(context, DateTime day, focusedDay) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2),
        color: Colors.white,
      ),
      child: Text(
        day.day.toString(),
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });
  }

  void _onFormatChanged(CalendarFormat format) {
    // if (_calendarFormat != format) {
    //   setState(() {
    //     _calendarFormat = format;
    //   });
    // }
  }

  void _onPageChanged(DateTime focusedDay) {
    _focusedDay = focusedDay;
  }

  final HeaderStyle _headerStyle = HeaderStyle(
      titleCentered: true,
      formatButtonVisible: false,
      headerPadding:
          const EdgeInsets.symmetric(horizontal: 44).copyWith(bottom: 10),
      leftChevronIcon: const Icon(Icons.arrow_back_ios),
      rightChevronIcon: const Icon(Icons.arrow_forward_ios));

  final DaysOfWeekStyle _daysOfWeekStyle = const DaysOfWeekStyle();

  Container _selectedBuilder(context, DateTime day, focusedDay) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Text(day.day.toString()),
    );
  }

  Container _rangeStartBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      child: Text(day.day.toString()),
    );
  }

  Container _rangeEndBuilder(
      BuildContext context, DateTime day, DateTime focusedDay) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      child: Text(day.day.toString()),
    );
  }
}

class _RowButton extends StatelessWidget {
  const _RowButton({required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TransButton(
              text: 'Huỷ',
              width: 156,
              onPressed: pop,
            ),
            Gap(16.w),
            PrimaryButton(
              text: 'Chọn',
              width: 156,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
