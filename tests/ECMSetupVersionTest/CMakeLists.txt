macro(add_version_test NAME COMMAND)
  string(REPLACE "." "/" dir "${NAME}")
  string(REGEX REPLACE "[^.]*\\." "" proj "${NAME}")
  add_test(ecm_setup_version-${NAME} ${CMAKE_CTEST_COMMAND}
    --build-and-test
    "${CMAKE_CURRENT_SOURCE_DIR}/${dir}"
    "${CMAKE_CURRENT_BINARY_DIR}/${dir}"
    --build-two-config
    --build-generator ${CMAKE_GENERATOR}
    --build-makeprogram ${CMAKE_MAKE_PROGRAM}
    --build-project ${proj}
    ${${NAME}_EXTRA_OPTIONS}
    --test-command ${COMMAND} ${ARGN})
endmacro()

# Skip these tests with cmake >= 4 because CMP0048 doesn't exist anymore and
# trying to set it results in a hard error.
if(CMAKE_MAJOR_VERSION VERSION_LESS 4)
    add_version_test(old_simple dummy)
    add_version_test(old_simple_no_version_string_vars dummy)
    add_version_test(old_soversion dummy)
    add_version_test(old_version_file dummy)
    add_version_test(old_version_file_abspath dummy)
    add_version_test(old_version_file_anynewer dummy)
    add_version_test(old_version_file_exact dummy)
    add_version_test(old_version_file_samemajor dummy)
    add_version_test(old_header check_header)
    add_version_test(old_header_abspath check_header)
endif()

add_version_test(new_explicit_header check_header)
add_version_test(new_explicit_header_abspath check_header)
add_version_test(new_explicit_simple dummy)
add_version_test(new_explicit_simple_no_version_string_vars dummy)
add_version_test(new_explicit_soversion dummy)
add_version_test(new_explicit_version_file dummy)
add_version_test(new_explicit_version_file_abspath dummy)
add_version_test(new_project_header check_header)
add_version_test(new_project_header_abspath check_header)
add_version_test(new_project_header_prefix check_header)
add_version_test(new_project_header_zero_prefixed_version check_header)
add_version_test(new_project_header_expected_zero_version check_header)
add_version_test(new_project_simple dummy)
add_version_test(new_project_simple_no_version_string_vars dummy)
add_version_test(new_project_simple_prefix dummy)
add_version_test(new_project_soversion dummy)
add_version_test(new_project_soversion_prefix dummy)
add_version_test(new_project_version_file dummy)
add_version_test(new_project_version_file_abspath dummy)
