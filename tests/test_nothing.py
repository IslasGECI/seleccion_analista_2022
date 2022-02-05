import pollos_petrel as pp


def test_add_offset():
    augend = 1
    addend = 2
    expected = augend + addend
    obtained = pp.add_offset(augend, addend)
    assert expected == obtained
