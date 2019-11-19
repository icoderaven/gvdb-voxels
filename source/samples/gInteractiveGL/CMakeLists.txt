cmake_minimum_required(VERSION 2.8)
set(PROJNAME gInteractiveGL)
Project(${PROJNAME})
Message(STATUS "-------------------------------")
Message(STATUS "Processing Project ${PROJNAME}:")

set ( REQUIRE_OPENGL "1" )
set ( REQUIRE_PNG "1" )
set ( REQUIRE_TGA "1" )
set ( REQUIRE_GLEW "1" )
set ( REQUIRE_MAIN "1" )
set ( REQUIRE_NVGUI "1" )

# Asset Path
#
if ( NOT DEFINED ASSET_PATH )
  get_filename_component ( _assets "${CMAKE_CURRENT_SOURCE_DIR}/../../shared_assets" REALPATH )
  set ( ASSET_PATH ${_assets} CACHE PATH "Full path to gvdb/shared_assets/" )
endif()
SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
####################################################################################
# Executable
#
file(GLOB SOURCE_FILES *.cpp *.hpp *.inl *.h *.c)
_LIST_ALL_SOURCE ( FILES ${SOURCE_FILES} ${COMMON_SOURCE_FILES} ${PACKAGE_SOURCE_FILES} ${UTIL_SOURCE_FILES} ${UTIL_OPTIX_KERNELS} ${CUDA_FILES} ${PTX_SOURCES} )
add_definitions(-DGVDB_IMPORTS -DGLEW_STATIC -DGLEW_NO_GLU)
add_definitions(-DASSET_PATH="${ASSET_PATH}/")
add_executable (${PROJNAME} ${ALL_SOURCE_FILES} )
set_property ( TARGET ${PROJNAME} APPEND PROPERTY DEPENDS ${PTX_SOURCES} )
target_include_directories (${PROJNAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(${PROJNAME} gvdb_utils gvdb)
set_target_properties( ${PROJNAME} PROPERTIES INSTALL_RPATH_USE_LINK_PATH TRUE)

#####################################################################################
# Windows specific
#
_MSVC_PROPERTIES()

#####################################################################################
# Install Binaries

# Install to output location
install ( TARGETS ${PROJNAME}
 DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")

###########################
# Done
message ( STATUS "CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}" )
message ( STATUS "EXECUTABLE_OUTPUT_PATH: ${EXECUTABLE_OUTPUT_PATH}" )
message ( STATUS "ASSET_PATH: ${ASSET_PATH}")

