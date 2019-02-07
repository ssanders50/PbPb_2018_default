#ifndef SPEC
#define SPEC
#ifndef INFILE
#define INFILE
string infile = "data.root";
#endif
#ifndef EFFFILE
#define EFFFILE
#string efffile = "eff.root";
string efffile = "NULL";
#endif

#include "ptav.C"
#include "HiEvtPlaneList.h"
using namespace hi;
using namespace std;

TH1D *  spec(int mincent = 10, int maxcent = 15, double etamin = -0.8, double etamax = 0.8){
  TFile * fin = new TFile(infile.data());
  TFile * eff = 0;
  if(efffile.find("NULL") != std::string::npos) TFile * eff = new TFile(efffile.data());
  TH2D * ptcnt = (TH2D *) fin->Get(Form("vnanalyzer/Harmonics/%d_%d/ptcnt",mincent,maxcent));
  TH2D * spec = (TH2D *) ptcnt->Clone(Form("spec_%d_%d",mincent,maxcent));
  TH1D * ptav1 = ptav(mincent,maxcent,etamin,etamax);
  spec->SetDirectory(0);
  double avcent = (mincent+maxcent)/2.;
  TH2D * heff =0;
  if(eff!=0) {
    if(avcent<5) {
      heff = (TH2D *) eff->Get("Eff_0_5");
    } else if (avcent<10) {
      heff = (TH2D *) eff->Get("Eff_5_10");
    } else if (avcent<30) {
      heff = (TH2D *) eff->Get("Eff_10_30");
    } else if (avcent<50) {
      heff = (TH2D *) eff->Get("Eff_30_50");
    } else if (avcent<100) {
      heff = (TH2D *) eff->Get("Eff_50_100");
    }
  }
  int ietamin = spec->GetYaxis()->FindBin(etamin+0.01);
  int ietamax = spec->GetYaxis()->FindBin(etamax-0.01);
  for(int i = 1; i<=spec->GetNbinsX(); i++) {
    double ptval = ptav1->GetBinContent(i);
    double dpt = spec->GetXaxis()->GetBinWidth(i);
    for(int j = ietamin; j<=ietamax; j++) {
      double etaval = spec->GetYaxis()->GetBinCenter(j);
      double etaspecmin = spec->GetYaxis()->GetBinLowEdge(j);
      double etaspecmax = etaspecmin+spec->GetYaxis()->GetBinWidth(j);
      double deta = spec->GetYaxis()->GetBinWidth(j)*(ietamax+1-ietamin);
      if(eff!=0) {
	int effbinmin = heff->GetXaxis()->FindBin(etaspecmin+0.001);
	int effbinmax = heff->GetXaxis()->FindBin(etaspecmax-0.001);
	double effval = 0;
	for(int k = effbinmin; k<=effbinmax; k++) {
	  effval  += heff->GetBinContent(k,heff->GetYaxis()->FindBin(ptval));
	}
	effval/=(effbinmax-effbinmin+1);
	if(effval==0) {
	  spec->SetBinContent(i,j,0);
	  continue;
	}
      } else {
	effval = 1.;
      }
      dpt = 1;
      deta = 1;
      double y = spec->GetBinContent(i,j);
      spec->SetBinContent(i,j,spec->GetBinContent(i,j)/effval/dpt/deta);
    }
  }
  TH1D * spec1d = (TH1D *) spec->ProjectionX(Form("spec1d_%d_%d_%4.1f_%4.1f",mincent,maxcent,etamin,etamax),ietamin,ietamax);
  spec1d->SetMarkerStyle(20);
  spec1d->SetMarkerColor(kBlue);
  spec1d->SetLineColor(kBlue);
  fin->Close();
  return spec1d;

}

#endif
