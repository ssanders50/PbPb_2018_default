#include "newcode/qn.C"
void v2Compare(int minCent = 15, int maxCent = 20){
  infile = "../MH.root";
  string efffile = "NULL";
  graph = false;
  TH1D * gnew = (TH1D *) qn("N2","+",minCent,maxCent)->Clone("gnew");
  TH1D * frame = new TH1D("frame","frame",100,0,10);
  frame->SetMinimum(0.0);
  frame->SetMaximum(0.3);
  frame->SetXTitle("p_{T} (GeV/c)");
  frame->SetYTitle("v_{2}");
  frame->Draw();
  TLatex * rng = new TLatex(8.,0.26,Form("%d - %d%c",minCent,maxCent,'%'));
  rng->Draw();
  gnew->Draw("same");
  infile = "~/PbPb_2015/MH/MH.root";
  efffile = "~/PbPb_2015/MH/macros/EffAndFake/PbPb/EffCorrectionsPixelPbPb_tight.root";
  TH1D * gold = qn("N2","+",minCent,maxCent);
  gold->SetMarkerColor(kRed);
  gold->Draw("same");

}
