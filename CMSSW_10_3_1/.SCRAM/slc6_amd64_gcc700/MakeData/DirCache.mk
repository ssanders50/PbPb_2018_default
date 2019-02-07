ifeq ($(strip $(HeavyIonsAnalysis/HiEvtPlaneCalib)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_HiEvtPlaneCalib_src
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_parent := HeavyIonsAnalysis/HiEvtPlaneCalib
src_HeavyIonsAnalysis_HiEvtPlaneCalib_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,LIBRARY))
HeavyIonsAnalysisHiEvtPlaneCalib := self/HeavyIonsAnalysis/HiEvtPlaneCalib
HeavyIonsAnalysis/HiEvtPlaneCalib := HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_files := $(patsubst src/HeavyIonsAnalysis/HiEvtPlaneCalib/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisHiEvtPlaneCalib_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/HiEvtPlaneCalib/BuildFile
HeavyIonsAnalysisHiEvtPlaneCalib_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities PhysicsTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/WrappedStdDictionaries Geometry/Records DataFormats/HepMCCandidate DataFormats/TrackReco DataFormats/VertexReco DataFormats/Common DataFormats/HeavyIonEvent DataFormats/CaloTowers DataFormats/Provenance CondCore/DBOutputService CondFormats/DataRecord RecoHI/HiCentralityAlgos clhep
HeavyIonsAnalysisHiEvtPlaneCalib_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisHiEvtPlaneCalib,HeavyIonsAnalysisHiEvtPlaneCalib,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/HiEvtPlaneCalib/src))
HeavyIonsAnalysisHiEvtPlaneCalib_PACKAGE := self/src/HeavyIonsAnalysis/HiEvtPlaneCalib/src
ALL_PRODS += HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_CLASS := LIBRARY
HeavyIonsAnalysis/HiEvtPlaneCalib_forbigobj+=HeavyIonsAnalysisHiEvtPlaneCalib
HeavyIonsAnalysisHiEvtPlaneCalib_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisHiEvtPlaneCalib,src/HeavyIonsAnalysis/HiEvtPlaneCalib/src,src_HeavyIonsAnalysis_HiEvtPlaneCalib_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(HeavyIonsAnalysis/VNAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_VNAnalysis_src
src_HeavyIonsAnalysis_VNAnalysis_src_parent := HeavyIonsAnalysis/VNAnalysis
src_HeavyIonsAnalysis_VNAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_VNAnalysis_src,src/HeavyIonsAnalysis/VNAnalysis/src,LIBRARY))
HeavyIonsAnalysisVNAnalysis := self/HeavyIonsAnalysis/VNAnalysis
HeavyIonsAnalysis/VNAnalysis := HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_files := $(patsubst src/HeavyIonsAnalysis/VNAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/VNAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisVNAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/VNAnalysis/BuildFile
HeavyIonsAnalysisVNAnalysis_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities PhysicsTools/UtilAlgos PhysicsTools/JetMCUtils SimGeneral/HepPDTRecord SimDataFormats/CaloHit SimDataFormats/Track SimDataFormats/TrackingHit SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimDataFormats/CrossingFrame SimDataFormats/HiGenData DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/HeavyIonEvent CondFormats/HIObjects CondFormats/DataRecord DataFormats/WrappedStdDictionaries DataFormats/Common DataFormats/Provenance DataFormats/EgammaReco Geometry/Records RecoHI/HiCentralityAlgos root clhep
HeavyIonsAnalysisVNAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisVNAnalysis,HeavyIonsAnalysisVNAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/VNAnalysis/src))
HeavyIonsAnalysisVNAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/VNAnalysis/src
ALL_PRODS += HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/VNAnalysis_forbigobj+=HeavyIonsAnalysisVNAnalysis
HeavyIonsAnalysisVNAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisVNAnalysis,src/HeavyIonsAnalysis/VNAnalysis/src,src_HeavyIonsAnalysis_VNAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(HeavyIonsAnalysis/EventAnalysis)),)
ALL_COMMONRULES += src_HeavyIonsAnalysis_EventAnalysis_src
src_HeavyIonsAnalysis_EventAnalysis_src_parent := HeavyIonsAnalysis/EventAnalysis
src_HeavyIonsAnalysis_EventAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EventAnalysis_src,src/HeavyIonsAnalysis/EventAnalysis/src,LIBRARY))
HeavyIonsAnalysisEventAnalysis := self/HeavyIonsAnalysis/EventAnalysis
HeavyIonsAnalysis/EventAnalysis := HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_files := $(patsubst src/HeavyIonsAnalysis/EventAnalysis/src/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EventAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
HeavyIonsAnalysisEventAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/HeavyIonsAnalysis/EventAnalysis/BuildFile
HeavyIonsAnalysisEventAnalysis_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet CommonTools/UtilAlgos FWCore/ServiceRegistry DataFormats/HeavyIonEvent DataFormats/VertexReco RecoHI/HiCentralityAlgos DataFormats/HepMCCandidate DataFormats/JetReco DataFormats/Common SimDataFormats/HiGenData SimDataFormats/GeneratorProducts FWCore/Common DataFormats/HLTReco HLTrigger/HLTcore CondFormats/HLTObjects CondFormats/DataRecord
HeavyIonsAnalysisEventAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,HeavyIonsAnalysisEventAnalysis,HeavyIonsAnalysisEventAnalysis,$(SCRAMSTORENAME_LIB),src/HeavyIonsAnalysis/EventAnalysis/src))
HeavyIonsAnalysisEventAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/EventAnalysis/src
ALL_PRODS += HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_CLASS := LIBRARY
HeavyIonsAnalysis/EventAnalysis_forbigobj+=HeavyIonsAnalysisEventAnalysis
HeavyIonsAnalysisEventAnalysis_INIT_FUNC        += $$(eval $$(call Library,HeavyIonsAnalysisEventAnalysis,src/HeavyIonsAnalysis/EventAnalysis/src,src_HeavyIonsAnalysis_EventAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
