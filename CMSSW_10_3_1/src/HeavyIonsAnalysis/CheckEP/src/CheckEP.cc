// -*- C++ -*-
//
// Package:    CheckEP
// Class:      CheckEP
// 
// system include files
#include <memory>
#include <algorithm>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDAnalyzer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "Math/Vector3D.h"

#include "DataFormats/Common/interface/Handle.h"
#include "FWCore/Framework/interface/ESHandle.h"

#include "DataFormats/HeavyIonEvent/interface/Centrality.h"
#include "DataFormats/HeavyIonEvent/interface/EvtPlane.h"
#include "DataFormats/VertexReco/interface/Vertex.h"
#include "DataFormats/VertexReco/interface/VertexFwd.h"

#include "FWCore/ServiceRegistry/interface/Service.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"
#include "CondFormats/DataRecord/interface/HeavyIonRPRcd.h"
#include "CondFormats/DataRecord/interface/HeavyIonRcd.h"
#include "CondFormats/HIObjects/interface/CentralityTable.h"
#include "CondFormats/HIObjects/interface/RPFlatParams.h"
#include "DataFormats/RecoCandidate/interface/RecoChargedCandidate.h"
#include "DataFormats/RecoCandidate/interface/RecoChargedCandidateFwd.h"
#include "HeavyIonsAnalysis/VNAnalysis/interface/TrackEfficiency.h"

#include "TROOT.h"
#include "TFile.h"
#include "TH1.h"
#include "TH2D.h"
#include "TH2F.h"
#include "TTree.h"
#include "TH1I.h"
#include "TF1.h"
#include "TMath.h"
#include <cstdlib>
	
#include <vector>
using std::vector;
using namespace std;

// These include files are needed to define the event planes and load the recentering/flattening db
#include "RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneFlatten.h"
#include "RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneList.h"
#include "RecoHI/HiEvtPlaneAlgos/interface/LoadEPDB.h"
using namespace hi;
using namespace edm;

//
// class declaration
//

class CheckEP : public edm::EDAnalyzer {
public:
  explicit CheckEP(const edm::ParameterSet&);
  ~CheckEP();
  
private:
  virtual void beginJob() ;
  virtual void analyze(const edm::Event&, const edm::EventSetup&);
  virtual void endJob() ;
  // ----------member data ---------------------------
  std::string centralityVariable_;
  std::string centralityLabel_;
  std::string centralityMC_;
  std::string selectedEP;
  edm::InputTag centralityBinTag_;
  edm::EDGetTokenT<int> centralityBinToken;
  edm::Handle<int> cbin_;
  edm::EDGetTokenT<int> tag_;
  
  edm::InputTag RPTag_;
  edm::EDGetTokenT<double> RPToken;
  edm::Handle<double> RP_;
  double rp;
  
  edm::InputTag centralityTag_;
  edm::EDGetTokenT<reco::Centrality> centralityToken;
  edm::Handle<reco::Centrality> centrality_;
  
  edm::InputTag vertexTag_;
  edm::EDGetTokenT<std::vector<reco::Vertex>> vertexToken;
  edm::Handle<std::vector<reco::Vertex>> vertex_;
  
  edm::InputTag trackTag_;
  edm::EDGetTokenT<reco::TrackCollection> trackToken;
  edm::Handle<reco::TrackCollection> trackCollection_;
  
  edm::InputTag inputPlanesTag_;
  edm::EDGetTokenT<reco::EvtPlaneCollection> inputPlanesToken;
  edm::Handle<reco::EvtPlaneCollection> inputPlanes_;
  
  edm::Service<TFileService> fs;
  
  int vs_sell;   // vertex collection size
  double centval;
  int nCentBins_;
  double vtx;
  
  Double_t epang[NumEPNames];
  Double_t eporig[NumEPNames];
  Double_t epsin[NumEPNames];
  Double_t epcos[NumEPNames];
  
  Double_t qx[NumEPNames];
  Double_t qy[NumEPNames];
  Double_t q[NumEPNames];
  Double_t epmult[NumEPNames];
  Double_t sumw[NumEPNames];
  Double_t sumw2[NumEPNames];
  Double_t vn[NumEPNames];
  
  Double_t rescor[NumEPNames];
  Double_t rescorErr[NumEPNames];
  TH1D * hPsi[NumEPNames];
  TH1D * hPsiOffset[NumEPNames];
  TH1D * hPsiFlat[NumEPNames];
  
  unsigned int runno_;
  
