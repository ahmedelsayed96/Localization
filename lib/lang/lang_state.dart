import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LanguageState extends Equatable {
  LanguageState();

  List get props => [];
}

class LanguageInitial extends LanguageState {
  @override
  String toString() => 'LanguageInitial';
}

class LanguageLoading extends LanguageState {}

class LanguagChanged extends LanguageState {
 String  language ;
 LanguagChanged({@required this.language});


 List get props => [language];
}



class LanguageFailure extends LanguageState {
  final String error;

  LanguageFailure({@required this.error});

  List get props => [error];

  @override
  String toString() => 'LanguageFailure { error: $error }';
}
