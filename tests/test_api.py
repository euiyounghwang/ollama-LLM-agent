import pytest
from main import say_hello

# https://pytest-with-eric.com/pytest-advanced/pytest-fastapi-testing/

def test_api():
    response = say_hello()
    assert response is not None
    assert len(response) > 0