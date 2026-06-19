cmake_minimum_required(VERSION 3.16)
project(OxrWXR-Simulator VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/oxrwxr)

# For multi-config generators (Visual Studio)
foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${CMAKE_SOURCE_DIR}/oxrwxr)
endforeach()

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/src)

# OpenXR Simulator Runtime DLL
add_library(openxr_wxr SHARED
    src/runtime.cpp
    src/WinXrApiUDP.cpp
)

# Link libraries
target_link_libraries(openxr_wxr
    d3d11
    d3d12
    dxgi
    d3dcompiler
    dwmapi
)

# Windows-specific settings
if(WIN32)
    target_compile_definitions(openxr_wxr PRIVATE
        WIN32_LEAN_AND_MEAN
        NOMINMAX
        _CRT_SECURE_NO_WARNINGS
    )
endif()
