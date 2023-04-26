import 'package:flutter/material.dart';
import '../Constants/designConstants.dart';
import 'Dimensions.dart';

class DocumentButton extends StatelessWidget {
  const DocumentButton({
    required this.image,
    required this.label,
    required this.clickdoc,
    super.key,
  });
  final String image;
  final String label;
  final Function()? clickdoc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 60,
        child: ElevatedButton(
          child: Row(
            children: [
              Image(
                image: ResizeImage(
                  AssetImage(image),
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(width: MyDim.SizedBoxsmall),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          onPressed: clickdoc,
        ),
      ),
    );
  }
}
