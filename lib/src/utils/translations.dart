import 'package:my_trainer/src/utils/enums.dart';

class Translations {
  var language = Language.pt;

  Translations(this.language);

  String getMenuPageProgress() {
    switch(language) {
      case Language.pt:
        return "Progresso";
      case Language.en:
        return "Progress";
    }
  }

  String getMenuPageTraining() {
    switch(language) {
      case Language.pt:
        return "Treino";
      case Language.en:
        return "Training";
    }
  }

  String getMenuPageNutrition() {
    switch(language) {
      case Language.pt:
        return "Nutrição";
      case Language.en:
        return "Nutrition";
    }
  }

  String getMenuPageChallenges() {
    switch(language) {
      case Language.pt:
        return "Desafios";
      case Language.en:
        return "Challenges";
    }
  }

  String getMenuPageCalender() {
    switch(language) {
      case Language.pt:
        return "Calendário";
      case Language.en:
        return "Calender";
    }
  }

}