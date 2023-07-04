# adafruitIO.py
class AdafruitIO:
    def __init__(self):
        self._server = "io.adafruit.com"
        self._port = 1883
        self._user = "rq222ah"
        self._key = "aio_EeQn13ObFJLcEKoSJd5KPw0y9jVV"
        self._lights_feed = "rq222ah/feeds/led"
        self._randoms_feed = "rq222ah/feeds/picow"
        self._temperature_feed = "rq222ah/feeds/temperature"
        self._humidity_feed = "rq222ah/feeds/humidity"
# IF this error occurs: then generate a new key or just change a character in the key then save and try it again which fails of course then change it back and save and try it again and it works.  I think it is a bug in the firmware.
#  Connected on 192.168.10.144
# [dev] Could not import main.py.
# Traceback (most recent call last):
#   File "<stdin>", line 29, in <module>
#   File "<stdin>", line 22, in <module>
#   File "main.py", line 111, in <module>
#   File "lib/mqtt.py", line 96, in connect
# MQTTException: 5
    
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
