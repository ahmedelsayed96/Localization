import 'dart:async';
import 'package:localization/localization/app_localizations.dart';
import 'package:localization/repository/lang_reposirory.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


import 'lang_event.dart';
import 'lang_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial());
  String lang='ar';

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is AppStart) {
      LanguageLoading();
        String result = await LanguageRepository.hasLang();
        lang = result??'ar';
        AppTranslate.init(lang);
      yield LanguagChanged(language: lang);

    } else if (event is ChangeLanguage) {
      LanguageLoading();
      lang = event.lang;
      AppTranslate.init(lang);
      await LanguageRepository.saveLang(lang);
      yield LanguagChanged(language: event.lang);
    }
  }


}
