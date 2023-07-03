# adafruitIO.py
class AdafruitIO:
    def __init__(self):
        self._server = "io.adafruit.com"
        self._port = 1883
        self._user = "rq222ah"
        self._key = "aio_key"
        self._lights_feed = "rq222ah/feeds/led"
        self._randoms_feed = "rq222ah/feeds/picow"
        self._temperature_feed = "rq222ah/feeds/temperature"
        self._humidity_feed = "rq222ah/feeds/humidity"
    
    def get_server(self):
        return self._server

    def get_port(self):
        return self._port

    def get_user(self):
        return self._user

    def get_key(self):
        return self._key

    def get_lights_feed(self):
        return self._lights_feed

    def get_randoms_feed(self):
        return self._randoms_feed

    def get_temperature_feed(self):
        return self._temperature_feed

    def get_humidity_feed(self):
        return self._humidity_feed
