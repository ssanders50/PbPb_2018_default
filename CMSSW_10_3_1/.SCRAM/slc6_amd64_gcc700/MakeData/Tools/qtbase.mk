ALL_TOOLS      += qtbase
qtbase_EX_INCLUDE := /cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/qt/4.8.7-ogkkac/include /cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/qt/4.8.7-ogkkac/include/Qt /cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/qt/4.8.7-ogkkac/include/QtCore /cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/qt/4.8.7-ogkkac/include/QtXml
qtbase_EX_LIB := QtCore QtXml
qtbase_EX_USE := root_cxxdefaults zlib
qtbase_EX_FLAGS_CPPDEFINES  := -DQT_ALTERNATE_QTSMANIP -DQT_CLEAN_NAMESPACE -DQT_THREAD_SUPPORT

