import 'package:flutter/material.dart';
import '../Constants/designConstants.dart';

class Location {
  late String location;
}

List<DropdownMenuItem> LocationList() {
  List<DropdownMenuItem>? locationItems;
  locationItems = [
    const DropdownMenuItem(
      value: 'Alexandria',
      child: Text("Alexandria", style: kMenuItemStyle),
    ),
    const DropdownMenuItem(
      value: 'Aswan',
      child: Text(
        "Aswan",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Asyut",
      child: Text(
        "Asyut",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Beheira",
      child: Text(
        "Beheira",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Beni Suef",
      child: Text(
        "Beni Suef",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Cairo",
      child: Text(
        "Cairo",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Dakahlia",
      child: Text(
        "Dakahlia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Damietta",
      child: Text(
        "Damietta",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Faiyum ",
      child: Text(
        "Faiyum ",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Gharbia",
      child: Text(
        "Gharbia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Giza",
      child: Text(
        "Giza",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Ismailia",
      child: Text(
        "Ismailia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Kafr El Sheikh",
      child: Text(
        "Kafr El Sheikh",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Luxor",
      child: Text(
        "Luxor",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Matruh",
      child: Text(
        "Matruh",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Minya",
      child: Text(
        "Minya",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Monufia",
      child: Text(
        "Monufia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "New Valley",
      child: Text(
        "New Valley",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "North Sinai",
      child: Text(
        "North Sinai",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Port Said",
      child: Text(
        "Port Said",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Qalyubia",
      child: Text(
        "Qalyubia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Qena",
      child: Text(
        "Qena",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Red Sea",
      child: Text(
        "Red Sea",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Sharqia",
      child: Text(
        "Sharqia",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Sohag",
      child: Text(
        "Sohag",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "South Sinai",
      child: Text(
        "South Sinai",
        style: kMenuItemStyle,
      ),
    ),
    const DropdownMenuItem(
      value: "Suez",
      child: Text(
        "Suez",
        style: kMenuItemStyle,
      ),
    ),
  ];
  return locationItems;
}
