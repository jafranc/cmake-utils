
######################## steps to install
cd build

# Building
cmake ../src && make

# Testing
make test
ctest --output-on-failure

# Building to a different root directory
cmake -DCMAKE_INSTALL_PREFIX=/opt/mypackage ../src

######################## steps to re-use libs

# CMakeLists
find_package(MyLibrary)

# Build like this:
cmake ../src -DMyLibrary_DIR=/path/to/mylibrary/build

# Passing the MyLibrary_DIR is not necessary if you
# 'make install'ed the project.

####################### using file gen

add_custom_command(
    OUTPUT file.output
    COMMAND tool --options "${CMAKE_CURRENT_SOURCE_DIR}/file.gen"
    MAIN_DEPENDENCY file.gen
    DEPENDS tool)

# Both for source files and header files
add_library(target
    ...
    file.output)

# For headers
target_include_directories(target
    ...
    PRIVATE ... ${CMAKE_CURRENT_BINARY_DIR})


then 

add_custom_target(flow-diagram ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/file.output)

