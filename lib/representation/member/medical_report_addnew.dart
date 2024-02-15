import 'dart:developer';

import 'package:exe201_lumos_mobile/component/app_bar.dart';
import 'package:exe201_lumos_mobile/core/const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MedicalReportAdd extends StatefulWidget {
  const MedicalReportAdd({super.key});

  static String routeName = '/medical_report_addnew';

  @override
  State<MedicalReportAdd> createState() => _MedicalReportAddState();
}

const List<String> _listPro = [
  'Ông',
  'Bà',
  'Bé',
  'Anh',
  'Chị',
];

const List<String> _listSex = [
  'Nam',
  'Nữ',
];

const List<String> _listBlood = [
  'Nhóm A Rh+',
  'Nhóm A Rh-',
  'Nhóm B Rh-',
  'Nhóm B Rh-',
  'Nhóm O Rh+',
  'Nhóm O Rh-',
  'Nhóm AB Rh+',
  'Nhóm AB Rh-',
];

class _MedicalReportAddState extends State<MedicalReportAdd> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      locale: const Locale("vi", "VN"),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: selectedDate,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      //theme
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorPalette.pink, // Màu chính của DatePicker
              onPrimary: ColorPalette.white, // Màu chữ trên nút xác nhận
              surface: ColorPalette.blue2, // Màu nền của DatePicker
              onSurface: ColorPalette.blueBold2, // Màu chữ trên nền DatePicker
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
    return Scaffold(
      appBar: const AppBarCom(
        appBarText: "Danh sách bệnh nhân",
        leading: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenWidth * 0.9,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Tạo mới hồ sơ bệnh nhân',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.almarai(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: ColorPalette.blueBold2,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Họ và tên',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorPalette.blueBold2,
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      maxLength: 20,
                      decoration: InputDecoration(
                        hintText: 'Nguyễn Văn A',
                        hintStyle: GoogleFonts.almarai(
                          color: ColorPalette.blueBold2.withOpacity(0.65),
                        ),
                        filled: true,
                        fillColor: ColorPalette.secondaryWhite,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorPalette.grey2, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorPalette.grey2, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      style: GoogleFonts.almarai(
                        color: ColorPalette.blueBold2.withOpacity(0.65),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Danh xưng',
                            style: GoogleFonts.almarai(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: ColorPalette.blueBold2,
                            ),
                          ),
                          CustomDropdown<String>(
                            closedHeaderPadding: const EdgeInsets.all(20),
                            hintText: 'Chọn danh xưng',
                            items: _listPro,
                            initialItem: _listPro[0],
                            onChanged: (value) {
                              log('changing value to: $value');
                            },
                            decoration: CustomDropdownDecoration(
                              headerStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                              ),
                              closedFillColor: ColorPalette.secondaryWhite,
                              closedBorderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              closedBorder: const Border(
                                top: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                left: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                right: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                bottom: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Giới tính',
                            style: GoogleFonts.almarai(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: ColorPalette.blueBold2,
                            ),
                          ),
                          CustomDropdown<String>(
                            closedHeaderPadding: const EdgeInsets.all(20),
                            hintText: 'Chọn giới tính',
                            items: _listSex,
                            initialItem: _listSex[0],
                            onChanged: (value) {
                              log('changing value to: $value');
                            },
                            decoration: CustomDropdownDecoration(
                              headerStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                              ),
                              closedFillColor: ColorPalette.secondaryWhite,
                              closedBorderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              closedBorder: const Border(
                                top: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                left: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                right: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                bottom: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngày sinh',
                            style: GoogleFonts.almarai(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: ColorPalette.blueBold2,
                            ),
                          ),
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: ColorPalette.secondaryWhite,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: ColorPalette.grey2,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: ColorPalette.blueBold2,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    formattedDate,
                                    style: GoogleFonts.almarai(
                                      color: ColorPalette.blueBold2
                                          .withOpacity(0.65),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nhóm máu',
                            style: GoogleFonts.almarai(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: ColorPalette.blueBold2,
                            ),
                          ),
                          CustomDropdown<String>(
                            closedHeaderPadding: const EdgeInsets.all(20),
                            hintText: 'Chọn nhóm máu',
                            items: _listBlood,
                            initialItem: _listBlood[0],
                            onChanged: (value) {
                              log('changing value to: $value');
                            },
                            decoration: CustomDropdownDecoration(
                              headerStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              hintStyle: GoogleFonts.almarai(
                                color: ColorPalette.blueBold2.withOpacity(0.65),
                              ),
                              closedFillColor: ColorPalette.secondaryWhite,
                              closedBorderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              closedBorder: const Border(
                                top: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                left: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                right: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                                bottom: BorderSide(
                                    color: ColorPalette.grey2, width: 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số điện thoại',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorPalette.blueBold2,
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: '0912345678',
                        hintStyle: GoogleFonts.almarai(
                          color: ColorPalette.blueBold2.withOpacity(0.65),
                        ),
                        filled: true,
                        fillColor: ColorPalette.secondaryWhite,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorPalette.grey2, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorPalette.grey2, width: 1.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      style: GoogleFonts.almarai(
                        color: ColorPalette.blueBold2.withOpacity(0.65),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ghi chú',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: ColorPalette.blueBold2,
                      ),
                    ),
                    SingleChildScrollView(
                      child: TextField(
                        maxLines: 5,
                        maxLength: 255,
                        decoration: InputDecoration(
                          hintText: 'Nhập ghi chú...',
                          hintStyle: GoogleFonts.almarai(
                            color: ColorPalette.blueBold2.withOpacity(0.65),
                          ),
                          filled: true,
                          fillColor: ColorPalette.secondaryWhite,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.grey2, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorPalette.grey2, width: 1.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        style: GoogleFonts.almarai(
                          color: ColorPalette.blueBold2.withOpacity(0.65),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton(
            onPressed: () {
              print('Button pressed');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.pink,
              padding: const EdgeInsets.all(12),
              minimumSize: const Size(100, 40),
            ),
            child: Text(
              'Lưu',
              style: GoogleFonts.almarai(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorPalette.secondaryWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
