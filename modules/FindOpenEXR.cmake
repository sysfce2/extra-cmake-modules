
# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
INCLUDE(UsePkgConfig)

PKGCONFIG(OpenEXR _OPENEXRIncDir _OPENEXRLinkDir _OPENEXRLinkFlags _OPENEXRCflags)

FIND_PATH(OPENEXR_INCLUDE_DIR ImfRgbaFile.h
${_OPENEXRIncDir}
/usr/include
/usr/local/include
)

FIND_LIBRARY(OPENEXR_LIBRARIES NAMES Half Iex IlmImf Imath
  PATHS
  ${_OPENEXRLinkDir}
  /usr/lib
  /usr/local/lib
)

IF(OPENEXR_INCLUDE_DIR AND OPENEXR_LIBRARIES)
   SET(OPENEXR_FOUND TRUE)
ENDIF(OPENEXR_INCLUDE_DIR AND OPENEXR_LIBRARIES)



IF (OPENEXR_FOUND)
  IF (NOT OpenEXR_FIND_QUIETLY)
    MESSAGE(STATUS "Found OPENEXR: ${OPENEXR_LIBRARIES}")
  ENDIF (NOT OpenEXR_FIND_QUIETLY)
ELSE (OPENEXR_FOUND)
  IF (OpenEXR_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find OPENEXR")
  ENDIF (OpenEXR_FIND_REQUIRED)
ENDIF (OPENEXR_FOUND)

MARK_AS_ADVANCED(OPENEXR_INCLUDE_DIR OPENEXR_LIBRARIES)


