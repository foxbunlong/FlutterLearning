// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static m0(servingSize) => "*Baseado em uma porção de ${servingSize} ml.";

  static m1(quantity, formattedNumber) => "${Intl.plural(quantity, one: 'Uma porção.', other: '${formattedNumber} porções no seu sistema de uma vez.')}";

  static m2(quantity, formattedNumber) => "${Intl.plural(quantity, one: 'Uma porção por dia.', other: '${formattedNumber} porções por dia.')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "firstSuggestedDrinkName" : MessageLookupByLibrary.simpleMessage("Café Coado (Xícara)"),
    "formPageActionButtonTitle" : MessageLookupByLibrary.simpleMessage("CALCULAR"),
    "formPageAppBarTitle" : MessageLookupByLibrary.simpleMessage("Calculadora de Morte por Cafeína"),
    "formPageCustomDrinkCaffeineAmountInputLabel" : MessageLookupByLibrary.simpleMessage("Cafeína"),
    "formPageCustomDrinkCaffeineAmountInputSuffix" : MessageLookupByLibrary.simpleMessage("mg"),
    "formPageCustomDrinkRadioTitle" : MessageLookupByLibrary.simpleMessage("Outra"),
    "formPageCustomDrinkServingSizeInputLabel" : MessageLookupByLibrary.simpleMessage("Tamanho"),
    "formPageCustomDrinkServingSizeInputSuffix" : MessageLookupByLibrary.simpleMessage("ml"),
    "formPageRadioListLabel" : MessageLookupByLibrary.simpleMessage("Escolha uma bebida"),
    "formPageWeightInputLabel" : MessageLookupByLibrary.simpleMessage("Peso Corporal"),
    "formPageWeightInputSuffix" : MessageLookupByLibrary.simpleMessage("quilos"),
    "resultsPageAppBarTitle" : MessageLookupByLibrary.simpleMessage("Dosagens"),
    "resultsPageFirstDisclaimer" : m0,
    "resultsPageLethalDosageMessage" : m1,
    "resultsPageLethalDosageTitle" : MessageLookupByLibrary.simpleMessage("Dose Letal"),
    "resultsPageSafeDosageMessage" : m2,
    "resultsPageSafeDosageTitle" : MessageLookupByLibrary.simpleMessage("Limite Seguro Diário"),
    "resultsPageSecondDisclaimer" : MessageLookupByLibrary.simpleMessage("*Se aplica a pessoas com 18 anos ou mais. Essa calculadora não substitui conselhos médicos profissionais."),
    "secondSuggestedDrinkName" : MessageLookupByLibrary.simpleMessage("Espresso (Shot)"),
    "thirdSuggestedDrinkName" : MessageLookupByLibrary.simpleMessage("Pingado (Copo Americano)")
  };
}
