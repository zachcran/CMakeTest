include_guard()
include(cmake_test/detail_/test_section/get_prop)
include(cmake_test/detail_/utilities/input_check)
include(cmake_test/detail_/utilities/return)

## @memberof TestSection
#  @public
#  @fn TITLE(handle, title)
#  @brief Returns the title of the current section.
#
#  This function will return the title of the current subsection
#
#  @param[in] handle The handle to the section
#  @param[out] title The title of the current test case.
function(_ct_test_section_get_title _tsgt_handle _tsgt_title)
    _ct_is_handle(_tsgt_handle)
    _ct_nonempty_string(_tsgt_title)

    _ct_get_prop(${_tsgt_title} "${_tsgt_handle}" "title")
    _ct_return(${_tsgt_title})
endfunction()
