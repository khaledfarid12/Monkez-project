import 'package:flutter/material.dart';
import '../Constants/designConstants.dart';
import 'Dimensions.dart';

class InstructionsPopUp extends StatelessWidget {
  const InstructionsPopUp({
    required this.onpressed,
    required this.steps,
    super.key,
  });
  final Text steps;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: Text("Here are the instructions: ",
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      content: SingleChildScrollView(child: steps),
      actions: [
        TextButton(
          child: Text("Done"),
          onPressed: onpressed,
        )
      ],
    );
  }
}

Text NationalID() {
  return Text(
    "In case of loss of your National ID:\n "
    "\n"
    "1st step: A loss note must be made at the nearest police station\n"
    "\n"
    "\n"
    "2nd step: Head to the nearest Civil Status Department of your area where you'll need to get an Application form\n"
    "\n"
    "\n"
    "Here are the documents you should take with you in order to issue a replacement for your National ID:\n "
    "\n"
    "1 - A copy of your Birth Certificate (Or any proof of identity).\n"
    "\n"
    "2 - A copy of your Marital status certificate.\n"
    "\n"
    "3 - Proof of place of residence.\n"
    "\n"
    "4 - Proof of current job.\n"
    "\n"
    "Important note: A guranteer close to the fourth degree must be present with you  "
    "\n"
    "\n"
    "3rd step: Submit the application to the competent employee\n"
    "\n"
    "Fees: \n"
    "1 - 45 pounds to be delivered after 15 days\n"
    "\n"
    "2- 120 pounds to be delivered after 3 days\n"
    "\n"
    "3- 170 pounds to be delivered after 24 hours",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}

Text HighSchool() {
  return Text(
    "1st step: Obtain a Money order paper from the Post Office you belong to, at a value of 10 pounds and directed to the Ministry of Education\n"
    "\n"
    "\n"
    "2nd step: Buy 4 support stamps for educational projects, and the value of those stamps is “1 pound” for each stamp\n"
    "\n"
    "\n"
    "3rd step: Go to Student Affairs in the educational administration affiliated to it or the Office of the Directors of the Ministry of Education and get what is called the 'request to extract the statement'\n "
    "\n"
    "\n"
    "4th step: Also get a Statement form, which is another form to be written and the required data filled in, which is the applicant’s data completely.\n"
    "\n"
    "\n"
    "And here are the required data to be filled in the Statement form\n"
    "\n"
    "1 The four-name of the applicant\n"
    "\n"
    "2 - The seat number of the applicant which must be correct and accurate\n"
    "\n"
    "3 - The educational stage, the name of the school to which he belongs.\n"
    "\n"
    "4 - The academic qualification, which is here 'General Secondary school' \n"
    "\n"
    "P.S: If there is a failure data, the year of failure is written, and the quality of the statement, whether passing or failing"
    "\n"
    "\n"
    "5-The foreign language the student has obtained and the division in which the student is enrolled, whether scientific or literary\n"
    "\n"
    "\n"
    "6-The name of the entity from which the student will be extracted, and the full address of the student",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}

Text DriverLisence() {
  return Text(
    "1st step: Make a report at the police station acknowledging the theft or loss of your license, provided that the police station is located in your place of residence.\n"
    "\n"
    "\n"
    "2nd step: Go to the Traffic Department to obtain a violation certificate from the Traffic Prosecution'.\n "
    "\n"
    "\n"
    "3th step: Go to your traffic department.\n"
    "\n"
    "\n"
    "4th step: Go to the license application window.\n"
    "\n"
    "\n"
    "The Required Documents: \n"
    "\n"
    "1 - Submitting an application on the form prepared for that at the relevant traffic department.\n"
    "\n"
    "2 - Submit proof of identity and place of residence\n"
    "\n"
    "3 - Presentation of the damaged license or evidence of the loss of the license (a note drawn up at the police station or an acknowledgment of the loss of the license).\n"
    "\n"
    "4 Pay the legally prescribed fees and receive the license. "
    "\n"
    "\n"
    "Total Fees: \n"
    "*1115 Pounds* which are composed of: \n"
    "\n"
    "a - Clearance certificate or violation certificate with a value of 20 pounds.\n"
    "\n"
    "b - Medical examination certificate for internal medicine and vision are worth 285 pounds.\n"
    "\n"
    "c - Tax fees 567 pounds.\n"
    "\n"
    "d - A form in addition to a fee form and stamps worth 130 pounds.\n"
    "\n"
    "e - File fee + bag value of 85 pounds.\n"
    "\n"
    "f - Traffic Form 256, with a value of 40 pounds.\n"
    "\n"
    "g A stamp of police violations worth 3 pounds.\n "
    "\n"
    "\n"
    "Terms of obtaining the service: \n"
    "\n"
    "The residence of the applicant in the department of the traffic department/unit providing the service.\n",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}

Text BirthCertificate() {
  return Text(
    "1st step: Form 40, intended for a request to obtain an official document or document from the civil registry.\n"
    "\n"
    "\n"
    "2nd step: Head to the nearest civil registry.\n "
    "\n"
    "\n"
    "3rd step: Take your National ID card and a copy thereof.\n"
    "\n"
    "\n"
    "Important Note: The applicant must be the person who will receive the service or who has the right to obtain a birth certificate for him, such as (father – mother – brother – uncle – aunt – aunt – grandfather – wife – children), with proof of that being related to the service owner.\n"
    "\n"
    "\n"
    "The fee for obtaining a birth certificate is paid: 20 pounds\n"
    "\n",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}

Text Passport() {
  return Text(
    "1st step: Providing a record of the loss of the passport from the Egyptian Passports or an announcement in an official newspaper.\n"
    "\n"
    "\n"
    "2nd step: Provide data of the lost passport or a copy of the lost passport, if any.\n "
    "\n"
    "\n"
    "3rd step: Provide copy of residence in the country in which it is submitted.\n"
    "\n"
    "\n"
    "4th step: A report will be issued at the consulate, provided that the passport holder is present in person and all information related to the lost passport is provided.\n"
    "\n"
    "\n"
    "5th step: The passport owner must approve the minutes and attach the required documents with the minutes.\n"
    "\n"
    "\n"
    "6th step: Presentation of identity card, marriage certificate or educational qualifications\n"
    "\n"
    "\n"
    "P.S: When the passport is damaged, the same previous procedures shall be applied for when issuing the regular passport, in addition to a statement explaining the cause of the damage\n"
    "\n"
    "\n"
    "Documents required to obtain the Egyptian passport:\n"
    "\n"
    "1-Fill out the “Form No. 29” form\n"
    "\n"
    "2-Completion of all data in a correct manner without deletion or destruction\n"
    "\n"
    "3-Provide the National ID, and pay attention that it is not expired\n"
    "\n"
    "4-Submit the necessary documents to prove and confirm academic qualifications\n"
    "\n"
    "5-Provide proof of marital status, i.e. provide a marriage or divorce voucher\n"
    "\n"
    "6-Submission of the private commercial register to all business owners and commercial activities\n"
    "\n"
    "7-Bring personal photos\n"
    "\n"
    "8-Paying a sum of money as guarantee, amounting to 400 Egyptian pounds only and an extra 100 pounds upon completion\n"
    "\n"
    "\n"
    "The authorities responsible for issuing the Egyptian passport: \n "
    "\n"
    "- Branches of the Ministry of Interior responsible for managing documents related to travel, nationalities and immigration abroad\n"
    "- The Egyptian Consulate and its various branches\n"
    "- Egyptian embassies in all countries of the world\n"
    "- The “electronic passports” are obtained from all branches of the “Passports Department” in the Arab Republic of Egypt, which are available in all governorates\n"
    "\n"
    "\n",
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}
