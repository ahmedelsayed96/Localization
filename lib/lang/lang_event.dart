import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class LanguageEvent extends Equatable {
  LanguageEvent() ;
  List get props => [];
}
class AppStart extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
 final String  lang;

 ChangeLanguage({
   @required this.lang
  }) ;
  @override
  // TODO: implement props
  List get props => [lang];

  @override
  String toString() =>
      'LanguageButtonPressed   ';
}
