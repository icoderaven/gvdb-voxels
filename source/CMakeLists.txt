cmake_minimum_required(VERSION 3.5)
project(gvdb_main)

option(GVDB_BUILD_SAMPLE_UTILS
  "If on, builds utils for visualisation."
  OFF
)
option(GVDB_BUILD_SAMPLES
  "If on, builds the sample applications."
  OFF
)

add_subdirectory(gvdb_library)

if(GVDB_BUILD_SAMPLES)
  SET(GVDB_BUILD_SAMPLE_UTILS "ON" CACHE BOOL "If on, builds utils for visualisation." FORCE)
  add_subdirectory(samples)
endif(GVDB_BUILD_SAMPLES)

if(GVDB_BUILD_SAMPLE_UTILS)
  add_subdirectory(sample_utils)
endif(GVDB_BUILD_SAMPLE_UTILS)

# Make files that store configuration to help dependent CMake files use
# these libraries.
export(
  TARGETS gvdb
  FILE ${LIBRARY_OUTPUT_PATH}/cmake/gvdb-targets.cmake
  )
configure_file(${PROJECT_SOURCE_DIR}/gvdb-config.cmake.in
  ${LIBRARY_OUTPUT_PATH}/cmake/gvdb-config.cmake
  @ONLY
)
install(FILES ${LIBRARY_OUTPUT_PATH}/cmake/gvdb-config.cmake
DESTINATION lib/cmake
)