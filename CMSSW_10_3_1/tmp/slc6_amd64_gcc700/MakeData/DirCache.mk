ALL_PACKAGES += HeavyIonsAnalysis/EventAnalysis
subdirs_src_HeavyIonsAnalysis_EventAnalysis := src_HeavyIonsAnalysis_EventAnalysis_test src_HeavyIonsAnalysis_EventAnalysis_python src_HeavyIonsAnalysis_EventAnalysis_src
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_test
src_HeavyIonsAnalysis_Configuration_test_parent := HeavyIonsAnalysis/Configuration
src_HeavyIonsAnalysis_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_test,src/HeavyIonsAnalysis/Configuration/test,TEST))
ALL_PACKAGES += HeavyIonsAnalysis/HiEvtPlaneCalib
subdirs_src_HeavyIonsAnalysis_HiEvtPlaneCalib := src_HeavyIonsAnalysis_HiEvtPlaneCalib_test src_HeavyIonsAnalysis_HiEvtPlaneCalib_python src_HeavyIonsAnalysis_HiEvtPlaneCalib_src
ifeq ($(strip $(PyHeavyIonsAnalysisEventAnalysis)),)
PyHeavyIonsAnalysisEventAnalysis := self/src/HeavyIonsAnalysis/EventAnalysis/python
src_HeavyIonsAnalysis_EventAnalysis_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/EventAnalysis/python)
PyHeavyIonsAnalysisEventAnalysis_files := $(patsubst src/HeavyIonsAnalysis/EventAnalysis/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/EventAnalysis/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisEventAnalysis_LOC_USE := self  
PyHeavyIonsAnalysisEventAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/EventAnalysis/python
ALL_PRODS += PyHeavyIonsAnalysisEventAnalysis
PyHeavyIonsAnalysisEventAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisEventAnalysis,src/HeavyIonsAnalysis/EventAnalysis/python,src_HeavyIonsAnalysis_EventAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisEventAnalysis,src/HeavyIonsAnalysis/EventAnalysis/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_EventAnalysis_python
src_HeavyIonsAnalysis_EventAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EventAnalysis_python,src/HeavyIonsAnalysis/EventAnalysis/python,PYTHON))
ifeq ($(strip $(PyHeavyIonsAnalysisConfiguration)),)
PyHeavyIonsAnalysisConfiguration := self/src/HeavyIonsAnalysis/Configuration/python
src_HeavyIonsAnalysis_Configuration_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration/python)
PyHeavyIonsAnalysisConfiguration_files := $(patsubst src/HeavyIonsAnalysis/Configuration/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisConfiguration_LOC_USE := self  
PyHeavyIonsAnalysisConfiguration_PACKAGE := self/src/HeavyIonsAnalysis/Configuration/python
ALL_PRODS += PyHeavyIonsAnalysisConfiguration
PyHeavyIonsAnalysisConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python,src_HeavyIonsAnalysis_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_python
src_HeavyIonsAnalysis_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_python,src/HeavyIonsAnalysis/Configuration/python,PYTHON))
ALL_PACKAGES += HeavyIonsAnalysis/Configuration
subdirs_src_HeavyIonsAnalysis_Configuration := src_HeavyIonsAnalysis_Configuration_test src_HeavyIonsAnalysis_Configuration_python
ifeq ($(strip $(PyHeavyIonsAnalysisVNAnalysis)),)
PyHeavyIonsAnalysisVNAnalysis := self/src/HeavyIonsAnalysis/VNAnalysis/python
src_HeavyIonsAnalysis_VNAnalysis_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/VNAnalysis/python)
PyHeavyIonsAnalysisVNAnalysis_files := $(patsubst src/HeavyIonsAnalysis/VNAnalysis/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/VNAnalysis/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisVNAnalysis_LOC_USE := self  
PyHeavyIonsAnalysisVNAnalysis_PACKAGE := self/src/HeavyIonsAnalysis/VNAnalysis/python
ALL_PRODS += PyHeavyIonsAnalysisVNAnalysis
PyHeavyIonsAnalysisVNAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisVNAnalysis,src/HeavyIonsAnalysis/VNAnalysis/python,src_HeavyIonsAnalysis_VNAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisVNAnalysis,src/HeavyIonsAnalysis/VNAnalysis/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_VNAnalysis_python
src_HeavyIonsAnalysis_VNAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_VNAnalysis_python,src/HeavyIonsAnalysis/VNAnalysis/python,PYTHON))
ALL_COMMONRULES += src_HeavyIonsAnalysis_HiEvtPlaneCalib_test
src_HeavyIonsAnalysis_HiEvtPlaneCalib_test_parent := HeavyIonsAnalysis/HiEvtPlaneCalib
src_HeavyIonsAnalysis_HiEvtPlaneCalib_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_HiEvtPlaneCalib_test,src/HeavyIonsAnalysis/HiEvtPlaneCalib/test,TEST))
ALL_SUBSYSTEMS+=HeavyIonsAnalysis
subdirs_src_HeavyIonsAnalysis = src_HeavyIonsAnalysis_HiEvtPlaneCalib src_HeavyIonsAnalysis_VNAnalysis src_HeavyIonsAnalysis_EventAnalysis src_HeavyIonsAnalysis_Configuration
ALL_PACKAGES += HeavyIonsAnalysis/VNAnalysis
subdirs_src_HeavyIonsAnalysis_VNAnalysis := src_HeavyIonsAnalysis_VNAnalysis_src src_HeavyIonsAnalysis_VNAnalysis_python src_HeavyIonsAnalysis_VNAnalysis_test
ALL_COMMONRULES += src_HeavyIonsAnalysis_EventAnalysis_test
src_HeavyIonsAnalysis_EventAnalysis_test_parent := HeavyIonsAnalysis/EventAnalysis
src_HeavyIonsAnalysis_EventAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_EventAnalysis_test,src/HeavyIonsAnalysis/EventAnalysis/test,TEST))
ifeq ($(strip $(PyHeavyIonsAnalysisHiEvtPlaneCalib)),)
PyHeavyIonsAnalysisHiEvtPlaneCalib := self/src/HeavyIonsAnalysis/HiEvtPlaneCalib/python
src_HeavyIonsAnalysis_HiEvtPlaneCalib_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/HiEvtPlaneCalib/python)
PyHeavyIonsAnalysisHiEvtPlaneCalib_files := $(patsubst src/HeavyIonsAnalysis/HiEvtPlaneCalib/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/HiEvtPlaneCalib/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisHiEvtPlaneCalib_LOC_USE := self  
PyHeavyIonsAnalysisHiEvtPlaneCalib_PACKAGE := self/src/HeavyIonsAnalysis/HiEvtPlaneCalib/python
ALL_PRODS += PyHeavyIonsAnalysisHiEvtPlaneCalib
PyHeavyIonsAnalysisHiEvtPlaneCalib_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisHiEvtPlaneCalib,src/HeavyIonsAnalysis/HiEvtPlaneCalib/python,src_HeavyIonsAnalysis_HiEvtPlaneCalib_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisHiEvtPlaneCalib,src/HeavyIonsAnalysis/HiEvtPlaneCalib/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_HiEvtPlaneCalib_python
src_HeavyIonsAnalysis_HiEvtPlaneCalib_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_HiEvtPlaneCalib_python,src/HeavyIonsAnalysis/HiEvtPlaneCalib/python,PYTHON))
ALL_COMMONRULES += src_HeavyIonsAnalysis_VNAnalysis_test
src_HeavyIonsAnalysis_VNAnalysis_test_parent := HeavyIonsAnalysis/VNAnalysis
src_HeavyIonsAnalysis_VNAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_VNAnalysis_test,src/HeavyIonsAnalysis/VNAnalysis/test,TEST))
