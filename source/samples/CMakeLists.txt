cmake_minimum_required(VERSION 3.5)
project(gvdb_samples LANGUAGES CXX)

option(BUILD_g3DPrint
    "If on, build sample app g3DPrint."
    OFF)
option(BUILD_gDepthMap
    "If on, build sample app gDepthMap."
    OFF)
option(BUILD_gFluidSurface
    "If on, build sample app gFluidSurface."
    OFF)
option(BUILD_gImportVDB
    "If on, build sample app gImportVDB."
    OFF)
option(BUILD_gInteractiveGL
    "If on, build sample app gInteractiveGL."
    OFF)
option(BUILD_gInteractiveOptix
    "If on, build sample app gInteractiveOptix."
    OFF)
option(BUILD_gJetsonTX
    "If on, build sample app gJetsonTX."
    OFF)
option(BUILD_gPointCloud
    "If on, build sample app gPointCloud."
    OFF)
option(BUILD_gPointFusion
    "If on, build sample app gPointFusion."
    OFF)
option(BUILD_gRenderKernel
    "If on, build sample app gRenderKernel."
    OFF)
option(BUILD_gRenderToFile
    "If on, build sample app gRenderToFile."
    OFF)
option(BUILD_gResample
    "If on, build sample app gResample."
    OFF)
option(BUILD_gSprayDeposit
    "If on, build sample app gSprayDeposit."
    OFF)

if(BUILD_g3DPrint)
    add_subdirectory(g3DPrint)
endif(BUILD_g3DPrint)
if(BUILD_gDepthMap)
    add_subdirectory(gDepthMap)
endif(BUILD_gDepthMap)
if(BUILD_gFluidSurface)
    add_subdirectory(gFluidSurface)
endif(BUILD_gFluidSurface)
if(BUILD_gImportVDB)
    add_subdirectory(gImportVDB)
endif(BUILD_gImportVDB)
if(BUILD_gInteractiveGL)
    add_subdirectory(gInteractiveGL)
endif(BUILD_gInteractiveGL)
if(BUILD_gInteractiveOptix)
    add_subdirectory(gInteractiveOptix)
endif(BUILD_gInteractiveOptix)
if(BUILD_gJetsonTX)
    add_subdirectory(gJetsonTX)
endif(BUILD_gJetsonTX)
if(BUILD_gPointCloud)
    add_subdirectory(gPointCloud)
endif(BUILD_gPointCloud)
if(BUILD_gPointFusion)
    add_subdirectory(gPointFusion)
endif(BUILD_gPointFusion)
if(BUILD_gRenderKernel)
    add_subdirectory(gRenderKernel)
endif(BUILD_gRenderKernel)
if(BUILD_gRenderToFile)
    add_subdirectory(gRenderToFile)
endif(BUILD_gRenderToFile)
if(BUILD_gResample)
    add_subdirectory(gResample)
endif(BUILD_gResample)
if(BUILD_gSprayDeposit)
    add_subdirectory(gSprayDeposit)
endif(BUILD_gSprayDeposit)