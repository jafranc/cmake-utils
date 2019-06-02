find_package(Boost REQUIRED iostreams)

add_library(boost INTERFACE IMPORTED)
set_property(TARGET boost PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})

add_library(boost-iostreams SHARED IMPORTED)
set_property(TARGET boost-iostreams PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS})
set_property(TARGET boost-iostreams PROPERTY IMPORTED_LOCATION ${Boost_IOSTREAMS_LIBRARY})
