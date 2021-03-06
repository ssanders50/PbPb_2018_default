void ResCompare2(string epname="HFm2"){
  //TGraphErrors * rin = new TGraphErrors(Form("/home/sanders/PbPb_2018/MoveFlatParamsToDB/RescorSave/RescorTables_PbPb2018_1_600000/%s_1.dat",epname.data()),"%lg%lg%lg%lf");
    TGraphErrors * rin = new TGraphErrors(Form("/home/sanders/PbPb_2018_default/MoveFlatParamsToDB/RescorSave/RescorTables_default/%s_1.dat",epname.data()),"%lg%lg%lg%lf");
  TGraphErrors * rino = new TGraphErrors(Form("/home/sanders/PbPb_2018_default/MoveFlatParamsToDB/RescorSave/RescorTables_EtGt02GeV/%s_1.dat",epname.data()),"%lg%lg%lg%lf");
  double x[200];
  double y[200];
  double ey[200];
  for(int i = 0; i<rin->GetN(); i++) {
    x[i] = (rin->GetX()[i]+rin->GetY()[i])/2.;
    y[i] = rin->GetEX()[i];
    ey[i] = rin->GetEY()[i];
  }
  TGraphErrors * rnew = new TGraphErrors(rin->GetN(), x,y,0,ey);
  rnew->SetMarkerStyle(20);
  rnew->SetLineColor(kBlue);
  rnew->SetMarkerColor(kBlue);

  for(int i = 0; i<rino->GetN(); i++) {
    x[i] = (rino->GetX()[i]+rino->GetY()[i])/2.;
    y[i] = rino->GetEX()[i];
    ey[i] = rino->GetEY()[i];
  }
  TGraphErrors * rold = new TGraphErrors(rino->GetN(), x,y,0,ey);
  rold->SetMarkerStyle(25);
  rold->SetLineColor(kGreen);
  rold->SetMarkerColor(kGreen);
  TH1D * h = new TH1D("h","h",201,0,100);
  h->SetMinimum(0);
  h->SetMaximum(1);
  h->SetXTitle("Centrality");
  h->SetYTitle("Resolution Correction Factor");
  h->Draw();
  rnew->Draw("p");
  rold->Draw("p");
  TLatex * title = new TLatex(70,0.9,epname.data());
  title->Draw();

}