  int nEtaBins;
  string rpnames[NumEPNames];
  string effTable_;
  int FlatOrder_;
  int NumFlatBins_;
  int CentBinCompression_;
  int flatnvtxbins_;
  double flatminvtx_;
  double flatdelvtx_;
  
  HiEvtPlaneFlatten * flat[NumEPNames];
  bool loadDB_;
  bool FirstEvent_;
  
  
}; 

//
// constructors and destructor
//
CheckEP::CheckEP(const edm::ParameterSet& iConfig):runno_(0)  
{
  runno_ = 0;
  loadDB_ = kTRUE;
  FirstEvent_ = kTRUE;
  for(int i = 0; i<NumEPNames; i++) {
    epang[i] = -10;
    eporig[i] = -10;
    epsin[i] = 0;
    epcos[i] = 0;
    qx[i] = 0;
    qy[i] = 0;
    q[i] = 0;
    epmult[i] = 0;
    rescor[i] = 0;
    rescorErr[i] = 0;
  }
  selectedEP = iConfig.getParameter<std::string>("EP_");

  centralityVariable_ = iConfig.getParameter<std::string>("centralityVariable");
  if(iConfig.exists("nonDefaultGlauberModel")){
    centralityMC_ = iConfig.getParameter<std::string>("nonDefaultGlauberModel");
  }
  centralityLabel_ = centralityVariable_+centralityMC_;
  
  centralityBinTag_ = iConfig.getParameter<edm::InputTag>("centralityBinTag_");
  centralityBinToken = consumes<int>(centralityBinTag_);
  
  centralityTag_ = iConfig.getParameter<edm::InputTag>("centralityTag_");
  centralityToken = consumes<reco::Centrality>(centralityTag_);
  if(centralityToken.isUninitialized()) {
    std::cout<<"centralityToken is uninitialized."<<std::endl;
  }
  vertexTag_  = iConfig.getParameter<edm::InputTag>("vertexTag_");
  vertexToken = consumes<std::vector<reco::Vertex>>(vertexTag_);
  if(vertexToken.isUninitialized()) {
    std::cout<<"vertexToken is uninitialized."<<std::endl;
  }
  
  inputPlanesTag_ = iConfig.getParameter<edm::InputTag>("inputPlanesTag_");
  inputPlanesToken = consumes<reco::EvtPlaneCollection>(inputPlanesTag_);
  if(inputPlanesToken.isUninitialized()) {
    std::cout<<"inputPlanesToken is uninitialized."<<std::endl;
  }
  
  FlatOrder_ = iConfig.getUntrackedParameter<int>("FlatOrder_", 9);
  NumFlatBins_ = iConfig.getUntrackedParameter<int>("NumFlatBins_",20);
  CentBinCompression_ = iConfig.getUntrackedParameter<int>("CentBinCompression_",5);
  flatnvtxbins_ = iConfig.getParameter<int>("flatnvtxbins") ;
  flatminvtx_ = iConfig.getParameter<double>("flatminvtx") ;
  flatdelvtx_ = iConfig.getParameter<double>("flatdelvtx") ;
  

  for(int i = 0; i<NumEPNames; i++) {
    flat[i] = new HiEvtPlaneFlatten();
    flat[i]->init(FlatOrder_,NumFlatBins_,EPNames[i],EPOrder[i]);
    if(selectedEP.find("ALL")!=std::string::npos || selectedEP.find(EPNames[i].data())!=std::string::npos) { 
      TFileDirectory subdir = fs->mkdir(Form("%s",EPNames[i].data()));
      Double_t psirange = 4;
      if(EPOrder[i]==1 ) psirange = 3.5;
      if(EPOrder[i]==2 ) psirange = 2;
      if(EPOrder[i]==3 ) psirange = 1.5;
      if(EPOrder[i]==4 ) psirange = 1;
      if(EPOrder[i]==5) psirange = 0.8;
      if(EPOrder[i]==6) psirange = 0.6;
      if(EPOrder[i]==7) psirange = 0.5;
      
      hPsi[i] = subdir.make<TH1D>("psi","psi",800,-psirange,psirange);
      hPsi[i]->SetXTitle("#Psi");
      hPsi[i]->SetYTitle(Form("Counts (cent<80%c)",'%'));
      
      hPsiOffset[i] = subdir.make<TH1D>("psiOffset","psiOffset",800,-psirange,psirange);
      hPsiOffset[i]->SetXTitle("#Psi");
      hPsiOffset[i]->SetYTitle(Form("Counts (cent<80%c)",'%'));
      
      
      hPsiFlat[i] = subdir.make<TH1D>("psiFlat","psiFlat",800,-psirange,psirange);
      hPsiFlat[i]->SetXTitle("#Psi");
      hPsiFlat[i]->SetYTitle(Form("Counts (cent<80%c)",'%'));
    }
    
  }
}


