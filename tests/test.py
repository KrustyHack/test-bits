from asgiref.sync import async_to_sync
import websockets

def test_url(url, data=""):
    conn = async_to_sync(websockets.connect)(url)
    async_to_sync(conn.send)(data)


test_url("ws://default-ws-2zrgqzkpsa-ew.a.run.app")