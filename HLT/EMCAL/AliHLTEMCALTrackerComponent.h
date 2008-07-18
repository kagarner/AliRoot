//-*- Mode: C++ -*-
#ifndef ALIHLTEMCALTRACKERCOMPONENT_H
#define ALIHLTEMCALTRACKERCOMPONENT_H

//* This file is property of and copyright by the ALICE HLT Project        * 
//* ALICE Experiment at CERN, All rights reserved.                         *
//* See cxx source for full Copyright notice                               */

/** @file   AliHLTEMCALTrackerComponent.h
    @author Matthias Richter, Timm Steinbeck
    @date   
    @brief  A sample processing component for the HLT.
*/

#include "AliHLTProcessor.h"

/**
 * @class AliHLTEMCALTrackerComponent
 */

class TFile;
class TGeoManager;
class AliEMCALTracker;
class AliCDBManager;
class AliRawReaderMemory;  

class AliHLTEMCALTrackerComponent : public AliHLTProcessor {
public:
  AliHLTEMCALTrackerComponent();
  AliHLTEMCALTrackerComponent(const AliHLTEMCALTrackerComponent& c);
  virtual ~AliHLTEMCALTrackerComponent();

  AliHLTEMCALTrackerComponent& operator=(const AliHLTEMCALTrackerComponent&);

  // AliHLTComponent interface functions
  const char* GetComponentID();
  void GetInputDataTypes( vector<AliHLTComponentDataType>& list);
  AliHLTComponentDataType GetOutputDataType();
  virtual void GetOutputDataSize( unsigned long& constBase, double& inputMultiplier );

  // Spawn function, return new class instance
  AliHLTComponent* Spawn() {return new AliHLTEMCALTrackerComponent;};

 protected:
  // AliHLTComponent interface functions
  int DoInit( int argc, const char** argv );
  int DoDeinit();
  int DoEvent( const AliHLTComponentEventData & evtData,
	       AliHLTComponentTriggerData & trigData );
  int Reconfigure(const char* cdbEntry, const char* chainId);
  int ReadPreprocessorValues(const char* modules);

  using AliHLTProcessor::DoEvent;

private:
  /**
   * Configure the component.
   * Parse a string for the configuration arguments and set the component
   * properties.
   *
   * This function illustrates the scanning of an argument string. The string
   * was presumably fetched from the CDB.
   */
  int Configure(const char* arguments);

  unsigned             fOutputPercentage;    // Output volume in percentage of the input  
  string               fStorageDBpath;      // Default path for OCDB
  
  AliCDBManager       *fCDB;                 //! Pointer to OCDB
  string               fGeometryFileName;    // Path to geometry file - geom handled by the utils
  
  ClassDef(AliHLTEMCALTrackerComponent, 1)
};
#endif
