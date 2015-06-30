The purpose of these modules is to hijack the normal (MODULE) `find_package`
commands to bypass the official find-modules distributed the CMake.

Instead, try to find the config-module first and if that fails fall back
to MODULE mode. So the effect is something like this (simplified):

    find_package(<package> CONFIG ...)
    if(NOT <package>_FOUND)
        find_package(<package> ...)
    endif()
