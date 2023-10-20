import 'package:intl/intl.dart';

abstract class AppHelpers{


  static String changeDateFormat({required String dateString}){
    
    final formatedDate= DateFormat('EE, MMMM yy').format(DateTime.parse(dateString));
     
     return formatedDate.toString();
  }
   static String abbreviatedDateFormt({required String dateString}){
    
    final formatedDate= DateFormat('EE, MMM yy').format(DateTime.parse(dateString));
     
     return formatedDate.toString();
  }
}