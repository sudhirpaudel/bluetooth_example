import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String content, bool type) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    content: Container(
      constraints:const BoxConstraints(
              minHeight: 36, minWidth: double.infinity, maxHeight: 50),
      
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                content,
                style: const TextStyle(
                    color:Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    ),

  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
