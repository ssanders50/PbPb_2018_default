#!/bin/bash
cd EPCalib
rm *.so
rm *.d
rm *.pcm
rm -rf HiEvtPlaneList.h
rm -rf HiEvtPlaneFlatten.h
ln -s $CMSSW_RELEASE_BASE/src/RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneList.h
ln -s $CMSSW_RELEASE_BASE/src/RecoHI/HiEvtPlaneAlgos/interface/HiEvtPlaneFlatten.h
cd ..
rm -rf data/*.root
rm -rf RescorTables
rm *.db
rm /rfs/sanders/tmpPbPb2018
rm /rfs/sanders/EPPbPb2018.root
rm tmp.lis

ls -1 /rfs/sanders/crab_projects/crab_PbPb2018*/calib*.root > tmp.lis
mkdir RescorTables
root -l  'EPCalib/EPCalib.C+(1,600000,"/rfs/sanders/tmp/tmpPbPb2018","/rfs/sanders/tmp/EPPbPb2018.root","/rfs/sanders/tmp/foffPbPb2018.root")'
rm offsets/offset_PbPb2018_1_600000.root
mv /rfs/sanders/tmp/foffPbPb2018.root offsets/offset_PbPb2018_1_600000.root
cd data
rm rpflat_combined.root
ln -s /rfs/sanders/tmp/EPPbPb2018.root rpflat_combined.root
cd ..
cmsRun moveflatparamstodb_cfg.py print outputFile=HeavyIonRPRcd_PbPb2018_1_600000.db outputTag=HeavyIonRPRcd begin=1 end=600000
rm /rfs/sanders/tmpPbPb2018
rm save/EP_PbPb2018_1_600000.root
mv /rfs/sanders/tmp/EPPbPb2018.root save/EP_PbPb2018_1_600000.root
rm  -rf RescorSave/RescorTables_PbPb2018_1_600000
mv RescorTables RescorSave/RescorTables_PbPb2018_1_600000

conddb_import -f sqlite_file:HeavyIonRPRcd_PbPb2018_1_600000.db -c sqlite_file:HeavyIonRPRcd_PbPb2018_offline.db -i HeavyIonRPRcd -t HeavyIonRPRcd_PbPb2018_offline -b 1 -e 600000
