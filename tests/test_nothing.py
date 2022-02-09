import pollos_petrel as pp


def test_return_one():
    expected = 1
    obtained = pp.return_one()
    assert expected == obtained
