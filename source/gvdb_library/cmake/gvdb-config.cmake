#
# gvdb-config.cmake
#

include(CMakeFindDependencyMacro)

find_dependency(OpenGL REQUIRED)
find_dependency(CUDA REQUIRED)

if(GVDB_BUILD_OPENVDB)
  find_dependency(OpenVDB REQUIRED)
endif()

# If this file hasn't been called before
if(NOT TARGET gvdb::gvdb)
  include("${CMAKE_CURRENT_LIST_DIR}/gvdb-targets.cmake")
endif()
