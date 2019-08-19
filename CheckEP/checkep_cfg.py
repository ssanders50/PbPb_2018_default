import FWCore.ParameterSet.Config as cms
import FWCore.ParameterSet.VarParsing as VarParsing
import os
import sys
ivars = VarParsing.VarParsing('standard')

ivars.register ('lumifile',
                'Cert_326381-327564_HI_PromptReco_Collisions18_JSON.txt',
                mult=ivars.multiplicity.singleton,
                mytype=ivars.varType.string,
                info="lumi file")


ivars.register ('dbfile',
                'HeavyIonRPRcd_PbPb2018_offline.db',
                mult=ivars.multiplicity.singleton,
                mytype=ivars.varType.string,
                info="dbfile file")


ivars.parseArguments()

process = cms.Process("check")

process.load("FWCore.MessageService.MessageLogger_cfi")
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')
process.load('Configuration.EventContent.EventContentHeavyIons_cff')
process.load("RecoHI.HiEvtPlaneAlgos.HiEvtPlane_cfi")
process.load("RecoHI.HiEvtPlaneAlgos.hiEvtPlaneFlat_cfi")
process.load("HeavyIonsAnalysis.HiEvtPlaneCalib.checkflattening_cfi")
process.load("RecoHI.HiCentralityAlgos.CentralityBin_cfi")
process.load("CondCore.CondDB.CondDB_cfi")
process.load("HeavyIonsAnalysis.EventAnalysis.clusterCompatibilityFilter_cfi")
process.load("HeavyIonsAnalysis.Configuration.hfCoincFilter_cff")
process.load("HeavyIonsAnalysis.Configuration.analysisFilters_cff")
process.load("HeavyIonsAnalysis.Configuration.collisionEventSelection_cff")

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '103X_dataRun2_Prompt_v2', '')
process.GlobalTag.snapshotTime = cms.string("9999-12-31 23:59:59.000")
process.GlobalTag.toGet.extend([
    cms.PSet(record = cms.string("HeavyIonRcd"), 
        tag = cms.string("CentralityTable_HFtowers200_DataPbPb_periHYDJETshape_run2v1033p1x01_offline"),
        connect = cms.string("frontier://FrontierProd/CMS_CONDITIONS"),
        label = cms.untracked.string("HFtowers")
        ),
    ])
process.load('RecoHI.HiCentralityAlgos.HiCentrality_cfi')
process.hiCentrality.produceHFhits = False
process.hiCentrality.produceHFtowers = False
process.hiCentrality.produceEcalhits = False
process.hiCentrality.produceZDChits = False
process.hiCentrality.produceETmidRapidity = False
process.hiCentrality.producePixelhits = False
process.hiCentrality.produceTracks = False
process.hiCentrality.producePixelTracks = False
process.hiCentrality.reUseCentrality = True
process.hiCentrality.srcReUse = cms.InputTag("hiCentrality","","RECO")
process.hiCentrality.srcTracks = cms.InputTag("generalTracks")
process.hiCentrality.srcVertex = cms.InputTag("offlinePrimaryVertices")

process.load("RecoHI.HiCentralityAlgos.CentralityBin_cfi")
process.centralityBin.Centrality = cms.InputTag("hiCentrality")
process.centralityBin.centralityVariable = cms.string("HFtowers")
process.centralityBin.nonDefaultGlauberModel = cms.string("")



process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(-1) )
process.MessageLogger.cerr.FwkReport.reportEvery=1000

process.CondDB.connect = "sqlite_file:"+ivars.dbfile
process.PoolDBESSource = cms.ESSource("PoolDBESSource",
                                       process.CondDB,
                                       toGet = cms.VPSet(cms.PSet(record = cms.string('HeavyIonRPRcd'),
#                                                                  tag = cms.string('HeavyIonRPRcd_PbPb2018_offline')
                                                                  tag = cms.string('HeavyIonRPRcd')
                                                                  )
                                                         )
                                      )
process.es_prefer_flatparms = cms.ESPrefer('PoolDBESSource','')


import FWCore.PythonUtilities.LumiList as LumiList
goodLumiSecs = LumiList.LumiList(filename = ivars.lumifile ).getCMSSWString().split(',')

