import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/export.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>>? items;
  final TextEditingController? searchController;
  final bool Function(DropdownMenuItem<T>, String)? searchMatchFn;
  final String hint;
  final String hintText;
  const CustomDropdown({
    required this.items,
    required this.hint,
    required this.onChanged,
    this.value,
    this.searchController,
    this.searchMatchFn,
    this.hintText = 'Nhập để tìm kiếm...',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Text(hint),
        items: items,
        value: value,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          height: 48.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.grey300)),
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, 0),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          maxHeight: 360.h,
        ),
        menuItemStyleData:
            MenuItemStyleData(padding: EdgeInsets.zero, height: 40.h),
        iconStyleData:
            const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
        dropdownSearchData: searchController != null
            ? DropdownSearchData(
                searchController: searchController,
                searchInnerWidgetHeight: 50.h,
                searchInnerWidget: Container(
                  height: 56.h,
                  padding: EdgeInsets.all(8.w),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: searchController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey300)),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: hintText,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.grey300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: searchMatchFn,
              )
            : null,
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen && searchController != null) {
            searchController!.clear();
          }
        },
      ),
    );
  }
}
