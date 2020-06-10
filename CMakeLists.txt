# This CMakeLists file builds the GVDB library and all of its samples. If you'd
# like to build the GVDB library by itself, try running the CMakeLists in
# source/gvdb_library.
cmake_minimum_required(VERSION 3.10)

project(gvdb_all)

# Are we inside an add_subdirectory()? Then don't install
# Check if this CMakeLists is being used directly or via add_subdirectory
set(INSTALL_CONFIG OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(INSTALL_CONFIG ON)
endif()


# These samples depend only on the things included with GVDB.
add_subdirectory("source/gvdb_library" "gvdb_library")

option(GVDB_BUILD_SAMPLES "Build Samples" ON)
if(GVDB_BUILD_SAMPLES)
  add_subdirectory("source/g3DPrint" "g3DPrint")
  add_subdirectory("source/gDepthMap" "gDepthMap")
  add_subdirectory("source/gInteractiveGL" "gInteractiveGL")
  add_subdirectory("source/gRenderKernel" "gRenderKernel")
  add_subdirectory("source/gRenderToFile" "gRenderToFile")
  add_subdirectory("source/gResample" "gResample")
  add_subdirectory("source/gSprayDeposit" "gSprayDeposit")

  # GVDB samples using OptiX, not built by default. To enable these samples, set
  # GVDB_BUILD_OPTIX_SAMPLES to ON before configuring CMake.
  option(GVDB_BUILD_OPTIX_SAMPLES
         "If ON, includes samples using OptiX in build." OFF)
  if(GVDB_BUILD_OPTIX_SAMPLES)
    add_subdirectory("source/gFluidSurface" "gFluidSurface")
    add_subdirectory("source/gInteractiveOptix" "gInteractiveOptix")
    add_subdirectory("source/gPointCloud" "gPointCloud")
    add_subdirectory("source/gPointFusion" "gPointFusion")
  endif()
endif()

# GVDB samples using OpenVDB, not built by default. To enable these samples, set
# GVDB_BUILD_OPENVDB and GVDB_BUILD_OPENVDB_SAMPLES to ON before configuring
# CMake. (Hypothetically, you can run these samples without including OpenVDB
# via GVDB_BUILD_OPENVDB, but you'll get an error!)
option(GVDB_BUILD_OPENVDB_SAMPLES
       "If ON, includes samples using OpenVDB in build." OFF)
if(GVDB_BUILD_OPENVDB_SAMPLES)
  add_subdirectory("source/gImportVDB" "gImportVDB")
endif()
