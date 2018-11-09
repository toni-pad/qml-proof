cmake_minimum_required(VERSION 3.1)

project(qml-proof LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)


# include
include_directories(${CMAKE_SOURCE_DIR}/qml ${CMAKE_SOURCE_DIR}/src)

# Looking for files
file(GLOB_RECURSE SRC "src/*.cpp" )
file(GLOB_RECURSE HDR "src/*.h")
file(GLOB_RECURSE QRC "qml/*qrc")

add_executable(${PROJECT_NAME} ${SRC} ${HDR} ${QRC})

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)