CheckEP::~CheckEP()
{
  // do anything here that needs to be done at desctruction time
  // (e.g. close files, deallocate resources etc.)
}


//
// member functions
//

// ------------ method called to for each event  ------------
void
CheckEP::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
  using namespace edm;
  using namespace std;
  using namespace reco;
  Bool_t newrun = kFALSE;
  if(runno_ != iEvent.id().run()) newrun = kTRUE;
  runno_ = iEvent.id().run();
  if(FirstEvent_ || newrun) {
    FirstEvent_ = kFALSE;
    newrun = kFALSE;
    //
    //Get Size of Centrality Table
    //
    nCentBins_ = 200;
    
    edm::ESHandle<CentralityTable> centDB_;
    iSetup.get<HeavyIonRcd>().get(centralityLabel_,centDB_);
    nCentBins_ = (int) centDB_->m_table.size();
    for(int i = 0; i<NumEPNames; i++) {
      flat[i]->setCaloCentRefBins(-1,-1);
    }
    //
    // Get flattening parameter file.  
    //
    
    edm::ESHandle<RPFlatParams> flatparmsDB_;
    iSetup.get<HeavyIonRPRcd>().get(flatparmsDB_);
    LoadEPDB * db = new LoadEPDB(flatparmsDB_,flat);
    if(!db->IsSuccess()) {
      std::cout<<"Flattening db inconsistancy, will continue without: "<<std::endl;
      loadDB_ = kFALSE;
    }        
    
  } //First event
  //
  // Get Centrality
  //

  int cbin = 0;
  iEvent.getByToken(centralityBinToken, cbin_);
  cbin = *cbin_;
  double cscale = 100./nCentBins_;
  centval = cscale*cbin;
  //
  // Get Event Planes
  //
  iEvent.getByToken(inputPlanesToken,inputPlanes_);
  
  if(!inputPlanes_.isValid()){
    cout << "Error! Can't get hiEvtPlaneFlat product!" << endl;
    return ;
  }
  
  Int_t indx = 0;
  for(int i = 0; i<NumEPNames; i++) {
    epang[i] = -10;
    epsin[i] = 0;
    epcos[i] = 0;
    qx[i] = 0;
    qy[i] = 0;
    q[i] = 0;
    vn[i] = 0;
    epmult[i] = 0;
    sumw[i] = 0;
    sumw2[i] = 0;
  }
  for (EvtPlaneCollection::const_iterator rp = inputPlanes_->begin();rp !=inputPlanes_->end(); rp++) {
    if(indx != rp->indx() ) {
      cout<<"EP inconsistency found. Abort."<<endl;
      return;
    }
    if(rp->sumSin()!=0 || rp->sumCos()!=0) {
      if(selectedEP.find("ALL")!=std::string::npos || selectedEP.find(EPNames[indx].data())!=std::string::npos) { 
	if(rp->mult()>3 && fabs(vtx)<15) {
	  epang[indx]=rp->angle();
	  eporig[indx]=rp->angle(0);
	  epsin[indx] = rp->sumSin();
	  epcos[indx] = rp->sumCos();
	  hPsi[indx]->Fill(rp->angle(0));
	  hPsiOffset[indx]->Fill(rp->angle(1));
	  hPsiFlat[indx]->Fill(rp->angle(2));
	  qx[indx]  = rp->qx(); 
	  qy[indx]  = rp->qy();
	  q[indx]   = rp->q();
	  vn[indx] = rp->vn(0);
	  epmult[indx] = (double) rp->mult();
	  sumw[indx] = rp->sumw();
	  sumw2[indx] = rp->sumw2();
	  rescor[indx] = flat[indx]->getCentRes1((int) centval);
	  rescorErr[indx] = flat[indx]->getCentResErr1((int) centval);
	} 
      }
    }
    ++indx; 
  }
}



// ------------ method called once each job just before starting event loop  ------------
void 
CheckEP::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void 
CheckEP::endJob() {
}

//define this as a plug-in
DEFINE_FWK_MODULE(CheckEP);

