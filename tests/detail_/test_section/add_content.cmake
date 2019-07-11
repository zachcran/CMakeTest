include(cmake_test/cmake_test)

ct_add_test("TestSection::add_content")
    include(cmake_test/detail_/test_section/add_content)

    ct_add_section("fails if arg1 is not a handle")
        _ct_test_section_add_content(handle "")
        ct_assert_fails_as("_tsac_handle is not a handle to a TestSection.")
    ct_end_section()

    ct_add_section("valid handle")
        include(cmake_test/detail_/test_section/test_section)
        test_section(CTOR handle "title")
        set(empty "")
        set(string "hi")
        set(list "hello;world")
        ct_add_section("empty string")
            _ct_test_section_add_content(${handle} empty)
            test_section(GET_CONTENT ${handle} result)
            ct_assert_equal(result "")

            ct_add_section("and another empty string")
                _ct_test_section_add_content(${handle} empty)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "")
            ct_end_section()

            ct_add_section("and a non-empty string")
                _ct_test_section_add_content(${handle} string)
                test_section(GET_CONTENT ${handle}  result)
                ct_assert_equal(result "hi")
            ct_end_section()

            ct_add_section("and a list")
                _ct_test_section_add_content(${handle} list)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hello;world")
            ct_end_section()
        ct_end_section()

        ct_add_section("non-empty string")
            _ct_test_section_add_content(${handle} string)
            test_section(GET_CONTENT ${handle} result)
            ct_assert_equal(result "hi")

            ct_add_section("and an empty string")
                _ct_test_section_add_content(${handle} empty)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hi\n")
            ct_end_section()

            ct_add_section("and a non-empty string")
                _ct_test_section_add_content(${handle} string)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hi\nhi")
            ct_end_section()

            ct_add_section("and a list")
                _ct_test_section_add_content(${handle} list)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hi\nhello;world")
            ct_end_section()
        ct_end_section()

        ct_add_section("list")
            _ct_test_section_add_content(${handle} list)
            test_section(GET_CONTENT ${handle} result)
            ct_assert_equal(result "hello;world")

            ct_add_section("and an empty string")
                _ct_test_section_add_content(${handle} empty)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hello;world\n")
            ct_end_section()

            ct_add_section("and a non-empty string")
                _ct_test_section_add_content(${handle} string)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hello;world\nhi")
            ct_end_section()

            ct_add_section("and a list")
                _ct_test_section_add_content(${handle} list)
                test_section(GET_CONTENT ${handle} result)
                ct_assert_equal(result "hello;world\nhello;world")
            ct_end_section()
        ct_end_section()
    ct_end_section()
ct_end_test()
