include(cmake_test/cmake_test)

ct_add_test("return")
    include(cmake_test/detail_/utilities/return)

    ct_assert_not_defined(the_return)

    function(dummy_fxn)
        set(the_return "hello world")
        _ct_return(the_return)
    endfunction()
    dummy_fxn()
    ct_assert_equal(the_return "hello world")
ct_end_test()