#readFiles = cms.untracked.vstring()
#secFiles = cms.untracked.vstring() 
#process.source = cms.Source ("PoolSource",fileNames = cms.untracked.vstring(),
#                             inputCommands=cms.untracked.vstring(
#        'keep *',
#        'drop *_hiEvtPlane_*_*'
#        )
#)


process.source = cms.Source ("PoolSource",fileNames = cms.untracked.vstring(
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F873AB58-6232-974D-9CDB-3BFB1504B449.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F7C4BAFB-F443-6C4C-8FFF-B2C89EA3A776.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F6200B99-E688-8E47-8301-6FB2D0521021.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F40A87C5-494C-0248-BC2F-AB9442E1DDD6.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F3CF4F88-F926-224E-9B77-3BF0B3F084A6.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F31298D8-F6D5-E941-B9A0-DD76272B9AE0.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F23CAED0-68CB-EC46-8EEB-1EAACC9556A6.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F23AC73A-E593-6B4E-BA9D-15D55D6EC5FC.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F1C264FD-6BF9-294B-8619-8277686EA99A.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F0B44001-C3AA-D640-AAF1-B3417A46D83D.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/F04765AE-CF2A-9643-909D-A108C0025854.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EFBF111B-B428-FB44-B620-615A55E263C4.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EFA366C6-3F15-0149-B0F2-D456885C9BA7.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EE2C2C5B-43D5-BA44-A465-743A22570095.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/ED7B7372-79AB-BC4F-83A0-E5027732081E.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/ED1D69A8-BD38-F648-AA4F-B15F95D5EBCD.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/ED0E1364-EFA6-154D-B9C5-4F8A171926E3.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/ECAA8568-3828-E24B-97DD-886F9B800DFD.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EC5143AB-0831-FA4C-8919-3DDA127D4258.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EA3951F7-FE50-7545-947A-9577298DC61B.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/EA129831-A476-2841-888C-3B1ECDDEB7FB.root',
'root://cmsxrootd.fnal.gov//store/hidata/HIRun2018A/HIMinimumBias1/AOD/04Apr2019-v1/610007/E7B62111-338A-714F-B540-CED49C0C017F.root'),
                              inputCommands=cms.untracked.vstring(
                                 'keep *',
                                 'drop *_hiEvtPlane_*_*'
                             )
)

process.TFileService = cms.Service("TFileService",
    fileName = cms.string("check.root")
)

# MinBias trigger selection
#import HLTrigger.HLTfilters.hltHighLevel_cfi
#process.hltSelect = HLTrigger.HLTfilters.hltHighLevel_cfi.hltHighLevel.clone()
#process.hltSelect.HLTPaths = [
#        "HLT_HIMinimumBias_*",
#    ]
#process.hltSelect.andOr = cms.bool(True)
#process.hltSelect.throw = cms.bool(False)

# Event Selection
process.primaryVertexFilter.src = cms.InputTag("offlinePrimaryVertices")

process.dump = cms.EDAnalyzer("EventContentAnalyzer")

process.hiEvtPlane.trackTag = cms.InputTag("generalTracks")
process.hiEvtPlane.vertexTag = cms.InputTag("offlinePrimaryVertices")
process.hiEvtPlane.loadDB = cms.bool(True)
process.hiEvtPlane.useNtrk = cms.untracked.bool(False)
process.hiEvtPlane.caloCentRef = cms.double(-1)
process.hiEvtPlane.caloCentRefWidth = cms.double(-1)
process.hiEvtPlaneFlat.caloCentRef = cms.double(-1)
process.hiEvtPlaneFlat.caloCentRefWidth = cms.double(-1)
process.hiEvtPlaneFlat.vertexTag = cms.InputTag("offlinePrimaryVertices")
process.hiEvtPlaneFlat.useNtrk = cms.untracked.bool(False)
process.checkflattening.trackTag_ = cms.InputTag("generalTracks")
process.checkflattening.vertexTag_ = cms.InputTag("offlinePrimaryVertices")
process.p = cms.Path(process.collisionEventSelectionAODv2*process.centralityBin* process.hiEvtPlane * process.hiEvtPlaneFlat*process.checkflattening)
