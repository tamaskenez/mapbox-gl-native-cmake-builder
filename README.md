Builder super-project for [mapbox-gl-native-cmake](https://github.com/tamaskenez/mapbox-gl-native-cmake),
my fork of [mapbox-gl-native](https://github.com/mapbox/mapbox-gl-native).

This builder, using the [cake-build-tool](https://github.com/tamaskenez/cake),
automatically clones, builds and installs dependencies of mapbox-gl-native.

Currently these repos (this builder and mapbox-gl-native-cmake) are developed
and tested on Windows and Linux. The current status on Windows is that
the project builds fine with VS 2015 RC but when running it, in Debug mode
there's an iterator-not-dereferencable assertion. In Release mode it does show
the map and UI is working but many labels are missing or not displayed
correctly (rotated). I'm waiting for Visual Studio 2015 to see if it's
a compiler bug or a bug I introduced during the porting.

# Prerequisites

 - Modern C++ compiler that supports `-std=c++14` (clang++ 3.5 or later
   or g++-4.9 or later).
 - [Boost](http://boost.org) (headers and system+thread libs)
 - [CMake 3.1](http://cmake.org) or later
 - unix-like shell, for Windows [MSysGit](https://git-scm.com/download/win)
   is fine

# Building

Make sure `find_package(Boost)` will find your Boost headers and libraries.
If needed:

- set the appropriate `BOOST_*` environment variables in your shell, or
- duplicate the file `cake-project-local.cmake.sample` to
  `cake-project-local.cmake` and edit.
  You can append the `BOOST_*` variables to `CMAKE_ARGS`.

You can also use `cake-project-local.cmake` to set other, global
CMake options for all dependencies and the `mbgl` project. For example,
you may need to set `CMAKE_GENERATOR` to use a generator other than
the default one.

After that, cd into the root of this repo and enter

    source init.sh

The `init.sh` script clones, builds and installs all the dependencies
(takes a while!). In the end, configures the mapbox-gl-native project
with CMake (it's cloned into the `mbgl` subdirectory).

You can find the configured binary directory of `mbgl` in `_out/build/mbgl`.
You can build it directly with `cmake`:

    cmake --build _out/build/mbgl --target app --config Release

or you can use the convenience command `cake` to build it:

    cake mbgl --target app

or open in your IDE (Visual Studio or Xcode)

    cake mbgl --ide

and build the `app` target from there.

# Running

- Set your `MAPBOX_ACCESS_TOKEN` environment variable

- Make sure the application can access the shared dependent libraries.

  In Visual Studio you need to open the `app` target's property pages,
  select the `Debugging` page and add `PATH=<this-dir>\_out\bin:%PATH%` to
  the `Environment` text box. You can also set your
  `MAPBOX_ACCESS_TOKEN` here.

  In Unix environments you may need to set `LD_LIBRARY_PATH`.

- You need to start `app` from its directory. In Visual Studio, on
  the same property page, change the value of `Working Directory`
  from `$(ProjectDir)` to `$(TargetDir)`
