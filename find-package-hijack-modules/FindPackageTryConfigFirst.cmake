#.rst:
# FindPackageTryConfigFirst
# -------------------------
#
# Helper macro to write find modules which hijack the offical find modules
# from the CMake distribution and try to find the config module first:
#
# Usage:
# ^^^^^^
#
# Create a find module for a package, e.g. ``FindZLIB.cmake`` with this
# line:
#
#   include(FindPackageTryConfigFirst)
#   find_package_try_config_first()
#
# Put the file along with this file in a directory and add the directory
# to ``CMAKE_MODULE_PATH``.
#
# When a ``CMakeLists.txt`` calls ``find_package(ZLIB)`` CMake will
# find your `FindZLIB.cmake` before the official module. This macro will
# attempt to find the ZLIB config module first. On failure, forwards the
# arguments to the original (module-mode) find_package.
#
# Note: the ``OPTIONAL_COMPONENTS`` and ``NO_POLICY_SCOPE`` parameters
# are not handled.

macro(find_package_try_config_first)
    get_filename_component(_FPTCF_find_module_filename ${CMAKE_CURRENT_LIST_FILE} NAME)
    string(REGEX MATCH "^Find(.+)[.]cmake$" _ ${_FPTCF_find_module_filename})
    set(_FPTCF_package_name "${CMAKE_MATCH_1}")

    if(NOT _FPTCF_package_name)
        message(FATAL_ERROR "FindPackageTryConfigFirst must be included from a find module, it was called from ${_FPTCF_find_module_filename}")
    endif()

    string(TOUPPER "${_FPTCF_package_name}" _FPTCF_package_name_upper)

    set(_FPTCF_ARGV "${_FPTCF_package_name}")

    list(APPEND _FPTCF_ARGV ${${_FPTCF_package_name}_FIND_VERSION})

    if(${_FPTCF_package_name}_FIND_VERSION_EXACT)
        list(APPEND _FPTCF_ARGV "EXACT")
    endif()

    if(${_FPTCF_package_name}_FIND_COMPONENTS)
        list(APPEND _FPTCF_ARGV COMPONENTS ${${_FPTCF_package_name}_FIND_COMPONENTS})
    endif()

    find_package(${_FPTCF_ARGV} NO_MODULE QUIET)

    if(${_FPTCF_package_name}_DIR)
        if(FPTCF_VERBOSE)
            message(STATUS "[FPTCF] ${_FPTCF_package_name} config module has been found.")
            message(STATUS "[FPTFC] ${_FPTCF_package_name}_DIR: ${${_FPTCF_package_name}_DIR}")
        endif()
        # The config module has been found ...
        if(NOT ${_FPTCF_package_name}_FOUND AND
            NOT ${_FPTCF_package_name_upper}_FOUND
        )
            # ... but the package is considered not found
            # In this case we don't fall back to the find module (since the config
            # module has indeed been found). Instead, if the original find_package
            # call was not QUIET then repeat the call without QUIET and with optional
            # REQUIRED to display the required error messages.
            if(FPTCF_VERBOSE)
                message(STATUS "[FPTCF] But the package has been considered NOT FOUND.")
            endif()
            if(NOT ${_FPTCF_package_name}_QUIETLY OR ${_FPTCF_package_name}_FIND_REQUIRED)
                if(${_FPTCF_package_name}_FIND_REQUIRED)
                    list(APPEND _FPTCF_ARGV REQUIRED)
                endif()
                find_package(${_FPTCF_ARGV} NO_MODULE)
            endif()
        else()
            if(FPTCF_VERBOSE)
                message(STATUS "[FPTCF] And the package has also been found.")
            endif()
        endif()
    else()
        # Config module has not been found
        # Fall back to the official find-module
        if(FPTCF_VERBOSE)
            message(STATUS "[FPTCF] ${_FPTCF_package_name} config module has not been found.")
            message(STATUS "[FPTCF] Falling-back to find module.")
        endif()
        include("${CMAKE_ROOT}/Modules/${_FPTCF_find_module_filename}")
    endif()
endmacro()
