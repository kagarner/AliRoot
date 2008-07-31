# -*- mode: cmake -*-
# - Try to find GEANT3
# Once done this will define
#
#  GEANT3_FOUND - system has GEANT3
#  GEANT3_INCLUDE_DIR - the GEANT3 include directory
#  GEANT_LIBRARIES - The libraries needed to use GEANT3
#  GEANT_DEFINITIONS - Compiler switches required for using GEANT3
#  GEANT3_SYSTEM_DIR - Base directory of the GEANT3 installation, needed for GCALOR

if (GEANT3_INCLUDE_DIR AND GEANT3_LIBRARIES)
  SET (GEANT3_INCLUDE_DIR GEANT3_INCLUDE_DIR-NOTFOUND)
  SET (GEANT3_LIB GEANT3_LIB-NOTFOUND)
  SET (GEANT3_DUMMY_LIB GEANT3_DUMMY_LIB-NOTFOUND)
  SET (GEANT3_SYSTEM_DIR GEANT3_SYSTEM_DIR-NOTFOUND)
endif (GEANT3_INCLUDE_DIR AND GEANT3_LIBRARIES)

FIND_PATH(GEANT3_SYSTEM_DIR NAMES TGeant3 PATHS
  $ENV{ALICE}/geant3
  NO_DEFAULT_PATH
)

FIND_PATH(GEANT3_INCLUDE_DIR NAMES TGeant3.h PATHS
  $ENV{ALICE}/geant3/TGeant3
  NO_DEFAULT_PATH
)

FIND_PATH(GEANT3_LIBRARY_DIR NAMES libgeant321.so PATHS
  $ENV{ALICE}/geant3/lib/tgt_macosx64
  NO_DEFAULT_PATH
)

FIND_LIBRARY(GEANT3_LIB NAMES geant321 PATHS
  $ENV{ALICE}/geant3/lib/tgt_macosx64
  NO_DEFAULT_PATH
)

SET(GEANT3_LIBRARIES ${GEANT3_LIB})

if (GEANT3_INCLUDE_DIR AND GEANT3_LIBRARIES AND GEANT3_SYSTEM_DIR)
   set(GEANT3_FOUND TRUE)
endif (GEANT3_INCLUDE_DIR AND GEANT3_LIBRARIES AND GEANT3_SYSTEM_DIR)

if (GEANT3_FOUND)
  if (NOT GEANT3_FIND_QUIETLY)
    MESSAGE(STATUS "Found GEANT3 in ${GEANT3_LIBRARIES}")
    SET(LD_LIBRARY_PATH ${LD_LIBRARY_PATH} ${GEANT3_LIBRARY_DIR})
  endif (NOT GEANT3_FIND_QUIETLY)
else (GEANT3_FOUND)
  if (GEANT3_FIND_REQUIRED)
    message(FATAL_ERROR "Looking for GEANT3... - Not found ")
  endif (GEANT3_FIND_REQUIRED)
endif (GEANT3_FOUND)

