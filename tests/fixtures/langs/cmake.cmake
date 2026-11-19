# yugen-ash highlight showcase — CMake (CMakeLists.txt / .cmake)
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/cmake.cmake
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/cmake.cmake
#
# Headless coverage check:
#   scripts/test-highlights.sh cmake
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: cmakeComment, cmakeTodo
# Treesitter: @comment
# TODO: exercise the cmakeTodo group.

# legacy syntax: cmakeStatement, cmakeCommand, cmakeKeyword, cmakeArguments
# Treesitter: @keyword, @function, @function.builtin, @function.call
cmake_minimum_required(VERSION 3.24)
project(showcase VERSION 1.0 LANGUAGES C CXX)

# legacy syntax: cmakeVariable, cmakeVariableValue
# Treesitter: @variable, @operator, @string
set(CMAKE_C_STANDARD 11)
set(PROJECT_NAME "yugen-ash")
set(SOURCES src/main.c src/theme.c)

# legacy syntax: cmakeProperty, cmakeModule
# Treesitter: @property, @constant
set_target_properties(showcase PROPERTIES C_STANDARD 11 CXX_STANDARD 20)
include(GNUInstallDirs)
include(CTest)

# legacy syntax: cmakeRegistry, cmakeEscaped
# Treesitter: @string, @punctuation.special
find_package(Threads REQUIRED)
find_package(PkgConfig QUIET)
option(SHOWCASE_TESTS "Build tests" ON)
add_definitions(-DSHOWCASE_VERSION="1.0")

# legacy syntax: cmakeString, cmakeGeneratorExpression
# Treesitter: @string
add_executable(showcase ${SOURCES})
target_compile_definitions(showcase PRIVATE VERSION="${PROJECT_VERSION}")
target_include_directories(showcase PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(showcase PRIVATE Threads::Threads)
set_target_properties(showcase PROPERTIES RUNTIME_OUTPUT_DIRECTORY "$<1:${CMAKE_BINARY_DIR}/bin>")

# legacy syntax: cmakeConditional
# Treesitter: @keyword.conditional
if(SHOWCASE_TESTS)
	enable_testing()
	add_subdirectory(tests)
else()
	message(STATUS "Tests disabled")
endif()

foreach(source IN LISTS SOURCES)
	message(STATUS "Source: ${source}")
endforeach()
