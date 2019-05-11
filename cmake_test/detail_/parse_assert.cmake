include_guard()

macro(_ct_parse_assert _pa_line _pa_args)
    _ct_parse_debug("Assert: ${_pa_line}")
    _ct_lc_find(_pa_is_print "ct_assert_prints" "${_pa_line}")
    if(_pa_is_print)
        _ct_append_buffer(_ct_prints "${_pa_args}")
    else()
        message(FATAL_ERROR "Unrecognized assert")
    endif()
endmacro()
