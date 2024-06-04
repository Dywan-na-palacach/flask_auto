import pytest
from app import app
@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_1(client):
    rv = client.get('/')
    assert rv.data == b'hello world'
