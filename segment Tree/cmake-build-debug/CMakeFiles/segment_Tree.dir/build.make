# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.3.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.3.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "E:\c++ programs\segment Tree"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "E:\c++ programs\segment Tree\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/segment_Tree.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/segment_Tree.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/segment_Tree.dir/flags.make

CMakeFiles/segment_Tree.dir/main.cpp.obj: CMakeFiles/segment_Tree.dir/flags.make
CMakeFiles/segment_Tree.dir/main.cpp.obj: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="E:\c++ programs\segment Tree\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/segment_Tree.dir/main.cpp.obj"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\segment_Tree.dir\main.cpp.obj -c "E:\c++ programs\segment Tree\main.cpp"

CMakeFiles/segment_Tree.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/segment_Tree.dir/main.cpp.i"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "E:\c++ programs\segment Tree\main.cpp" > CMakeFiles\segment_Tree.dir\main.cpp.i

CMakeFiles/segment_Tree.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/segment_Tree.dir/main.cpp.s"
	C:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "E:\c++ programs\segment Tree\main.cpp" -o CMakeFiles\segment_Tree.dir\main.cpp.s

# Object files for target segment_Tree
segment_Tree_OBJECTS = \
"CMakeFiles/segment_Tree.dir/main.cpp.obj"

# External object files for target segment_Tree
segment_Tree_EXTERNAL_OBJECTS =

segment_Tree.exe: CMakeFiles/segment_Tree.dir/main.cpp.obj
segment_Tree.exe: CMakeFiles/segment_Tree.dir/build.make
segment_Tree.exe: CMakeFiles/segment_Tree.dir/linklibs.rsp
segment_Tree.exe: CMakeFiles/segment_Tree.dir/objects1.rsp
segment_Tree.exe: CMakeFiles/segment_Tree.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="E:\c++ programs\segment Tree\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable segment_Tree.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\segment_Tree.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/segment_Tree.dir/build: segment_Tree.exe
.PHONY : CMakeFiles/segment_Tree.dir/build

CMakeFiles/segment_Tree.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\segment_Tree.dir\cmake_clean.cmake
.PHONY : CMakeFiles/segment_Tree.dir/clean

CMakeFiles/segment_Tree.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "E:\c++ programs\segment Tree" "E:\c++ programs\segment Tree" "E:\c++ programs\segment Tree\cmake-build-debug" "E:\c++ programs\segment Tree\cmake-build-debug" "E:\c++ programs\segment Tree\cmake-build-debug\CMakeFiles\segment_Tree.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/segment_Tree.dir/depend
