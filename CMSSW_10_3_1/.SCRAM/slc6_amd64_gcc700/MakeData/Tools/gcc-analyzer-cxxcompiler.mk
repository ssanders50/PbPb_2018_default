ALL_TOOLS      += gcc-analyzer-cxxcompiler
gcc-analyzer-cxxcompiler_EX_FLAGS_CXXFLAGS  := -fplugin=/cvmfs/cms.cern.ch/slc6_amd64_gcc700/external/gcc-checker-plugin/1.2/lib/libchecker_gccplugins.so -fplugin-arg-libchecker_gccplugins-checkers=all -fsyntax-only

