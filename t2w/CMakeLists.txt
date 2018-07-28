cmake_minimum_required (VERSION 3.0.0)
project (libt2w C)
include_directories (.)

add_library (t2w SHARED t2w.c)
add_executable (t2wexe main.c)

target_include_directories(t2w PRIVATE .)
target_include_directories(t2wexe PRIVATE .)
set_target_properties(t2wexe PROPERTIES OUTPUT_NAME t2w)

IF (WIN32 OR CYGWIN OR MINGW)
  install(TARGETS t2w RUNTIME DESTINATION bin)
ELSE()
  install(TARGETS t2w LIBRARY DESTINATION lib)
ENDIF()

install(FILES t2w.h DESTINATION include)
install(TARGETS t2wexe RUNTIME DESTINATION bin)
