import FWCore.ParameterSet.Config as cms

CheckEP = cms.EDAnalyzer("CheckEP",
                            vertexTag_=cms.InputTag("hiSelectedVertex"),
                            centralityTag_=cms.InputTag("hiCentrality"),
                            inputPlanesTag_ = cms.InputTag("hiEvtPlaneFlat"),
                            centralityBinTag_ = cms.InputTag("centralityBin","HFtowers"),
                            centralityVariable = cms.string("HFtowers"),
                            nonDefaultGlauberModel = cms.string(""),
                            FlatOrder_ = cms.untracked.int32(9),
                            NumFlatBins_ = cms.untracked.int32(40),
                            flatnvtxbins = cms.int32(10),
                            flatminvtx = cms.double(-25.0),
                            flatdelvtx = cms.double(5.0),
                            nvtx_ = cms.untracked.int32(100),
                            minvz_ = cms.untracked.double(-15.),
                            maxvz_ = cms.untracked.double(15.),
                            EP_ = cms.string("ALL")
 )
