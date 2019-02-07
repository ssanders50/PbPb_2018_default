#ifndef DEBUG
#define DEBUG
bool debug = true;
#endif
#include "HiEvtPlaneList.h"
#include "qAB.C"
#include "qn.C"
#include "ptav.C"
#include "spec.C"

using namespace hi;
using namespace std;

TGraphErrors * qnint(string anal="N2", string side="+",  int mincent = 30, int maxcent = 35, bool threesub = true, bool decor = false) {
  cout<<"qnint anal: "<<anal<<endl;
  double x[12];
  double y[12];
  double ey[12];
  TH1D * vnpt;
  TH1D * yld;
  TH1D * pt;
  TGraphErrors * g = new TGraphErrors(12,x,y,0,0);
  int decorOff = 0;
  for(int i = 0; i<12; i++) {

    if(decor) decorOff = i;
    double etamin = 2.0 - i*0.4;
    if(side.substr(0,1).find("+")==std::string::npos) {
      etamin = -2.4 + i*0.4;
    }
    double etamax = etamin + 0.4;
    double eta    = etamin + 0.2;
    vnpt = qn(anal,side,mincent,maxcent,etamin,etamax,threesub,decor,decorOff);
    yld = spec(mincent,maxcent,etamin,etamax);
    pt = ptav(mincent,maxcent,etamin,etamax);
    g->GetX()[i] = eta;
    int j = 1;
    double vint = 0;
    double w = 0;
    double e = 0;
    while(pt->GetBinContent(j)>=0.3 && pt->GetBinContent(j)< 3.0) {
      vint += vnpt->GetBinContent(j)*yld->GetBinContent(j);
      w    += yld->GetBinContent(j);
      e+=pow(yld->GetBinContent(j)*vnpt->GetBinError(j),2);
      ++j;
    }
    g->GetY()[i] = vint/w;
    g->GetEY()[i] = sqrt(e)/w;
    g->SetMarkerStyle(20);
    g->SetMarkerColor(kBlue);
    g->SetLineColor(kBlue);
    g->SetName(Form("g_%s_%s_%d_%d",anal.data(),side.data(),mincent,maxcent));
    vnpt->Delete();
    yld->Delete();
    pt->Delete();
  }
  return g;
}
