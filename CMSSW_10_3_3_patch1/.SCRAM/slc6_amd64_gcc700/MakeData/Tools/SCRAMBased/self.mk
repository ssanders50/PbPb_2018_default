ifeq ($(strip $(RecoHI/HiMuonAlgos)),)
src_RecoHI_HiMuonAlgos := self/RecoHI/HiMuonAlgos
RecoHI/HiMuonAlgos  := src_RecoHI_HiMuonAlgos
src_RecoHI_HiMuonAlgos_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
src_RecoHI_HiMuonAlgos_EX_USE := $(foreach d, RecoTracker/TransientTrackingRecHit TrackingTools/TransientTrack clhep FWCore/Framework self DataFormats/VertexReco cmssw TrackingTools/TrackFitters DataFormats/L1GlobalMuonTrigger TrackingTools/MaterialEffects DataFormats/Math RecoVertex/KalmanVertexFit TrackingTools/PatternTools TrackingTools/KalmanUpdators MagneticField/Records RecoTracker/TkNavigation TrackingTools/MeasurementDet Geometry/TrackerGeometryBuilder RecoVertex/VertexPrimitives DataFormats/Common RecoTracker/MeasurementDet RecoTracker/CkfPattern Geometry/Records DataFormats/TrackReco TrackingTools/TrajectoryCleaning DataFormats/GsfTrackReco FWCore/ParameterSet MagneticField/Engine,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_RecoHI_HiMuonAlgos
endif

ifeq ($(strip $(RecoLocalTracker/SubCollectionProducers)),)
RecoLocalTrackerSubCollectionProducers := self/RecoLocalTracker/SubCollectionProducers
RecoLocalTracker/SubCollectionProducers := RecoLocalTrackerSubCollectionProducers
RecoLocalTrackerSubCollectionProducers_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoLocalTrackerSubCollectionProducers_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/ParameterSet DataFormats/TrackerRecHit2D DataFormats/TrackerCommon DataFormats/Common DataFormats/SiStripDigi DataFormats/SiStripCluster DataFormats/TrackReco DataFormats/Candidate CalibTracker/Records CommonTools/UtilAlgos CommonTools/Utils Geometry/Records Geometry/TrackerGeometryBuilder Geometry/CommonDetUnit MagneticField/Engine MagneticField/Records TrackingTools/GeomPropagators TrackingTools/TrajectoryState TrackingTools/Records SimDataFormats/TrackerDigiSimLink DataFormats/SiPixelCluster RecoLocalTracker/SiPixelRecHits RecoLocalTracker/SiStripRecHitConverter SimTracker/TrackerHitAssociation RecoLocalTracker/SiStripClusterizer,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += RecoLocalTrackerSubCollectionProducers
RecoLocalTrackerSubCollectionProducers_CLASS := LIBRARY
RecoLocalTracker/SubCollectionProducers_relbigobj+=RecoLocalTrackerSubCollectionProducers
endif
ifeq ($(strip $(FWCore/Version)),)
FWCoreVersion := self/FWCore/Version
FWCore/Version := FWCoreVersion
FWCoreVersion_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FWCoreVersion_EX_USE := $(foreach d, self cmssw ,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FWCoreVersion_EX_LIB   := FWCoreVersion
ALL_EXTERNAL_PRODS += FWCoreVersion
FWCoreVersion_CLASS := LIBRARY
FWCore/Version_relbigobj+=FWCoreVersion
endif
ifeq ($(strip $(RecoHIHiTrackingPlugins)),)
RecoHIHiTrackingPlugins := self/src/RecoHI/HiTracking/plugins
RecoHIHiTrackingPlugins_LOC_USE := self cmssw RecoHI/HiTracking RecoPixelVertexing/PixelLowPtUtilities CondFormats/EgammaObjects
ALL_EXTERNAL_PLUGIN_PRODS += RecoHIHiTrackingPlugins
RecoHI/HiTracking_relbigobj+=RecoHIHiTrackingPlugins
endif
ifeq ($(strip $(FastSimulationTrackingPlugins)),)
FastSimulationTrackingPlugins := self/src/FastSimulation/Tracking/plugins
FastSimulationTrackingPlugins_LOC_USE := self cmssw DataFormats/BeamSpot DataFormats/Common DataFormats/DetId DataFormats/GeometryVector DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet FastSimulation/BaseParticlePropagator FastSimulation/ParticlePropagator FastSimulation/Tracking Geometry/CommonDetUnit Geometry/Records Geometry/TrackerGeometryBuilder RecoPixelVertexing/PixelTrackFitting RecoTracker/TkTrackingRegions RecoTracker/TkSeedGenerator SimDataFormats/Track SimDataFormats/Vertex TrackingTools/PatternTools TrackingTools/TrajectoryParametrization TrackingTools/TrajectoryState TrackingTools/MaterialEffects SimGeneral/MixingModule RecoPixelVertexing/PixelTriplets
ALL_EXTERNAL_PLUGIN_PRODS += FastSimulationTrackingPlugins
FastSimulation/Tracking_relbigobj+=FastSimulationTrackingPlugins
endif
ifeq ($(strip $(RecoHI/HiTracking)),)
RecoHIHiTracking := self/RecoHI/HiTracking
RecoHI/HiTracking := RecoHIHiTracking
RecoHIHiTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
RecoHIHiTracking_EX_USE := $(foreach d, self cmssw FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/Records Geometry/TrackerGeometryBuilder TrackingTools/PatternTools RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoLocalTracker/Records MagneticField/Records DataFormats/ParticleFlowReco DataFormats/ParticleFlowCandidate,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
RecoHIHiTracking_EX_LIB   := RecoHIHiTracking
ALL_EXTERNAL_PRODS += RecoHIHiTracking
RecoHIHiTracking_CLASS := LIBRARY
RecoHI/HiTracking_relbigobj+=RecoHIHiTracking
endif
ifeq ($(strip $(FastSimulation/Tracking)),)
FastSimulationTracking := self/FastSimulation/Tracking
FastSimulation/Tracking := FastSimulationTracking
FastSimulationTracking_BuildFile    := $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
FastSimulationTracking_EX_USE := $(foreach d, self cmssw DataFormats/TrajectoryState TrackingTools/GeomPropagators TrackingTools/TrajectoryParametrization SimDataFormats/Track DataFormats/GeometryVector DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackerCommon DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/EgammaTrackReco Geometry/CommonDetUnit Geometry/TrackerGeometryBuilder Geometry/Records DataFormats/EgammaReco RecoTracker/TkHitPairs RecoPixelVertexing/PixelTriplets RecoTracker/MeasurementDet,$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
FastSimulationTracking_EX_LIB   := FastSimulationTracking
ALL_EXTERNAL_PRODS += FastSimulationTracking
FastSimulationTracking_CLASS := LIBRARY
FastSimulation/Tracking_relbigobj+=FastSimulationTracking
endif
ifeq ($(strip $(RecoHIHiMuonAlgosPlugins)),)
RecoHIHiMuonAlgosPlugins := self/src/RecoHI/HiMuonAlgos/plugins
RecoHIHiMuonAlgosPlugins_LOC_USE := self cmssw boost FWCore/Framework FWCore/PluginManager FWCore/ParameterSet Geometry/Records Geometry/TrackerGeometryBuilder RecoTracker/Record MagneticField/Records MagneticField/Engine DataFormats/VertexReco DataFormats/Common TrackingTools/TrajectoryState TrackingTools/GeomPropagators TrackingTools/DetLayers DataFormats/TrajectorySeed TrackingTools/MeasurementDet RecoTracker/MeasurementDet TrackingTools/TrajectoryFiltering TrackingTools/TrajectoryCleaning TrackingTools/MaterialEffects TrackingTools/TrackFitters RecoVertex/KalmanVertexFit RecoVertex/VertexPrimitives TrackingTools/TransientTrack HLTrigger/HLTcore RecoMuon/GlobalTrackingTools RecoMuon/TrackingTools hepmc RecoHI/HiMuonAlgos
ALL_EXTERNAL_PLUGIN_PRODS += RecoHIHiMuonAlgosPlugins
RecoHI/HiMuonAlgos_relbigobj+=RecoHIHiMuonAlgosPlugins
endif
