import 'package:datawiz/Models/CovidModels/CovidOutlierModel.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';

void GetAllData(){

  CovidOutliersListA.clear();
  CovidOutliersListD.clear();
  CovidOutliersListR.clear();
  CovidOutliersListC.clear();
  CovidOutliersListTD.clear();
  CovidOutliersListTR.clear();
  CovidOutliersListTC.clear();

  for(int i=0;i<StatesCovidDataList.length;i++){
    CovidOutliersListA.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("A", i)));
    CovidOutliersListD.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("D", i)));
    CovidOutliersListR.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("R", i)));
    CovidOutliersListC.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("C", i)));
    CovidOutliersListTC.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("TC", i)));
    CovidOutliersListTD.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("TD", i)));
    CovidOutliersListTR.add(CovidOutlierModel(StatesCovidDataList[i].State, GetTheRightScore("TR", i)));
  }

  CovidOutliersListA.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListD.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListR.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListC.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListTC.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListTD.sort((a,b){return a.score.compareTo(b.score);});
  CovidOutliersListTR.sort((a,b){return a.score.compareTo(b.score);});

  CovidOutliersListA[0].median = CovidOutliersListA[18].score.toDouble();
  CovidOutliersListD[0].median = CovidOutliersListD[18].score.toDouble();
  CovidOutliersListR[0].median = CovidOutliersListR[18].score.toDouble();
  CovidOutliersListC[0].median = CovidOutliersListC[18].score.toDouble();
  CovidOutliersListTC[0].median = CovidOutliersListTC[18].score.toDouble();
  CovidOutliersListTD[0].median = CovidOutliersListTD[18].score.toDouble();
  CovidOutliersListTR[0].median = CovidOutliersListTR[18].score.toDouble();

  GetBound(CovidOutliersListA);
  GetBound(CovidOutliersListD);
  GetBound(CovidOutliersListR);
  GetBound(CovidOutliersListC);
  GetBound(CovidOutliersListTC);
  GetBound(CovidOutliersListTD);
  GetBound(CovidOutliersListTR);

}



int GetTheRightScore(String text, int index){
  switch (text){
    case "A":
      return StatesCovidDataList[index].Active;
      break;
    case "D":
      return StatesCovidDataList[index].Deaths;
      break;
    case "R":
      return StatesCovidDataList[index].Recovered;
      break;
    case "C":
      return StatesCovidDataList[index].Confirmed;
      break;
    case "TR":
      return StatesCovidDataList[index].TodayRecovered;
      break;
    case "TD":
      return StatesCovidDataList[index].TodayDeaths;
      break;
    case "TC":
      return StatesCovidDataList[index].TodayConfirmed;
      break;
    default:
      return StatesCovidDataList[index].Active;
      break;
  }

}

void GetBound(List<CovidOutlierModel> ThisList){
  double l = (ThisList[3].score + ThisList[4].score)/2;
  double r = (ThisList[12].score + ThisList[13].score)/2;
  double diff = r-l;
  ThisList[0].lowerbound = ThisList[0].median - 1.5*diff;
  ThisList[0].upperbound = ThisList[0].median + 1.5*diff;
  print(ThisList[0].upperbound);
  print(ThisList[0].lowerbound);
}