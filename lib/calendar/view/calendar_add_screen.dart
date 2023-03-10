import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:with_calendar/calendar/components/calendar_new_event/color_picker_widget.dart';
import 'package:with_calendar/calendar/components/calendar_new_event/day_time_widget.dart';
import 'package:with_calendar/calendar/components/calendar_new_event/text_field_widget.dart';
import 'package:with_calendar/calendar/provider/event_data_provider.dart';
import 'package:with_calendar/common/data/color_data.dart';
import 'package:with_calendar/common/view/default_layout.dart';

class CalendarNewEventScreen extends ConsumerStatefulWidget {
  static String get routeName => 'NewEvent';
  const CalendarNewEventScreen({super.key});

  @override
  ConsumerState<CalendarNewEventScreen> createState() => _CalendarNewEventScreenState();
}

class _CalendarNewEventScreenState extends ConsumerState<CalendarNewEventScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<bool> isFilled = [false, false, false];
  bool isOnColorPicker = false;
  double colorPickerSize = 0;

  void isFilledTextField() {
    setState(() {
      if (titleController.text.isEmpty) {
        isFilled[0] = false;
      }
      if (locationController.text.isEmpty) {
        isFilled[1] = false;
      }
      if (descriptionController.text.isEmpty) {
        isFilled[2] = false;
      }
    });
  }

  void onTapTextField(int index) {
    isFilledTextField();
    setState(() {
      isFilled[index] = true;
    });
  }

  @override
  void initState() {
    controllerListener();
    super.initState();
  }

  void controllerListener() {
    final onChange = ref.read(newEventProvider.notifier);
    titleController.addListener(() => onChange.setClass(title: titleController.text));
    locationController.addListener(() => onChange.setClass(place: locationController.text));
    descriptionController.addListener(() => onChange.setClass(detail: descriptionController.text));
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void onColorPicker() {
    setState(() {
      isOnColorPicker = !isOnColorPicker;
      if (isOnColorPicker) {
        colorPickerSize = 40;
      } else {
        colorPickerSize = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFilledTextField();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DefaultLayout(
        appBarWidget: AppBar(
          title: const Text('?????? ??????'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // * Title ??????
                  TextFieldWidget(
                    hintText: '??????',
                    icon: const Icon(Icons.create_outlined),
                    suffixIcon: const Icon(Icons.palette_outlined),
                    controller: titleController,
                    isFilled: isFilled,
                    index: 0,
                    textFieldOnTap: onTapTextField,
                    suffixOnTap: onColorPicker,
                    columnDivider: columnDivider(),
                  ),

                  // * Color Picker
                  ColorPickerWidget(columnDivider: columnDivider()),

                  // * ??????/?????? ??????
                  DateTimeWidget(columnDivider: columnDivider()),

                  // * Location ??????
                  TextFieldWidget(
                    hintText: '??????',
                    icon: const Icon(Icons.location_on_outlined),
                    controller: locationController,
                    isFilled: isFilled,
                    index: 1,
                    textFieldOnTap: onTapTextField,
                    columnDivider: columnDivider(),
                  ),

                  // * ???????????? ?????? ?????? ??????
                  InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 50,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.calendar_month_outlined),
                          SizedBox(
                            width: 16,
                          ),
                          Text('????????? ?????? ??????'),
                        ],
                      ),
                    ),
                  ),
                  // * ?????? ?????? ??????
                  InkWell(
                    onTap: () {},
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 50,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.notifications_outlined),
                          SizedBox(
                            width: 16,
                          ),
                          Text('10??? ???'),
                        ],
                      ),
                    ),
                  ),

                  // * Detail ??????
                  TextFieldWidget(
                    hintText: '??????',
                    icon: const Icon(Icons.description_outlined),
                    controller: descriptionController,
                    isFilled: isFilled,
                    index: 2,
                    textFieldOnTap: onTapTextField,
                    columnDivider: columnDivider(),
                  ),

                  //* ??????
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Divider columnDivider() {
    return Divider(
      color: ColorStyles.color_3.withOpacity(0.5),
      height: 10,
      thickness: 1.5,
    );
  }
}
