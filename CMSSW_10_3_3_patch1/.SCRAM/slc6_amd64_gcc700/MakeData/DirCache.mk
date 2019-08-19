ifeq ($(strip $(HeavyIonsAnalysis/HiEvtPlaneCalib)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_HiEvtPlaneCalib_src
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_parent := HeavyIonsAnalysis/HiEvtPlaneCalib
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,LIBRARY))
HeavyIonsAnalysisHiEvtPlaneCalib := self/HeavyIonsAnalysis/HiEvtPlaneCalib
HeavyIonsAnalysis/HiEvtPlaneCalib := HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_files := $(patsubst src/HeavyIonsAnalysis/HiEvtPlaneCalib/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisHiEvtPlaneCalib_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/HiEvtPlaneCalib/BuildFile
HeavyIonsAnalysisHiEvtPlaneCalib_LOC_USE := self cmssw root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities PhysicsTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/WrappedStdDictionaries Geometry/Records DataFormats/HepMCCandidate DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/HeavyIonEvent DataFormats/CaloTowers DataFormats/Provenance CondCore/DBOutputService CondFormats/DataRecord RecoHI/HiCentralityAlgos clhep
HeavyIonsAnalysisHiEvtPlaneCalib_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisHiEvtPlaneCalib,HeavyIonsAnalysisHiEvtPlaneCalib,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/HiEvtPlaneCalib/src))
HeavyIonsAnalysisHiEvtPlaneCalib_PACKAGE := self/src/HeavyIonsAnalysis/HiEvtPlaneCalib/src
ALL_PRODS += HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_CLASS := LIBRARY
HeavyIonsAnalysis/HiEvtPlaneCalib_forbigobj+=HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisHiEvtPlaneCalib,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(HeavyIonsAnalysis/EventAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_EventAnalysis_src
src_HeavyIonsAnalysis_EventAnalysis_src_parent := HeavyIonsAnalysis/EventAnalysis
src_HeavyIonsAnalysis_EventAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EventAnalysis_src,src/HeavyIonsAnalysis/EventAnalysis/src,LIBRARY))
HeavyIonsAnalysisEventAnalysis := self/HeavyIonsAnalysis/EventAnalysis
HeavyIonsAnalysis/EventAnalysis := HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_files := $(patsubst src/HeavyIonsAnalysis/EventAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EventAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisEventAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/EventAnalysis/BuildFile
HeavyIonsAnalysisEventAnalysis_LOC_USE := self cmssw FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CommonTools/UtilAlgos FWCore/ServiceRegistry DataFormats/HeavyIonEvent DataFormats/VertexReco RecoHI/HiCentralityAlgos DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/Common SimDataFormats/HiGenData SimDataFormats/GeneratorProducts FWCore/Common DataFormats/HLTReco HLTrigger/HLTcore CondFormats/HLTObjects CondFormats/DataRecord
HeavyIonsAnalysisEventAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisEventAnalysis,HeavyIonsAnalysisEventAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/EventAnalysis/src))
HeavyIonsAnalysisEventAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/EventAnalysis/src
ALL_PRODS += HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/EventAnalysis_forbigobj+=HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisEventAnalysis,src/HeavyIonsAnalysis/EventAnalysis/src,src_HeavyIonsAnalysis_EventAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
