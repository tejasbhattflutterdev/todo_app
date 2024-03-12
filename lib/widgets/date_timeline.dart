import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_example/app/modules/my_controllers/controllers/datecontroller_controller.dart';

class CustomBackgroundExample extends StatelessWidget {
  final DateController dateController = Get.put(DateController());

  CustomBackgroundExample({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        dateController.handleDateChange(selectedDate);
        dateController.formattedDate.value = formattedDate;
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.custom('yyyy-MM-dd'),
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
