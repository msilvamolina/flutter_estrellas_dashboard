import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Utils {
  Utils._();

  static String removeNull(String value) {
    value = value.replaceAll(' - null', '');
    return value.trim();
  }

  static int colorToInt(Color color) {
    String colorString = color.toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);

    return value;
  }

  static Color intToColor(int value) {
    Color color = Color(value);
    return color;
  }

  static String getStringDate(String date) {
    DateTime time = DateTime.parse(date);

    return time.toString();
    // return date;
  }

  static String getTimeAgo(String date) {
    DateTime time = DateTime.parse(date);
    return timeago.format(time, locale: 'es');
  }

  Color getColor(String color) {
    try {
      if (color.length == 6) {
        color = '0xff${color}';
      }
      var myInt = int.parse(color.toString());
      Color transformado = Color(myInt).withOpacity(1.0);
      return transformado;
    } catch (e) {
      return Colors.grey;
    }
  }

  String doubleToString(dynamic numero) {
    try {
      String variable = numero.toString();
      variable = variable.replaceAll('.0', '');

      return variable.trim();
    } catch (e) {
      return '';
    }
  }

  String corregirVersion(String version) {
    version = version.replaceAll('.', '');
    version = version.replaceAll('+', '');
    return version;
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String quitarAcentos(String elemento) {
    elemento = elemento.replaceAll('á', 'a');
    elemento = elemento.replaceAll('é', 'e');
    elemento = elemento.replaceAll('í', 'i');
    elemento = elemento.replaceAll('ó', 'o');
    elemento = elemento.replaceAll('ú', 'u');
    elemento = elemento.replaceAll('ñ', 'n');
    elemento = elemento.replaceAll('ä', 'a');
    elemento = elemento.replaceAll('ë', 'e');
    elemento = elemento.replaceAll('ï', 'i');
    elemento = elemento.replaceAll('ö', 'o');
    elemento = elemento.replaceAll('ü', 'u');
    return elemento;
  }

  String arreglarRedes(valor) {
    String nuevoValor = valor.toString().toLowerCase();
    nuevoValor = nuevoValor.replaceAll('www.', '');
    nuevoValor = nuevoValor.replaceAll('http://', '');
    nuevoValor = nuevoValor.replaceAll('https://', '');
    nuevoValor = nuevoValor.replaceAll('m.facebook.com/', '');
    nuevoValor = nuevoValor.replaceAll('facebook.com/', '');
    nuevoValor = nuevoValor.replaceAll('mobile.twitter.com/', '');
    nuevoValor = nuevoValor.replaceAll('twitter.com/', '');
    nuevoValor = nuevoValor.replaceAll('instagram.com/', '');
    nuevoValor = nuevoValor.replaceAll('+549', '');
    return nuevoValor;
  }

  String amigable(String elemento) {
    String variable = quitarAcentos(elemento.toLowerCase());
    variable = variable.replaceAll(' ', '_');
    return variable;
  }

  String superAmigable(String elemento) {
    String variable = quitarAcentos(elemento.toLowerCase());
    variable = variable.replaceAll('   ', '-');
    variable = variable.replaceAll('  ', '-');
    variable = variable.replaceAll(' ', '-');
    variable = variable.replaceAll('.', '');
    variable = variable.replaceAll("'", '');
    variable = variable.replaceAll('"', '');
    variable = variable.replaceAll('+', '');
    variable = variable.replaceAll('(', '');
    variable = variable.replaceAll(')', '');
    variable = variable.replaceAll('@', '');
    variable = variable.replaceAll('#', '');
    variable = variable.replaceAll('\$', '');
    variable = variable.replaceAll('%', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('&', '');
    variable = variable.replaceAll('*', '');
    variable = variable.replaceAll('!', '');
    variable = variable.replaceAll('=', '');
    variable = variable.replaceAll('_', '-');
    variable = variable.replaceAll('?', '');
    variable = variable.replaceAll('/', '');
    variable = variable.replaceAll('¡', '');
    variable = variable.replaceAll('`', '');
    variable = variable.replaceAll('^', '');
    variable = variable.replaceAll('´', '');
    variable = variable.replaceAll('¨', '');
    variable = variable.replaceAll('¿', '');
    variable = variable.replaceAll('•', '');

    return variable;
  }

  TimeOfDay stringTotimeOfDay(String time) {
    var splitTime = time.split(':');
    String hourStr = splitTime[0].trim();
    String minuteStr = splitTime[1].trim();

    int hour = int.parse(hourStr);
    int minute = int.parse(minuteStr);

    return TimeOfDay(hour: hour, minute: minute);
  }

  String timeOfDayToString(TimeOfDay time) {
    String hourStr = twoDigitsNumber(time.hour.toString());
    String minuteStr = twoDigitsNumber(time.minute.toString());

    return "$hourStr:$minuteStr";
  }

  String twoDigitsNumber(String numberStr) {
    if (numberStr.length == 1) {
      return '0$numberStr';
    }
    return numberStr;
  }

  String adaptarColorString(color) {
    return "0xff$color";
  }

  Color transformarStringColor(color) {
    var myInt = int.parse(color);
    Color transformado = Color(myInt).withOpacity(1.0);
    return transformado;
  }

  static String dateName(fecha) {
    var diaSemana = fecha.weekday;
    var mes = fecha.month;
    var dia = fecha.day;
    var ano = fecha.year;

    var nombreMes = "";
    var nombreDia = "";

    switch (diaSemana) {
      case 1:
        nombreDia = "Lunes";
        break;
      case 2:
        nombreDia = "Martes";
        break;
      case 3:
        nombreDia = "Miércoles";
        break;
      case 4:
        nombreDia = "Jueves";
        break;
      case 5:
        nombreDia = "Viernes";
        break;
      case 6:
        nombreDia = "Sábado";
        break;
      case 7:
        nombreDia = "Domingo";
        break;
    }
    switch (mes) {
      case 1:
        nombreMes = "Enero";
        break;
      case 2:
        nombreMes = "Febrero";
        break;
      case 3:
        nombreMes = "Marzo";
        break;
      case 4:
        nombreMes = "Abril";
        break;
      case 5:
        nombreMes = "Mayo";
        break;
      case 6:
        nombreMes = "Junio";
        break;
      case 7:
        nombreMes = "Julio";
        break;
      case 8:
        nombreMes = "Agosto";
        break;
      case 9:
        nombreMes = "Septiembre";
        break;
      case 10:
        nombreMes = "Octubre";
        break;
      case 11:
        nombreMes = "Noviembre";
        break;
      case 12:
        nombreMes = "Diciembre";
        break;
    }
    return nombreDia +
        " " +
        dia.toString() +
        " de " +
        nombreMes +
        " del " +
        ano.toString();
  }

  static String getHourOfDate(hora) {
    var horanueva = hora.toString();
    var nueva = horanueva.split(" ");
    var nueva2 = nueva[1].split(":");
    var nueva3 = nueva2[0] + ":" + nueva2[1];
    return nueva3.toString();
  }

  static String getDateHourName(fecha) {
    try {
      var _fecha = dateName(fecha);
      var _hora = getHourOfDate(fecha);

      return _fecha + " a las " + _hora;
    } catch (e) {
      return '';
    }
  }

  String getWhatsApp(String whatsapp) {
    var variable = whatsapp.replaceAll(RegExp("https://wa.me/57"), "");
    return variable.trim();
  }

  String toWhatsApp(String whatsapp) {
    return 'https://wa.me/57' + whatsapp.trim();
  }
}
