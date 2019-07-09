include_guard()

## @fn _ct_capture_commands(list)
#  @brief Returns (as a list) all of the CMakeTest commands that need to have
#         their arguments captured.
#
#  This function encapsulates the logic required to retrieve a list of all
#  CMakeTest commands that require us to capture their arguments while parsing.
#
# @param[out] list An identifier to hold the list of commands
function(_ct_capture_commands _cc_list)
    set(
        ${_cc_list}
        "ct_add_test"
        "ct_add_section"
        "ct_assert_fails_as"
        "ct_assert_prints"
    )
    _ct_return(${_cc_list})
endfunction()
