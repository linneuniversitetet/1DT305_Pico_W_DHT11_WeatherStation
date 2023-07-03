[33mcommit 1f91ebd85bdbaf9cfc5018e1a86deecbc9b35b81[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: Rashed Qazizada <rashed.qazizada@softhouse.se>
Date:   Mon Jul 3 22:45:32 2023 +0200

    Revert "finalizes the code"
    
    This reverts commit 5126997a480fad91f63073bab6decfdba4f25f2a.

[1mdiff --git a/adafruitIO.py b/adafruitIO.py[m
[1mdeleted file mode 100644[m
[1mindex 481b290..0000000[m
[1m--- a/adafruitIO.py[m
[1m+++ /dev/null[m
[36m@@ -1,35 +0,0 @@[m
[31m-# adafruitIO.py[m
[31m-class AdafruitIO:[m
[31m-    def __init__(self):[m
[31m-        self._server = "io.adafruit.com"[m
[31m-        self._port = 1883[m
[31m-        self._user = "rq222ah"[m
[31m-        self._key = "aio_Btor85bULnF0meHQCyECKE9uCibw"[m
[31m-        self._lights_feed = "rq222ah/feeds/led"[m
[31m-        self._randoms_feed = "rq222ah/feeds/picow"[m
[31m-        self._temperature_feed = "rq222ah/feeds/temperature"[m
[31m-        self._humidity_feed = "rq222ah/feeds/humidity"[m
[31m-    [m
[31m-    def get_server(self):[m
[31m-        return self._server[m
[31m-[m
[31m-    def get_port(self):[m
[31m-        return self._port[m
[31m-[m
[31m-    def get_user(self):[m
[31m-        return self._user[m
[31m-[m
[31m-    def get_key(self):[m
[31m-        return self._key[m
[31m-[m
[31m-    def get_lights_feed(self):[m
[31m-        return self._lights_feed[m
[31m-[m
[31m-    def get_randoms_feed(self):[m
[31m-        return self._randoms_feed[m
[31m-[m
[31m-    def get_temperature_feed(self):[m
[31m-        return self._temperature_feed[m
[31m-[m
[31m-    def get_humidity_feed(self):[m
[31m-        return self._humidity_feed[m
[1mdiff --git a/main.py b/main.py[m
[1mindex 1663c1b..3d9ceed 100644[m
[1m--- a/main.py[m
[1m+++ b/main.py[m
[36m@@ -7,30 +7,30 @@[m [mimport random                 # Random number generator[m
 from machine import Pin       # Define pin[m
 from secrets import secrets[m
 import dht                 # import the builtin library[m
[31m-from adafruitIO import AdafruitIO    # Import the new AdafruitIO class[m
[31m-[m
[31m-[m
[31m-tempSensor = dht.DHT11(Pin(27))     [m
 [m
[32m+[m[32mtempSensor = dht.DHT11(Pin(27))     # DHT11 Constructor[m[41m [m
 # BEGIN SETTINGS[m
[31m-RANDOMS_INTERVAL = 10000    # milliseconds[m
[32m+[m[32m# These need to be change to suit your environment[m
[32m+[m[32mRANDOMS_INTERVAL = 100000    # milliseconds[m
 last_random_sent_ticks = 0  # milliseconds[m
 led = Pin("LED", Pin.OUT)   # led pin initialization for Raspberry Pi Pico W[m
 [m
[32m+[m
 # Adafruit IO (AIO) configuration[m
[31m-aio = AdafruitIO()    # Instantiate AdafruitIO object[m
[31m-AIO_SERVER = aio.get_server()[m
[31m-AIO_PORT = aio.get_port()[m
[31m-AIO_USER = aio.get_user()[m
[31m-AIO_KEY = aio.get_key()[m
[31m-AIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())  [m
[31m-AIO_LIGHTS_FEED = aio.get_lights_feed()[m
[31m-AIO_RANDOMS_FEED = aio.get_randoms_feed()[m
[31m-AIO_TEMPERATURE_FEED = aio.get_temperature_feed()[m
[31m-AIO_HUMIDITY_FEED = aio.get_humidity_feed()[m
[32m+[m[32mAIO_SERVER = "io.adafruit.com"[m
[32m+[m[32mAIO_PORT = 1883[m
[32m+[m[32mAIO_USER = "rq222ah"[m
[32m+[m[32mAIO_KEY = "aio_key"[m
[32m+[m[32mAIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())  # Can be anything[m
[32m+[m[32mAIO_LIGHTS_FEED = "rq222ah/feeds/led"[m
[32m+[m[32mAIO_RANDOMS_FEED = "rq222ah/feeds/picow"[m
[32m+[m[32mAIO_TEMPERATURE_FEED = "rq222ah/feeds/temperature"[m
[32m+[m[32mAIO_HUMIDITY_FEED = "rq222ah/feeds/humidity"[m
 [m
 # END SETTINGS[m
 [m
[32m+[m
[32m+[m
 # FUNCTIONS[m
 [m
 # Function to connect Pico to the WiFi[m
[36m@@ -56,6 +56,8 @@[m [mdef do_connect():[m
     print('\nConnected on {}'.format(ip))[m
     return ip [m
 [m
[32m+[m
[32m+[m
 # Callback Function to respond to messages from Adafruit IO[m
 def sub_cb(topic, msg):          # sub_cb means "callback subroutine"[m
     print((topic, msg))          # Outputs the message that was received. Debugging use.[m
[36m@@ -112,6 +114,7 @@[m [mclient.subscribe(AIO_LIGHTS_FEED)[m
 print("Connected to %s, subscribed to %s topic" % (AIO_SERVER, AIO_LIGHTS_FEED))[m
 [m
 [m
[32m+[m
 try:                      # Code between try: and finally: may cause an error[m
                           # so ensure the client disconnects the server if[m
                           # that happens.[m
[1mdiff --git a/secrets.py b/secrets.py[m
[1mindex d090c4c..553ccfe 100644[m
[1m--- a/secrets.py[m
[1m+++ b/secrets.py[m
[36m@@ -1,4 +1,4 @@[m
 secrets = {[m
[31m-   'WIFI_SSID' : 'TN_24GHz_D20465',[m
[31m-   'WIFI_PASS' : 'B42C3E878A',[m
[32m+[m[32m   'WIFI_SSID' : 'wifi network',[m
[32m+[m[32m   'WIFI_PASS' : 'wifi password',[m
    }[m

[33mcommit 5126997a480fad91f63073bab6decfdba4f25f2a[m[33m ([m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Rashed Qazizada <rashed.qazizada@softhouse.se>
Date:   Mon Jul 3 22:43:09 2023 +0200

    finalizes the code

[1mdiff --git a/adafruitIO.py b/adafruitIO.py[m
[1mnew file mode 100644[m
[1mindex 0000000..481b290[m
[1m--- /dev/null[m
[1m+++ b/adafruitIO.py[m
[36m@@ -0,0 +1,35 @@[m
[32m+[m[32m# adafruitIO.py[m
[32m+[m[32mclass AdafruitIO:[m
[32m+[m[32m    def __init__(self):[m
[32m+[m[32m        self._server = "io.adafruit.com"[m
[32m+[m[32m        self._port = 1883[m
[32m+[m[32m        self._user = "rq222ah"[m
[32m+[m[32m        self._key = "aio_Btor85bULnF0meHQCyECKE9uCibw"[m
[32m+[m[32m        self._lights_feed = "rq222ah/feeds/led"[m
[32m+[m[32m        self._randoms_feed = "rq222ah/feeds/picow"[m
[32m+[m[32m        self._temperature_feed = "rq222ah/feeds/temperature"[m
[32m+[m[32m        self._humidity_feed = "rq222ah/feeds/humidity"[m
[32m+[m[41m    [m
[32m+[m[32m    def get_server(self):[m
[32m+[m[32m        return self._server[m
[32m+[m
[32m+[m[32m    def get_port(self):[m
[32m+[m[32m        return self._port[m
[32m+[m
[32m+[m[32m    def get_user(self):[m
[32m+[m[32m        return self._user[m
[32m+[m
[32m+[m[32m    def get_key(self):[m
[32m+[m[32m        return self._key[m
[32m+[m
[32m+[m[32m    def get_lights_feed(self):[m
[32m+[m[32m        return self._lights_feed[m
[32m+[m
[32m+[m[32m    def get_randoms_feed(self):[m
[32m+[m[32m        return self._randoms_feed[m
[32m+[m
[32m+[m[32m    def get_temperature_feed(self):[m
[32m+[m[32m        return self._temperature_feed[m
[32m+[m
[32m+[m[32m    def get_humidity_feed(self):[m
[32m+[m[32m        return self._humidity_feed[m
[1mdiff --git a/main.py b/main.py[m
[1mindex 3d9ceed..1663c1b 100644[m
[1m--- a/main.py[m
[1m+++ b/main.py[m
[36m@@ -7,30 +7,30 @@[m [mimport random                 # Random number generator[m
 from machine import Pin       # Define pin[m
 from secrets import secrets[m
 import dht                 # import the builtin library[m
[32m+[m[32mfrom adafruitIO import AdafruitIO    # Import the new AdafruitIO class[m
[32m+[m
[32m+[m
[32m+[m[32mtempSensor = dht.DHT11(Pin(27))[m[41m     [m
 [m
[31m-tempSensor = dht.DHT11(Pin(27))     # DHT11 Constructor [m
 # BEGIN SETTINGS[m
[31m-# These need to be change to suit your environment[m
[31m-RANDOMS_INTERVAL = 100000    # milliseconds[m
[32m+[m[32mRANDOMS_INTERVAL = 10000    # milliseconds[m
 last_random_sent_ticks = 0  # milliseconds[m
 led = Pin("LED", Pin.OUT)   # led pin initialization for Raspberry Pi Pico W[m
 [m
[31m-[m
 # Adafruit IO (AIO) configuration[m
[31m-AIO_SERVER = "io.adafruit.com"[m
[31m-AIO_PORT = 1883[m
[31m-AIO_USER = "rq222ah"[m
[31m-AIO_KEY = "aio_key"[m
[31m-AIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())  # Can be anything[m
[31m-AIO_LIGHTS_FEED = "rq222ah/feeds/led"[m
[31m-AIO_RANDOMS_FEED = "rq222ah/feeds/picow"[m
[31m-AIO_TEMPERATURE_FEED = "rq222ah/feeds/temperature"[m
[31m-AIO_HUMIDITY_FEED = "rq222ah/feeds/humidity"[m
[32m+[m[32maio = AdafruitIO()    # Instantiate AdafruitIO object[m
[32m+[m[32mAIO_SERVER = aio.get_server()[m
[32m+[m[32mAIO_PORT = aio.get_port()[m
[32m+[m[32mAIO_USER = aio.get_user()[m
[32m+[m[32mAIO_KEY = aio.get_key()[m
[32m+[m[32mAIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())[m[41m  [m
[32m+[m[32mAIO_LIGHTS_FEED = aio.get_lights_feed()[m
[32m+[m[32mAIO_RANDOMS_FEED = aio.get_randoms_feed()[m
[32m+[m[32mAIO_TEMPERATURE_FEED = aio.get_temperature_feed()[m
[32m+[m[32mAIO_HUMIDITY_FEED = aio.get_humidity_feed()[m
 [m
 # END SETTINGS[m
 [m
[31m-[m
[31m-[m
 # FUNCTIONS[m
 [m
 # Function to connect Pico to the WiFi[m
[36m@@ -56,8 +56,6 @@[m [mdef do_connect():[m
     print('\nConnected on {}'.format(ip))[m
     return ip [m
 [m
[31m-[m
[31m-[m
 # Callback Function to respond to messages from Adafruit IO[m
 def sub_cb(topic, msg):          # sub_cb means "callback subroutine"[m
     print((topic, msg))          # Outputs the message that was received. Debugging use.[m
[36m@@ -114,7 +112,6 @@[m [mclient.subscribe(AIO_LIGHTS_FEED)[m
 print("Connected to %s, subscribed to %s topic" % (AIO_SERVER, AIO_LIGHTS_FEED))[m
 [m
 [m
[31m-[m
 try:                      # Code between try: and finally: may cause an error[m
                           # so ensure the client disconnects the server if[m
                           # that happens.[m
[1mdiff --git a/secrets.py b/secrets.py[m
[1mindex 553ccfe..d090c4c 100644[m
[1m--- a/secrets.py[m
[1m+++ b/secrets.py[m
[36m@@ -1,4 +1,4 @@[m
 secrets = {[m
[31m-   'WIFI_SSID' : 'wifi network',[m
[31m-   'WIFI_PASS' : 'wifi password',[m
[32m+[m[32m   'WIFI_SSID' : 'TN_24GHz_D20465',[m
[32m+[m[32m   'WIFI_PASS' : 'B42C3E878A',[m
    }[m

[33mcommit c30829c80fcf1d87f23d0e9180a38245b363eae1[m
Author: Rashed Qazizada <rashed.qazizada@softhouse.se>
Date:   Mon Jul 3 18:17:32 2023 +0200

    finalizes the code

[1mdiff --git a/.gitignore b/.gitignore[m
[1mindex 68bc17f..97a2b06 100644[m
[1m--- a/.gitignore[m
[1m+++ b/.gitignore[m
[36m@@ -14,7 +14,6 @@[m [mdist/[m
 downloads/[m
 eggs/[m
 .eggs/[m
[31m-lib/[m
 lib64/[m
 parts/[m
 sdist/[m
[1mdiff --git a/boot.py b/boot.py[m
[1mindex c31f614..f634026 100644[m
[1m--- a/boot.py[m
[1m+++ b/boot.py[m
[36m@@ -2,17 +2,12 @@[m
 import network, utime[m
 from secrets import secrets[m
 [m
[31m-# Replace the following with your WIFI Credentials[m
[31m-# SSID = "iotlab"[m
[31m-# SSID_PASSWORD = "modermodemet"[m
[31m-[m
[31m-[m
 def do_connect():[m
     sta_if = network.WLAN(network.STA_IF)[m
     if not sta_if.isconnected():[m
         print('connecting to network...')[m
         sta_if.active(True)[m
[31m-        sta_if.connect(secrets["SSID"], secrets["SSID_PASSWORD"])[m
[32m+[m[32m        sta_if.connect(secrets["WIFI_SSID"], secrets["WIFI_PASS"])[m
         while not sta_if.isconnected():[m
             print("Attempting to connect....")[m
             utime.sleep(1)[m
[1mdiff --git a/lib/mqtt.py b/lib/mqtt.py[m
[1mnew file mode 100644[m
[1mindex 0000000..014a168[m
[1m--- /dev/null[m
[1m+++ b/lib/mqtt.py[m
[36m@@ -0,0 +1,201 @@[m
[32m+[m[32m#!/usr/bin/env python[m
[32m+[m[32m#[m
[32m+[m[32m# Copyright (c) 2019, Pycom Limited.[m
[32m+[m[32m#[m
[32m+[m[32m# This software is licensed under the GNU GPL version 3 or any[m
[32m+[m[32m# later version, with permitted additional terms. For more information[m
[32m+[m[32m# see the Pycom Licence v1.0 document supplied with this file, or[m
[32m+[m[32m# available at https://www.pycom.io/opensource/licensing[m
[32m+[m[32m#[m
[32m+[m
[32m+[m[32mimport usocket as socket[m
[32m+[m[32mimport ustruct as struct[m
[32m+[m[32mfrom ubinascii import hexlify[m
[32m+[m
[32m+[m[32mclass MQTTException(Exception):[m
[32m+[m[32m    pass[m
[32m+[m
[32m+[m[32mclass MQTTClient:[m
[32m+[m
[32m+[m[32m    def __init__(self, client_id, server, port=0, user=None, password=None, keepalive=0,[m
[32m+[m[32m                ssl=False, ssl_params={}):[m
[32m+[m[32m        if port == 0:[m
[32m+[m[32m            port = 8883 if ssl else 1883[m
[32m+[m[32m        self.client_id = client_id[m
[32m+[m[32m        self.sock = None[m
[32m+[m[32m        self.addr = socket.getaddrinfo(server, port)[0][-1][m
[32m+[m[32m        self.ssl = ssl[m
[32m+[m[32m        self.ssl_params = ssl_params[m
[32m+[m[32m        self.pid = 0[m
[32m+[m[32m        self.cb = None[m
[32m+[m[32m        self.user = user[m
[32m+[m[32m        self.pswd = password[m
[32m+[m[32m        self.keepalive = keepalive[m
[32m+[m[32m        self.lw_topic = None[m
[32m+[m[32m        self.lw_msg = None[m
[32m+[m[32m        self.lw_qos = 0[m
[32m+[m[32m        self.lw_retain = False[m
[32m+[m
[32m+[m[32m    def _send_str(self, s):[m
[32m+[m[32m        self.sock.write(struct.pack("!H", len(s)))[m
[32m+[m[32m        self.sock.write(s)[m
[32m+[m
[32m+[m[32m    def _recv_len(self):[m
[32m+[m[32m        n = 0[m
[32m+[m[32m        sh = 0[m
[32m+[m[32m        while 1:[m
[32m+[m[32m            b = self.sock.read(1)[0][m
[32m+[m[32m            n |= (b & 0x7f) << sh[m
[32m+[m[32m            if not b & 0x80:[m
[32m+[m[32m                return n[m
[32m+[m[32m            sh += 7[m
[32m+[m
[32m+[m[32m    def set_callback(self, f):[m
[32m+[m[32m        self.cb = f[m
[32m+[m
[32m+[m[32m    def set_last_will(self, topic, msg, retain=False, qos=0):[m
[32m+[m[32m        assert 0 <= qos <= 2[m
[32m+[m[32m        assert topic[m
[32m+[m[32m        self.lw_topic = topic[m
[32m+[m[32m        self.lw_msg = msg[m
[32m+[m[32m        self.lw_qos = qos[m
[32m+[m[32m        self.lw_retain = retain[m
[32m+[m
[32m+[m[32m    def connect(self, clean_session=True):[m
[32m+[m[32m        self.sock = socket.socket()[m
[32m+[m[32m        self.sock.connect(self.addr)[m
[32m+[m[32m        if self.ssl:[m
[32m+[m[32m            import ussl[m
[32m+[m[32m            self.sock = ussl.wrap_socket(self.sock, **self.ssl_params)[m
[32m+[m[32m        msg = bytearray(b"\x10\0\0\x04MQTT\x04\x02\0\0")[m
[32m+[m[32m        msg[1] = 10 + 2 + len(self.client_id)[m
[32m+[m[32m        msg[9] = clean_session << 1[m
[32m+[m[32m        if self.user is not None:[m
[32m+[m[32m            msg[1] += 2 + len(self.user) + 2 + len(self.pswd)[m
[32m+[m[32m            msg[9] |= 0xC0[m
[32m+[m[32m        if self.keepalive:[m
[32m+[m[32m            assert self.keepalive < 65536[m
[32m+[m[32m            msg[10] |= self.keepalive >> 8[m
[32m+[m[32m            msg[11] |= self.keepalive & 0x00FF[m
[32m+[m[32m        if self.lw_topic:[m
[32m+[m[32m            msg[1] += 2 + len(self.lw_topic) + 2 + len(self.lw_msg)[m
[32m+[m[32m            msg[9] |= 0x4 | (self.lw_qos & 0x1) << 3 | (self.lw_qos & 0x2) << 3[m
[32m+[m[32m            msg[9] |= self.lw_retain << 5[m
[32m+[m[32m        self.sock.write(msg)[m
[32m+[m[32m        #print(hex(len(msg)), hexlify(msg, ":"))[m
[32m+[m[32m        self._send_str(self.client_id)[m
[32m+[m[32m        if self.lw_topic:[m
[32m+[m[32m            self._send_str(self.lw_topic)[m
[32m+[m[32m            self._send_str(self.lw_msg)[m
[32m+[m[32m        if self.user is not None:[m
[32m+[m[32m            self._send_str(self.user)[m
[32m+[m[32m            self._send_str(self.pswd)[m
[32m+[m[32m        resp = self.sock.read(4)[m
[32m+[m[32m        assert resp[0] == 0x20 and resp[1] == 0x02[m
[32m+[m[32m        if resp[3] != 0:[m
[32m+[m[32m            raise MQTTException(resp[3])[m
[32m+[m[32m        return resp[2] & 1[m
[32m+[m
[32m+[m[32m    def disconnect(self):[m
[32m+[m[32m        self.sock.write(b"\xe0\0")[m
[32m+[m[32m        self.sock.close()[m
[32m+[m
[32m+[m[32m    def ping(self):[m
[32m+[m[32m        self.sock.write(b"\xc0\0")[m
[32m+[m
[32m+[m[32m    def publish(self, topic, msg, retain=False, qos=0):[m
[32m+[m[32m        pkt = bytearray(b"\x30\0\0\0")[m
[32m+[m[32m        pkt[0] |= qos << 1 | retain[m
[32m+[m[32m        sz = 2 + len(topic) + len(msg)[m
[32m+[m[32m        if qos > 0:[m
[32m+[m[32m            sz += 2[m
[32m+[m[32m        assert sz < 2097152[m
[32m+[m[32m        i = 1[m
[32m+[m[32m        while sz > 0x7f:[m
[32m+[m[32m            pkt[i] = (sz & 0x7f) | 0x80[m
[32m+[m[32m            sz >>= 7[m
[32m+[m[32m            i += 1[m
[32m+[m[32m        pkt[i] = sz[m
[32m+[m[32m        #print(hex(len(pkt)), hexlify(pkt, ":"))[m
[32m+[m[32m        self.sock.write(pkt, i + 1)[m
[32m+[m[32m        self._send_str(topic)[m
[32m+[m[32m        if qos > 0:[m
[32m+[m[32m            self.pid += 1[m
[32m+[m[32m            pid = self.pid[m
[32m+[m[32m            struct.pack_into("!H", pkt, 0, pid)[m
[32m+[m[32m            self.sock.write(pkt, 2)[m
[32m+[m[32m        self.sock.write(msg)[m
[32m+[m[32m        if qos == 1:[m
[32m+[m[32m            while 1:[m
[32m+[m[32m                op = self.wait_msg()[m
[32m+[m[32m                if op == 0x40:[m
[32m+[m[32m                    sz = self.sock.read(1)[m
[32m+[m[32m                    assert sz == b"\x02"[m
[32m+[m[32m                    rcv_pid = self.sock.read(2)[m
[32m+[m[32m                    rcv_pid = rcv_pid[0] << 8 | rcv_pid[1][m
[32m+[m[32m                    if pid == rcv_pid:[m
[32m+[m[32m                        return[m
[32m+[m[32m        elif qos == 2:[m
[32m+[m[32m            assert 0[m
[32m+[m
[32m+[m[32m    def subscribe(self, topic, qos=0):[m
[32m+[m[32m        assert self.cb is not None, "Subscribe callback is not set"[m
[32m+[m[32m        pkt = bytearray(b"\x82\0\0\0")[m
[32m+[m[32m        self.pid += 1[m
[32m+[m[32m        struct.pack_into("!BH", pkt, 1, 2 + 2 + len(topic) + 1, self.pid)[m
[32m+[m[32m        #print(hex(len(pkt)), hexlify(pkt, ":"))[m
[32m+[m[32m        self.sock.write(pkt)[m
[32m+[m[32m        self._send_str(topic)[m
[32m+[m[32m        self.sock.write(qos.to_bytes(1, 'little'))[m
[32m+[m[32m        while 1:[m
[32m+[m[32m            op = self.wait_msg()[m
[32m+[m[32m            if op == 0x90:[m
[32m+[m[32m                resp = self.sock.read(4)[m
[32m+[m[32m                #print(resp)[m
[32m+[m[32m                assert resp[1] == pkt[2] and resp[2] == pkt[3][m
[32m+[m[32m                if resp[3] == 0x80:[m
[32m+[m[32m                    raise MQTTException(resp[3])[m
[32m+[m[32m                return[m
[32m+[m
[32m+[m[32m    # Wait for a single incoming MQTT message and process it.[m
[32m+[m[32m    # Subscribed messages are delivered to a callback previously[m
[32m+[m[32m    # set by .set_callback() method. Other (internal) MQTT[m
[32m+[m[32m    # messages processed internally.[m
[32m+[m[32m    def wait_msg(self):[m
[32m+[m[32m        res = self.sock.read(1)[m
[32m+[m[32m        self.sock.setblocking(True)[m
[32m+[m[32m        if res is None:[m
[32m+[m[32m            return None[m
[32m+[m[32m        if res == b"":[m
[32m+[m[32m            raise OSError(-1)[m
[32m+[m[32m        if res == b"\xd0":  # PINGRESP[m
[32m+[m[32m            sz = self.sock.read(1)[0][m
[32m+[m[32m            assert sz == 0[m
[32m+[m[32m            return None[m
[32m+[m[32m        op = res[0][m
[32m+[m[32m        if op & 0xf0 != 0x30:[m
[32m+[m[32m            return op[m
[32m+[m[32m        sz = self._recv_len()[m
[32m+[m[32m        topic_len = self.sock.read(2)[m
[32m+[m[32m        topic_len = (topic_len[0] << 8) | topic_len[1][m
[32m+[m[32m        topic = self.sock.read(topic_len)[m
[32m+[m[32m        sz -= topic_len + 2[m
[32m+[m[32m        if op & 6:[m
[32m+[m[32m            pid = self.sock.read(2)[m
[32m+[m[32m            pid = pid[0] << 8 | pid[1][m
[32m+[m[32m            sz -= 2[m
[32m+[m[32m        msg = self.sock.read(sz)[m
[32m+[m[32m        self.cb(topic, msg)[m
[32m+[m[32m        if op & 6 == 2:[m
[32m+[m[32m            pkt = bytearray(b"\x40\x02\0\0")[m
[32m+[m[32m            struct.pack_into("!H", pkt, 2, pid)[m
[32m+[m[32m            self.sock.write(pkt)[m
[32m+[m[32m        elif op & 6 == 4:[m
[32m+[m[32m            assert 0[m
[32m+[m
[32m+[m[32m    # Checks whether a pending message from server is available.[m
[32m+[m[32m    # If not, returns immediately with None. Otherwise, does[m
[32m+[m[32m    # the same processing as wait_msg.[m
[32m+[m[32m    def check_msg(self):[m
[32m+[m[32m        self.sock.setblocking(False)[m
[32m+[m[32m        return self.wait_msg()[m
\ No newline at end of file[m
[1mdiff --git a/main.py b/main.py[m
[1mindex f2a7f72..3d9ceed 100644[m
[1m--- a/main.py[m
[1m+++ b/main.py[m
[36m@@ -11,19 +11,16 @@[m [mimport dht                 # import the builtin library[m
 tempSensor = dht.DHT11(Pin(27))     # DHT11 Constructor [m
 # BEGIN SETTINGS[m
 # These need to be change to suit your environment[m
[31m-RANDOMS_INTERVAL = 10000    # milliseconds[m
[32m+[m[32mRANDOMS_INTERVAL = 100000    # milliseconds[m
 last_random_sent_ticks = 0  # milliseconds[m
 led = Pin("LED", Pin.OUT)   # led pin initialization for Raspberry Pi Pico W[m
 [m
[31m-# # Wireless network[m
[31m-# WIFI_SSID = "TN_24GHz_D20465"[m
[31m-# WIFI_PASS = "B42C3E878A" # No this is not our regular password. :)[m
 [m
 # Adafruit IO (AIO) configuration[m
 AIO_SERVER = "io.adafruit.com"[m
 AIO_PORT = 1883[m
 AIO_USER = "rq222ah"[m
[31m-AIO_KEY = "aio_EsuN55DL3Z0xHUybR2IOResgSK7C"[m
[32m+[m[32mAIO_KEY = "aio_key"[m
 AIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())  # Can be anything[m
 AIO_LIGHTS_FEED = "rq222ah/feeds/led"[m
 AIO_RANDOMS_FEED = "rq222ah/feeds/picow"[m
[1mdiff --git a/secrets.py b/secrets.py[m
[1mindex 9e88dc6..553ccfe 100644[m
[1m--- a/secrets.py[m
[1m+++ b/secrets.py[m
[36m@@ -1,4 +1,4 @@[m
 secrets = {[m
[31m-   'SSID' : 'your wifi',[m
[31m-   'SSID_PASSWORD' : 'wifi password',[m
[32m+[m[32m   'WIFI_SSID' : 'wifi network',[m
[32m+[m[32m   'WIFI_PASS' : 'wifi password',[m
    }[m

[33mcommit 8d68c35c11a032093b8fc1070de8244b510619e7[m
Author: Rashed Qazizada <rashed.qazizada@softhouse.se>
Date:   Mon Jul 3 10:59:22 2023 +0200

    removes umqtt class

[1mdiff --git a/umqttsimple.py b/umqttsimple.py[m
[1mdeleted file mode 100644[m
[1mindex 269da1d..0000000[m
[1m--- a/umqttsimple.py[m
[1m+++ /dev/null[m
[36m@@ -1,216 +0,0 @@[m
[31m-import usocket as socket[m
[31m-import ustruct as struct[m
[31m-from ubinascii import hexlify[m
[31m-[m
[31m-[m
[31m-class MQTTException(Exception):[m
[31m-    pass[m
[31m-[m
[31m-[m
[31m-class MQTTClient:[m
[31m-    def __init__([m
[31m-        self,[m
[31m-        client_id,[m
[31m-        server,[m
[31m-        port=0,[m
[31m-        user=None,[m
[31m-        password=None,[m
[31m-        keepalive=0,[m
[31m-        ssl=False,[m
[31m-        ssl_params={},[m
[31m-    ):[m
[31m-        if port == 0:[m
[31m-            port = 8883 if ssl else 1883[m
[31m-        self.client_id = client_id[m
[31m-        self.sock = None[m
[31m-        self.server = server[m
[31m-        self.port = port[m
[31m-        self.ssl = ssl[m
[31m-        self.ssl_params = ssl_params[m
[31m-        self.pid = 0[m
[31m-        self.cb = None[m
[31m-        self.user = user[m
[31m-        self.pswd = password[m
[31m-        self.keepalive = keepalive[m
[31m-        self.lw_topic = None[m
[31m-        self.lw_msg = None[m
[31m-        self.lw_qos = 0[m
[31m-        self.lw_retain = False[m
[31m-[m
[31m-    def _send_str(self, s):[m
[31m-        self.sock.write(struct.pack("!H", len(s)))[m
[31m-        self.sock.write(s)[m
[31m-[m
[31m-    def _recv_len(self):[m
[31m-        n = 0[m
[31m-        sh = 0[m
[31m-        while 1:[m
[31m-            b = self.sock.read(1)[0][m
[31m-            n |= (b & 0x7F) << sh[m
[31m-            if not b & 0x80:[m
[31m-                return n[m
[31m-            sh += 7[m
[31m-[m
[31m-    def set_callback(self, f):[m
[31m-        self.cb = f[m
[31m-[m
[31m-    def set_last_will(self, topic, msg, retain=False, qos=0):[m
[31m-        assert 0 <= qos <= 2[m
[31m-        assert topic[m
[31m-        self.lw_topic = topic[m
[31m-        self.lw_msg = msg[m
[31m-        self.lw_qos = qos[m
[31m-        self.lw_retain = retain[m
[31m-[m
[31m-    def connect(self, clean_session=True):[m
[31m-        self.sock = socket.socket()[m
[31m-        addr = socket.getaddrinfo(self.server, self.port)[0][-1][m
[31m-        self.sock.connect(addr)[m
[31m-        if self.ssl:[m
[31m-            import ussl[m
[31m-[m
[31m-            self.sock = ussl.wrap_socket(self.sock, **self.ssl_params)[m
[31m-        premsg = bytearray(b"\x10\0\0\0\0\0")[m
[31m-        msg = bytearray(b"\x04MQTT\x04\x02\0\0")[m
[31m-[m
[31m-        sz = 10 + 2 + len(self.client_id)[m
[31m-        msg[6] = clean_session << 1[m
[31m-        if self.user is not None:[m
[31m-            sz += 2 + len(self.user) + 2 + len(self.pswd)[m
[31m-            msg[6] |= 0xC0[m
[31m-        if self.keepalive:[m
[31m-            assert self.keepalive < 65536[m
[31m-            msg[7] |= self.keepalive >> 8[m
[31m-            msg[8] |= self.keepalive & 0x00FF[m
[31m-        if self.lw_topic:[m
[31m-            sz += 2 + len(self.lw_topic) + 2 + len(self.lw_msg)[m
[31m-            msg[6] |= 0x4 | (self.lw_qos & 0x1) << 3 | (self.lw_qos & 0x2) << 3[m
[31m-            msg[6] |= self.lw_retain << 5[m
[31m-[m
[31m-        i = 1[m
[31m-        while sz > 0x7F:[m
[31m-            premsg[i] = (sz & 0x7F) | 0x80[m
[31m-            sz >>= 7[m
[31m-            i += 1[m
[31m-        premsg[i] = sz[m
[31m-[m
[31m-        self.sock.write(premsg, i + 2)[m
[31m-        self.sock.write(msg)[m
[31m-        # print(hex(len(msg)), hexlify(msg, ":"))[m
[31m-        self._send_str(self.client_id)[m
[31m-        if self.lw_topic:[m
[31m-            self._send_str(self.lw_topic)[m
[31m-            self._send_str(self.lw_msg)[m
[31m-        if self.user is not None:[m
[31m-            self._send_str(self.user)[m
[31m-            self._send_str(self.pswd)[m
[31m-        resp = self.sock.read(4)[m
[31m-        assert resp[0] == 0x20 and resp[1] == 0x02[m
[31m-        if resp[3] != 0:[m
[31m-            raise MQTTException(resp[3])[m
[31m-        return resp[2] & 1[m
[31m-[m
[31m-    def disconnect(self):[m
[31m-        self.sock.write(b"\xe0\0")[m
[31m-        self.sock.close()[m
[31m-[m
[31m-    def ping(self):[m
[31m-        self.sock.write(b"\xc0\0")[m
[31m-[m
[31m-    def publish(self, topic, msg, retain=False, qos=0):[m
[31m-        pkt = bytearray(b"\x30\0\0\0")[m
[31m-        pkt[0] |= qos << 1 | retain[m
[31m-        sz = 2 + len(topic) + len(msg)[m
[31m-        if qos > 0:[m
[31m-            sz += 2[m
[31m-        assert sz < 2097152[m
[31m-        i = 1[m
[31m-        while sz > 0x7F:[m
[31m-            pkt[i] = (sz & 0x7F) | 0x80[m
[31m-            sz >>= 7[m
[31m-            i += 1[m
[31m-        pkt[i] = sz[m
[31m-        # print(hex(len(pkt)), hexlify(pkt, ":"))[m
[31m-        self.sock.write(pkt, i + 1)[m
[31m-        self._send_str(topic)[m
[31m-        if qos > 0:[m
[31m-            self.pid += 1[m
[31m-            pid = self.pid[m
[31m-            struct.pack_into("!H", pkt, 0, pid)[m
[31m-            self.sock.write(pkt, 2)[m
[31m-        self.sock.write(msg)[m
[31m-        if qos == 1:[m
[31m-            while 1:[m
[31m-                op = self.wait_msg()[m
[31m-                if op == 0x40:[m
[31m-                    sz = self.sock.read(1)[m
[31m-                    assert sz == b"\x02"[m
[31m-                    rcv_pid = self.sock.read(2)[m
[31m-                    rcv_pid = rcv_pid[0] << 8 | rcv_pid[1][m
[31m-                    if pid == rcv_pid:[m
[31m-                        return[m
[31m-        elif qos == 2:[m
[31m-            assert 0[m
[31m-[m
[31m-    def subscribe(self, topic, qos=0):[m
[31m-        assert self.cb is not None, "Subscribe callback is not set"[m
[31m-        pkt = bytearray(b"\x82\0\0\0")[m
[31m-        self.pid += 1[m
[31m-        struct.pack_into("!BH", pkt, 1, 2 + 2 + len(topic) + 1, self.pid)[m
[31m-        # print(hex(len(pkt)), hexlify(pkt, ":"))[m
[31m-        self.sock.write(pkt)[m
[31m-        self._send_str(topic)[m
[31m-        self.sock.write(qos.to_bytes(1, "little"))[m
[31m-        while 1:[m
[31m-            op = self.wait_msg()[m
[31m-            if op == 0x90:[m
[31m-                resp = self.sock.read(4)[m
[31m-                # print(resp)[m
[31m-                assert resp[1] == pkt[2] and resp[2] == pkt[3][m
[31m-                if resp[3] == 0x80:[m
[31m-                    raise MQTTException(resp[3])[m
[31m-                return[m
[31m-[m
[31m-    # Wait for a single incoming MQTT message and process it.[m
[31m-    # Subscribed messages are delivered to a callback previously[m
[31m-    # set by .set_callback() method. Other (internal) MQTT[m
[31m-    # messages processed internally.[m
[31m-    def wait_msg(self):[m
[31m-        res = self.sock.read(1)[m
[31m-        self.sock.setblocking(True)[m
[31m-        if res is None:[m
[31m-            return None[m
[31m-        if res == b"":[m
[31m-            raise OSError(-1)[m
[31m-        if res == b"\xd0":  # PINGRESP[m
[31m-            sz = self.sock.read(1)[0][m
[31m-            assert sz == 0[m
[31m-            return None[m
[31m-        op = res[0][m
[31m-        if op & 0xF0 != 0x30:[m
[31m-            return op[m
[31m-        sz = self._recv_len()[m
[31m-        topic_len = self.sock.read(2)[m
[31m-        topic_len = (topic_len[0] << 8) | topic_len[1][m
[31m-        topic = self.sock.read(topic_len)[m
[31m-        sz -= topic_len + 2[m
[31m-        if op & 6:[m
[31m-            pid = self.sock.read(2)[m
[31m-            pid = pid[0] << 8 | pid[1][m
[31m-            sz -= 2[m
[31m-        msg = self.sock.read(sz)[m
[31m-        self.cb(topic, msg)[m
[31m-        if op & 6 == 2:[m
[31m-            pkt = bytearray(b"\x40\x02\0\0")[m
[31m-            struct.pack_into("!H", pkt, 2, pid)[m
[31m-            self.sock.write(pkt)[m
[31m-        elif op & 6 == 4:[m
[31m-            assert 0[m
[31m-        return op[m
[31m-[m
[31m-    # Checks whether a pending message from server is available.[m
[31m-    # If not, returns immediately with None. Otherwise, does[m
[31m-    # the same processing as wait_msg.[m
[31m-    def check_msg(self):[m
[31m-        self.sock.setblocking(False)[m
[31m-        return self.wait_msg()[m
\ No newline at end of file[m

[33mcommit a86bab580751b795e05b14316b9cf4e65ac6c76c[m
Author: Rashed Qazizada <rashed.qazizada@softhouse.se>
Date:   Mon Jul 3 10:23:19 2023 +0200

    first commit

[1mdiff --git a/.gitignore b/.gitignore[m
[1mnew file mode 100644[m
[1mindex 0000000..68bc17f[m
[1m--- /dev/null[m
[1m+++ b/.gitignore[m
[36m@@ -0,0 +1,160 @@[m
[32m+[m[32m# Byte-compiled / optimized / DLL files[m
[32m+[m[32m__pycache__/[m
[32m+[m[32m*.py[cod][m
[32m+[m[32m*$py.class[m
[32m+[m
[32m+[m[32m# C extensions[m
[32m+[m[32m*.so[m
[32m+[m
[32m+[m[32m# Distribution / packaging[m
[32m+[m[32m.Python[m
[32m+[m[32mbuild/[m
[32m+[m[32mdevelop-eggs/[m
[32m+[m[32mdist/[m
[32m+[m[32mdownloads/[m
[32m+[m[32meggs/[m
[32m+[m[32m.eggs/[m
[32m+[m[32mlib/[m
[32m+[m[32mlib64/[m
[32m+[m[32mparts/[m
[32m+[m[32msdist/[m
[32m+[m[32mvar/[m
[32m+[m[32mwheels/[m
[32m+[m[32mshare/python-wheels/[m
[32m+[m[32m*.egg-info/[m
[32m+[m[32m.installed.cfg[m
[32m+[m[32m*.egg[m
[32m+[m[32mMANIFEST[m
[32m+[m
[32m+[m[32m# PyInstaller[m
[32m+[m[32m#  Usually these files are written by a python script from a template[m
[32m+[m[32m#  before PyInstaller builds the exe, so as to inject date/other infos into it.[m
[32m+[m[32m*.manifest[m
[32m+[m[32m*.spec[m
[32m+[m
[32m+[m[32m# Installer logs[m
[32m+[m[32mpip-log.txt[m
[32m+[m[32mpip-delete-this-directory.txt[m
[32m+[m
[32m+[m[32m# Unit test / coverage reports[m
[32m+[m[32mhtmlcov/[m
[32m+[m[32m.tox/[m
[32m+[m[32m.nox/[m
[32m+[m[32m.coverage[m
[32m+[m[32m.coverage.*[m
[32m+[m[32m.cache[m
[32m+[m[32mnosetests.xml[m
[32m+[m[32mcoverage.xml[m
[32m+[m[32m*.cover[m
[32m+[m[32m*.py,cover[m
[32m+[m[32m.hypothesis/[m
[32m+[m[32m.pytest_cache/[m
[32m+[m[32mcover/[m
[32m+[m
[32m+[m[32m# Translations[m
[32m+[m[32m*.mo[m
[32m+[m[32m*.pot[m
[32m+[m
[32m+[m[32m# Django stuff:[m
[32m+[m[32m*.log[m
[32m+[m[32mlocal_settings.py[m
[32m+[m[32mdb.sqlite3[m
[32m+[m[32mdb.sqlite3-journal[m
[32m+[m
[32m+[m[32m# Flask stuff:[m
[32m+[m[32minstance/[m
[32m+[m[32m.webassets-cache[m
[32m+[m
[32m+[m[32m# Scrapy stuff:[m
[32m+[m[32m.scrapy[m
[32m+[m
[32m+[m[32m# Sphinx documentation[m
[32m+[m[32mdocs/_build/[m
[32m+[m
[32m+[m[32m# PyBuilder[m
[32m+[m[32m.pybuilder/[m
[32m+[m[32mtarget/[m
[32m+[m
[32m+[m[32m# Jupyter Notebook[m
[32m+[m[32m.ipynb_checkpoints[m
[32m+[m
[32m+[m[32m# IPython[m
[32m+[m[32mprofile_default/[m
[32m+[m[32mipython_config.py[m
[32m+[m
[32m+[m[32m# pyenv[m
[32m+[m[32m#   For a library or package, you might want to ignore these files since the code is[m
[32m+[m[32m#   intended to run in multiple environments; otherwise, check them in:[m
[32m+[m[32m# .python-version[m
[32m+[m
[32m+[m[32m# pipenv[m
[32m+[m[32m#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.[m
[32m+[m[32m#   However, in case of collaboration, if having platform-specific dependencies or dependencies[m
[32m+[m[32m#   having no cross-platform support, pipenv may install dependencies that don't work, or not[m
[32m+[m[32m#   install all needed dependencies.[m
[32m+[m[32m#Pipfile.lock[m
[32m+[m
[32m+[m[32m# poetry[m
[32m+[m[32m#   Similar to Pipfile.lock, it is generally recommended to include poetry.lock in version control.[m
[32m+[m[32m#   This is especially recommended for binary packages to ensure reproducibility, and is more[m
[32m+[m[32m#   commonly ignored for libraries.[m
[32m+[m[32m#   https://python-poetry.org/docs/basic-usage/#commit-your-poetrylock-file-to-version-control[m
[32m+[m[32m#poetry.lock[m
[32m+[m
[32m+[m[32m# pdm[m
[32m+[m[32m#   Similar to Pipfile.lock, it is generally recommended to include pdm.lock in version control.[m
[32m+[m[32m#pdm.lock[m
[32m+[m[32m#   pdm stores project-wide configurations in .pdm.toml, but it is recommended to not include it[m
[32m+[m[32m#   in version control.[m
[32m+[m[32m#   https://pdm.fming.dev/#use-with-ide[m
[32m+[m[32m.pdm.toml[m
[32m+[m
[32m+[m[32m# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm[m
[32m+[m[32m__pypackages__/[m
[32m+[m
[32m+[m[32m# Celery stuff[m
[32m+[m[32mcelerybeat-schedule[m
[32m+[m[32mcelerybeat.pid[m
[32m+[m
[32m+[m[32m# SageMath parsed files[m
[32m+[m[32m*.sage.py[m
[32m+[m
[32m+[m[32m# Environments[m
[32m+[m[32m.env[m
[32m+[m[32m.venv[m
[32m+[m[32menv/[m
[32m+[m[32mvenv/[m
[32m+[m[32mENV/[m
[32m+[m[32menv.bak/[m
[32m+[m[32mvenv.bak/[m
[32m+[m
[32m+[m[32m# Spyder project settings[m
[32m+[m[32m.spyderproject[m
[32m+[m[32m.spyproject[m
[32m+[m
[32m+[m[32m# Rope project settings[m
[32m+[m[32m.ropeproject[m
[32m+[m
[32m+[m[32m# mkdocs documentation[m
[32m+[m[32m/site[m
[32m+[m
[32m+[m[32m# mypy[m
[32m+[m[32m.mypy_cache/[m
[32m+[m[32m.dmypy.json[m
[32m+[m[32mdmypy.json[m
[32m+[m
[32m+[m[32m# Pyre type checker[m
[32m+[m[32m.pyre/[m
[32m+[m
[32m+[m[32m# pytype static type analyzer[m
[32m+[m[32m.pytype/[m
[32m+[m
[32m+[m[32m# Cython debug symbols[m
[32m+[m[32mcython_debug/[m
[32m+[m
[32m+[m[32m# PyCharm[m
[32m+[m[32m#  JetBrains specific template is maintained in a separate JetBrains.gitignore that can[m
[32m+[m[32m#  be found at https://github.com/github/gitignore/blob/main/Global/JetBrains.gitignore[m
[32m+[m[32m#  and can be added to the global gitignore or merged into this file.  For a more nuclear[m
[32m+[m[32m#  option (not recommended) you can uncomment the following to ignore the entire idea folder.[m
[32m+[m[32m#.idea/[m
[1mdiff --git a/LICENSE b/LICENSE[m
[1mnew file mode 100644[m
[1mindex 0000000..261eeb9[m
[1m--- /dev/null[m
[1m+++ b/LICENSE[m
[36m@@ -0,0 +1,201 @@[m
[32m+[m[32m                                 Apache License[m
[32m+[m[32m                           Version 2.0, January 2004[m
[32m+[m[32m                        http://www.apache.org/licenses/[m
[32m+[m
[32m+[m[32m   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION[m
[32m+[m
[32m+[m[32m   1. Definitions.[m
[32m+[m
[32m+[m[32m      "License" shall mean the terms and conditions for use, reproduction,[m
[32m+[m[32m      and distribution as defined by Sections 1 through 9 of this document.[m
[32m+[m
[32m+[m[32m      "Licensor" shall mean the copyright owner or entity authorized by[m
[32m+[m[32m      the copyright owner that is granting the License.[m
[32m+[m
[32m+[m[32m      "Legal Entity" shall mean the union of the acting entity and all[m
[32m+[m[32m      other entities that control, are controlled by, or are under common[m
[32m+[m[32m      control with that entity. For the purposes of this definition,[m
[32m+[m[32m      "control" means (i) the power, direct or indirect, to cause the[m
[32m+[m[32m      direction or management of such entity, whether by contract or[m
[32m+[m[32m      otherwise, or (ii) ownership of fifty percent (50%) or more of the[m
[32m+[m[32m      outstanding shares, or (iii) beneficial ownership of such entity.[m
[32m+[m
[32m+[m[32m      "You" (or "Your") shall mean an individual or Legal Entity[m
[32m+[m[32m      exercising permissions granted by this License.[m
[32m+[m
[32m+[m[32m      "Source" form shall mean the preferred form for making modifications,[m
[32m+[m[32m      including but not limited to software source code, documentation[m
[32m+[m[32m      source, and configuration files.[m
[32m+[m
[32m+[m[32m      "Object" form shall mean any form resulting from mechanical[m
[32m+[m[32m      transformation or translation of a Source form, including but[m
[32m+[m[32m      not limited to compiled object code, generated documentation,[m
[32m+[m[32m      and conversions to other media types.[m
[32m+[m
[32m+[m[32m      "Work" shall mean the work of authorship, whether in Source or[m
[32m+[m[32m      Object form, made available under the License, as indicated by a[m
[32m+[m[32m      copyright notice that is included in or attached to the work[m
[32m+[m[32m      (an example is provided in the Appendix below).[m
[32m+[m
[32m+[m[32m      "Derivative Works" shall mean any work, whether in Source or Object[m
[32m+[m[32m      form, that is based on (or derived from) the Work and for which the[m
[32m+[m[32m      editorial revisions, annotations, elaborations, or other modifications[m
[32m+[m[32m      represent, as a whole, an original work of authorship. For the purposes[m
[32m+[m[32m      of this License, Derivative Works shall not include works that remain[m
[32m+[m[32m      separable from, or merely link (or bind by name) to the interfaces of,[m
[32m+[m[32m      the Work and Derivative Works thereof.[m
[32m+[m
[32m+[m[32m      "Contribution" shall mean any work of authorship, including[m
[32m+[m[32m      the original version of the Work and any modifications or additions[m
[32m+[m[32m      to that Work or Derivative Works thereof, that is intentionally[m
[32m+[m[32m      submitted to Licensor for inclusion in the Work by the copyright owner[m
[32m+[m[32m      or by an individual or Legal Entity authorized to submit on behalf of[m
[32m+[m[32m      the copyright owner. For the purposes of this definition, "submitted"[m
[32m+[m[32m      means any form of electronic, verbal, or written communication sent[m
[32m+[m[32m      to the Licensor or its representatives, including but not limited to[m
[32m+[m[32m      communication on electronic mailing lists, source code control systems,[m
[32m+[m[32m      and issue tracking systems that are managed by, or on behalf of, the[m
[32m+[m[32m      Licensor for the purpose of discussing and improving the Work, but[m
[32m+[m[32m      excluding communication that is conspicuously marked or otherwise[m
[32m+[m[32m      designated in writing by the copyright owner as "Not a Contribution."[m
[32m+[m
[32m+[m[32m      "Contributor" shall mean Licensor and any individual or Legal Entity[m
[32m+[m[32m      on behalf of whom a Contribution has been received by Licensor and[m
[32m+[m[32m      subsequently incorporated within the Work.[m
[32m+[m
[32m+[m[32m   2. Grant of Copyright License. Subject to the terms and conditions of[m
[32m+[m[32m      this License, each Contributor hereby grants to You a perpetual,[m
[32m+[m[32m      worldwide, non-exclusive, no-charge, royalty-free, irrevocable[m
[32m+[m[32m      copyright license to reproduce, prepare Derivative Works of,[m
[32m+[m[32m      publicly display, publicly perform, sublicense, and distribute the[m
[32m+[m[32m      Work and such Derivative Works in Source or Object form.[m
[32m+[m
[32m+[m[32m   3. Grant of Patent License. Subject to the terms and conditions of[m
[32m+[m[32m      this License, each Contributor hereby grants to You a perpetual,[m
[32m+[m[32m      worldwide, non-exclusive, no-charge, royalty-free, irrevocable[m
[32m+[m[32m      (except as stated in this section) patent license to make, have made,[m
[32m+[m[32m      use, offer to sell, sell, import, and otherwise transfer the Work,[m
[32m+[m[32m      where such license applies only to those patent claims licensable[m
[32m+[m[32m      by such Contributor that are necessarily infringed by their[m
[32m+[m[32m      Contribution(s) alone or by combination of their Contribution(s)[m
[32m+[m[32m      with the Work to which such Contribution(s) was submitted. If You[m
[32m+[m[32m      institute patent litigation against any entity (including a[m
[32m+[m[32m      cross-claim or counterclaim in a lawsuit) alleging that the Work[m
[32m+[m[32m      or a Contribution incorporated within the Work constitutes direct[m
[32m+[m[32m      or contributory patent infringement, then any patent licenses[m
[32m+[m[32m      granted to You under this License for that Work shall terminate[m
[32m+[m[32m      as of the date such litigation is filed.[m
[32m+[m
[32m+[m[32m   4. Redistribution. You may reproduce and distribute copies of the[m
[32m+[m[32m      Work or Derivative Works thereof in any medium, with or without[m
[32m+[m[32m      modifications, and in Source or Object form, provided that You[m
[32m+[m[32m      meet the following conditions:[m
[32m+[m
[32m+[m[32m      (a) You must give any other recipients of the Work or[m
[32m+[m[32m          Derivative Works a copy of this License; and[m
[32m+[m
[32m+[m[32m      (b) You must cause any modified files to carry prominent notices[m
[32m+[m[32m          stating that You changed the files; and[m
[32m+[m
[32m+[m[32m      (c) You must retain, in the Source form of any Derivative Works[m
[32m+[m[32m          that You distribute, all copyright, patent, trademark, and[m
[32m+[m[32m          attribution notices from the Source form of the Work,[m
[32m+[m[32m          excluding those notices that do not pertain to any part of[m
[32m+[m[32m          the Derivative Works; and[m
[32m+[m
[32m+[m[32m      (d) If the Work includes a "NOTICE" text file as part of its[m
[32m+[m[32m          distribution, then any Derivative Works that You distribute must[m
[32m+[m[32m          include a readable copy of the attribution notices contained[m
[32m+[m[32m          within such NOTICE file, excluding those notices that do not[m
[32m+[m[32m          pertain to any part of the Derivative Works, in at least one[m
[32m+[m[32m          of the following places: within a NOTICE text file distributed[m
[32m+[m[32m          as part of the Derivative Works; within the Source form or[m
[32m+[m[32m          documentation, if provided along with the Derivative Works; or,[m
[32m+[m[32m          within a display generated by the Derivative Works, if and[m
[32m+[m[32m          wherever such third-party notices normally appear. The contents[m
[32m+[m[32m          of the NOTICE file are for informational purposes only and[m
[32m+[m[32m          do not modify the License. You may add Your own attribution[m
[32m+[m[32m          notices within Derivative Works that You distribute, alongside[m
[32m+[m[32m          or as an addendum to the NOTICE text from the Work, provided[m
[32m+[m[32m          that such additional attribution notices cannot be construed[m
[32m+[m[32m          as modifying the License.[m
[32m+[m
[32m+[m[32m      You may add Your own copyright statement to Your modifications and[m
[32m+[m[32m      may provide additional or different license terms and conditions[m
[32m+[m[32m      for use, reproduction, or distribution of Your modifications, or[m
[32m+[m[32m      for any such Derivative Works as a whole, provided Your use,[m
[32m+[m[32m      reproduction, and distribution of the Work otherwise complies with[m
[32m+[m[32m      the conditions stated in this License.[m
[32m+[m
[32m+[m[32m   5. Submission of Contributions. Unless You explicitly state otherwise,[m
[32m+[m[32m      any Contribution intentionally submitted for inclusion in the Work[m
[32m+[m[32m      by You to the Licensor shall be under the terms and conditions of[m
[32m+[m[32m      this License, without any additional terms or conditions.[m
[32m+[m[32m      Notwithstanding the above, nothing herein shall supersede or modify[m
[32m+[m[32m      the terms of any separate license agreement you may have executed[m
[32m+[m[32m      with Licensor regarding such Contributions.[m
[32m+[m
[32m+[m[32m   6. Trademarks. This License does not grant permission to use the trade[m
[32m+[m[32m      names, trademarks, service marks, or product names of the Licensor,[m
[32m+[m[32m      except as required for reasonable and customary use in describing the[m
[32m+[m[32m      origin of the Work and reproducing the content of the NOTICE file.[m
[32m+[m
[32m+[m[32m   7. Disclaimer of Warranty. Unless required by applicable law or[m
[32m+[m[32m      agreed to in writing, Licensor provides the Work (and each[m
[32m+[m[32m      Contributor provides its Contributions) on an "AS IS" BASIS,[m
[32m+[m[32m      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or[m
[32m+[m[32m      implied, including, without limitation, any warranties or conditions[m
[32m+[m[32m      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A[m
[32m+[m[32m      PARTICULAR PURPOSE. You are solely responsible for determining the[m
[32m+[m[32m      appropriateness of using or redistributing the Work and assume any[m
[32m+[m[32m      risks associated with Your exercise of permissions under this License.[m
[32m+[m
[32m+[m[32m   8. Limitation of Liability. In no event and under no legal theory,[m
[32m+[m[32m      whether in tort (including negligence), contract, or otherwise,[m
[32m+[m[32m      unless required by applicable law (such as deliberate and grossly[m
[32m+[m[32m      negligent acts) or agreed to in writing, shall any Contributor be[m
[32m+[m[32m      liable to You for damages, including any direct, indirect, special,[m
[32m+[m[32m      incidental, or consequential damages of any character arising as a[m
[32m+[m[32m      result of this License or out of the use or inability to use the[m
[32m+[m[32m      Work (including but not limited to damages for loss of goodwill,[m
[32m+[m[32m      work stoppage, computer failure or malfunction, or any and all[m
[32m+[m[32m      other commercial damages or losses), even if such Contributor[m
[32m+[m[32m      has been advised of the possibility of such damages.[m
[32m+[m
[32m+[m[32m   9. Accepting Warranty or Additional Liability. While redistributing[m
[32m+[m[32m      the Work or Derivative Works thereof, You may choose to offer,[m
[32m+[m[32m      and charge a fee for, acceptance of support, warranty, indemnity,[m
[32m+[m[32m      or other liability obligations and/or rights consistent with this[m
[32m+[m[32m      License. However, in accepting such obligations, You may act only[m
[32m+[m[32m      on Your own behalf and on Your sole responsibility, not on behalf[m
[32m+[m[32m      of any other Contributor, and only if You agree to indemnify,[m
[32m+[m[32m      defend, and hold each Contributor harmless for any liability[m
[32m+[m[32m      incurred by, or claims asserted against, such Contributor by reason[m
[32m+[m[32m      of your accepting any such warranty or additional liability.[m
[32m+[m
[32m+[m[32m   END OF TERMS AND CONDITIONS[m
[32m+[m
[32m+[m[32m   APPENDIX: How to apply the Apache License to your work.[m
[32m+[m
[32m+[m[32m      To apply the Apache License to your work, attach the following[m
[32m+[m[32m      boilerplate notice, with the fields enclosed by brackets "[]"[m
[32m+[m[32m      replaced with your own identifying information. (Don't include[m
[32m+[m[32m      the brackets!)  The text should be enclosed in the appropriate[m
[32m+[m[32m      comment syntax for the file format. We also recommend that a[m
[32m+[m[32m      file or class name and description of purpose be included on the[m
[32m+[m[32m      same "printed page" as the copyright notice for easier[m
[32m+[m[32m      identification within third-party archives.[m
[32m+[m
[32m+[m[32m   Copyright [yyyy] [name of copyright owner][m
[32m+[m
[32m+[m[32m   Licensed under the Apache License, Version 2.0 (the "License");[m
[32m+[m[32m   you may not use this file except in compliance with the License.[m
[32m+[m[32m   You may obtain a copy of the License at[m
[32m+[m
[32m+[m[32m       http://www.apache.org/licenses/LICENSE-2.0[m
[32m+[m
[32m+[m[32m   Unless required by applicable law or agreed to in writing, software[m
[32m+[m[32m   distributed under the License is distributed on an "AS IS" BASIS,[m
[32m+[m[32m   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.[m
[32m+[m[32m   See the License for the specific language governing permissions and[m
[32m+[m[32m   limitations under the License.[m
[1mdiff --git a/OtherFiles/PaymentConfirmation.pdf b/OtherFiles/PaymentConfirmation.pdf[m
[1mnew file mode 100644[m
[1mindex 0000000..e155eca[m
[1m--- /dev/null[m
[1m+++ b/OtherFiles/PaymentConfirmation.pdf[m
[36m@@ -0,0 +1,42 @@[m
[32m+[m[32m                              PAYMENT CONFIRMATION[m
[32m+[m
[32m+[m[32m                                          This is not a boarding pass[m
[32m+[m
[32m+[m[32mCustomer                      Rashed Qazizada                   Supplier                        easyJet Airline Company Limited[m
[32m+[m[32mAddress                                                         Address[m
[32m+[m[32m                              Rönnblomsgatan                                                    Hangar 89[m
[32m+[m[32m                              Malmö                                                             London Luton Airport[m
[32m+[m[32m                              21216                                                             Luton[m
[32m+[m[32m                              Sweden                                                            Beds[m
[32m+[m[32m                                                                                                LU2 9PF[m
[32m+[m[32m                                                                                                United Kingdom[m
[32m+[m
[32m+[m[32mBooking Reference             K5NWFNL                           Issue Date                      02/07/2023[m
[32m+[m
[32m+[m[32mBooking            Flight                       Flight  Flight  Product                         Qty         Unit              Price[m
[32m+[m[32m  Date             Route                         Ref    Date[m
[32m+[m[32m                                                                                                                               748.93 EUR[m
[32m+[m[32m02/07/2023 Amsterdam to                EJU7939 06/08/2023          Flight                       7    Segment[m
[32m+[m[32m                  Copenhagen                                    (Standard)                                                       31.00 EUR[m
[32m+[m[32m                                                                                                                                68.97 EUR[m
[32m+[m[32m                                                                Infant                          1    Infants                    185.01 EUR[m
[32m+[m[32m                                                                Large cabin bag                                                  0.00 EUR[m
[32m+[m[32m                                                                Aviation Taxes (APD)            3           Bags[m
[32m+[m[32m                                                                Admin Fee                                                     1,033.91 EUR[m
[32m+[m[32m                                                                                                7    per booking[m
[32m+[m
[32m+[m[32m                                                                                                1    per booking[m
[32m+[m
[32m+[m[32m                                                                                                            Flight Totals[m
[32m+[m
[32m+[m[32mInternational and UK Domestic flights and flight related products are subject to VAT at 0% under the VAT number GB745360825.[m
[32m+[m
[32m+[m[32m                                                                                                            Grand Total       1,033.91 EUR[m
[32m+[m[32m                                                                                                                              1,033.91 EUR[m
[32m+[m[32m02/07/2023                    Debit MasterCard                                        ****4437[m
[32m+[m
[32m+[m[32mThis sale is not protected under the ATOL Scheme.[m
[32m+[m
[32m+[m[32m      Page[m
[32m+[m[32m       1 of 1[m
[32m+[m[32m[m
[1mdiff --git a/OtherFiles/flash_nuke.uf2 b/OtherFiles/flash_nuke.uf2[m
[1mnew file mode 100644[m
[1mindex 0000000..31291e6[m
Binary files /dev/null and b/OtherFiles/flash_nuke.uf2 differ
[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..0f7f77a[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1,301 @@[m
[32m+[m[32m# Pico_DHT11_WeatherStation[m
[32m+[m
[32m+[m[32mBuilding a temperature and humidity sensor[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m### Student Information[m
[32m+[m
[32m+[m[32m**Name:** `Rashed Qazizada`[m[41m  [m
[32m+[m[32m**Student ID:** `rq222ah`[m[41m  [m
[32m+[m
[32m+[m[32m## Project Overview[m
[32m+[m
[32m+[m[32mThis project, titled "Pico_DHT11_WeatherStation", aims to create a weather station capable of monitoring and displaying temperature and humidity data. Leveraging the capabilities of the Raspberry Pi Pico W and the DHT11 sensor, this station's data can be accessed from any browser, making it versatile for usage on both computers and mobile phones.[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m### Time Required[m
[32m+[m
[32m+[m[32mThe completion of this project, incorporating all related learning, building, and testing, is estimated to take approximately two weeks.[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Project Objective[m
[32m+[m
[32m+[m[32mThe goal of this project is two-pronged:[m
[32m+[m
[32m+[m[32m1. **Practical Application**: The station serves as a real-time monitor for temperature and humidity, offering useful data for everyday decisions. Whether it's adjusting home climate control or deciding the best time for gardening, the device's information can guide users to make informed choices.[m
[32m+[m
[32m+[m[32m1. **Learning Opportunity**: On a broader scale, this project is a hands-on exploration into the workings of IoT devices. It provides a unique opportunity to understand the integration and operation of components like the Raspberry Pi Pico W and the DHT11 sensor. Consequently, it serves as a stepping stone into the fascinating field of IoT technology.[m
[32m+[m
[32m+[m[32m### Why I Chose This Project[m
[32m+[m
[32m+[m[32mMy decision to undertake this project stems from my longstanding interest in the workings of IoT devices and my desire to dive deeper into this fascinating area of technology. Having searched for an IoT course that resonates with my curiosity, the content of this course appeared promising and well-aligned with my interests. This project, therefore, is not merely about building a weather station but serves as a launchpad into my journey of exploring the IoT world.[m
[32m+[m
[32m+[m[32m### What Purpose It Serves[m
[32m+[m
[32m+[m[32mBeyond its practical application of monitoring weather conditions, this project allows me to get my hands dirty with IoT, an area I've always been eager to explore. By building the Pico_DHT11_WeatherStation, I'm not just creating a device that provides valuable data but also taking a significant step into a broader technological realm.[m
[32m+[m
[32m+[m[32m### Insights I Expect To Gain[m
[32m+[m
[32m+[m[32mI anticipate that this project will offer a deep dive into how IoT devices function. By taking up the challenge of building and programming the weather station myself, I expect to gain firsthand experience and insights into IoT device operation and data handling. But more importantly, I see this as the beginning of an exciting journey into the vast world of IoT, and I'm thrilled to see where it leads.[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Materials[m
[32m+[m
[32m+[m[32mThe key components for the Pico_DHT11_WeatherStation project were obtained from the "Start Kit – Applied IoT at Linnaeus University (2023)" package, available at [Electrokit](https://www.electrokit.com/produkt/start-kit-applied-iot-at-linnaeus-university-2023/). Here's a breakdown of the key materials used:[m
[32m+[m
[32m+[m[32m| Material | Description | Image | Cost (SEK) | Units |[m
[32m+[m[32m| --- | --- | --- | --- |--- |[m
[32m+[m[32m| Raspberry Pi Pico W | A small, versatile microcontroller board developed by the Raspberry Pi Foundation. It's powered by a dual-core Arm Cortex-M0+ processor, with flexible digital interfaces. The Pico W version includes wireless capabilities, making it great for IoT projects. It can be programmed using C/C++ or MicroPython. | [![Raspberry Pi Pico W](./images/Raspberry-Pi-Pico-W.jpg)](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html) Fig. 1: The Raspberry Pi Pico W | 109 | 1 |[m
[32m+[m[32m| USB Cable | USB cable with type-A male connector on one end and mini-B on the other. Common for USB hubs, digital cameras, and other small USB devices. | [![USB Cable](./images/usb-cable.jpg)](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html) Fig. 2: The USB Cable | 39 | 1 |[m
[32m+[m[32m| DHT11 Sensor | A basic, ultra low-cost digital temperature and humidity sensor. It uses a capacitive humidity sensor and a thermistor to measure the surrounding air, and outputs a digital signal. | [![DHT11 Sensor](./images/DHT11.jpg)](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html) Fig. 3: The DHT11 Sensor | 49 | 1 |[m
[32m+[m[32m| Breadboard | Used for prototyping the electronic circuit without the need for soldering. | [![Breadboard](./images/breadboard.jpg)](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html) Fig. 4: The Breadboard | 69 | 1 |[m
[32m+[m[32m| Wires | Used to connect the components on the breadboard. | [![Wires](./images/cable-30cm-male-male.jpg)](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html) Fig. 5: The Wires | 49 | 3 |[m
[32m+[m[32m| **Total** | | | **315** |[m
[32m+[m
[32m+[m[32m***[m
[32m+[m[32m## Computer Setup on Windows OS[m
[32m+[m
[32m+[m[32mTo start working with the Raspberry Pi Pico W and MicroPython, you'll need to setup your computer with the necessary tools. Here's how you do it:[m
[32m+[m
[32m+[m[32m### Prerequisites[m
[32m+[m
[32m+[m[32m- Windows OS[m
[32m+[m[32m- Internet connection[m
[32m+[m[32m- Pymakr plugin for your VS Code[m
[32m+[m
[32m+[m[32m### Steps[m
[32m+[m
[32m+[m[32m1. Download and install [Node.js](https://nodejs.org/en/download/)[m
[32m+[m[32m2. Download and install [VS Code](https://code.visualstudio.com/Download)[m
[32m+[m[32m3. Install the latest version of [Python](https://www.python.org/downloads/windows/)[m
[32m+[m[32m4. Open VS Code and then open the Extensions manager. You can do this from the left panel icon, from "View" >> "Extensions", or by pressing `Ctrl+Shift+X`.[m
[32m+[m[32m5. Search for Pymakr and install it. This plugin helps in connecting and uploading code to your Pico board. You can follow the steps in the below figure to install the plugin:[m
[32m+[m
[32m+[m[32m![Pymakr Installation](./images/pymakr.png)[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Updating Firmware on Raspberry Pi Pico W and Running a Test Code[m
[32m+[m
[32m+[m[32m### Prerequisites[m
[32m+[m
[32m+[m[32mBefore starting with this section, make sure you have:[m
[32m+[m
[32m+[m[32m- Completed the IDE installation tutorial[m
[32m+[m[32m- A Raspberry Pi Pico board[m
[32m+[m[32m- A USB Cable (ensure the USB cable has four pins and is capable of data transfer)[m
[32m+[m
[32m+[m[32m### Firmware Update[m
[32m+[m
[32m+[m[32mFollow these steps to update your Raspberry Pi Pico's firmware:[m
[32m+[m
[32m+[m[32m1. Remove the ESD sponge from the Pico before proceeding. (The black sponge attached under your Pico).[m
[32m+[m[32m2. Download the MicroPython firmware from the official [MicroPython website](https://micropython.org/download/rp2-pico-w/). Be sure to download the latest one from the "Releases" category and not "Nightly Builds".[m
[32m+[m[32m3. Connect the micro-USB end of your cable (the small side) into the Raspberry Pi Pico. Be sure to firmly hold the back of the USB slot so that by pushing you will not bend it.[m
[32m+[m[32m4. While holding the `BOOTSEL` button down on the board, connect the USB type A end of your cable (the big side) into your computer’s USB port. You can release the `BOOTSEL` after connecting it to your computer.[m
[32m+[m[32m5. Your computer should recognize the Pico as a new drive named `RPI-RP2`. Copy the `uf2` file into this storage.[m
[32m+[m[32m6. Wait until your board automatically disconnects from your computer and reconnects.[m
[32m+[m[32m7. If you still couldn't figure out how to update the firmware, you can follow the steps in this [video](https://www.youtube.com/watch?v=SL4_oU9t8Ss&list=PLGs0VKk2DiYz8js1SJog21cDhkBqyAhC5).[m
[32m+[m
[32m+[m[32m### Testing the Board[m
[32m+[m
[32m+[m[32mYou can test the board to ensure that it's working correctly with MicroPython.[m
[32m+[m
[32m+[m[32m## Creating a New Project with VS Code and Pymakr[m
[32m+[m
[32m+[m[32mBefore you can start coding, you need to create a new project with VS Code and Pymakr.[m
[32m+[m
[32m+[m[32m### Prerequisites[m
[32m+[m
[32m+[m[32m1. You've successfully updated the MicroPython firmware on your Raspberry Pi Pico W.[m
[32m+[m[32m1. VS Code is up and running on your computer.[m
[32m+[m
[32m+[m[32m### Steps[m
[32m+[m
[32m+[m[32m- Open VS Code, go to "File" then click on "New Window".[m
[32m+[m[32m- Click on the Pymakr extension on the activity bar on the side.[m
[32m+[m[32m- Then click on "Create Project".[m
[32m+[m[32m- Create a new folder and select the folder. Let's name it "LNU_Project".[m
[32m+[m[32m- A pop-up message appears prompting you to confirm your input, press Enter.[m
[32m+[m[32m- Another pop-up message appears asking you to select "empty" or "led-example". Select "empty" and press Enter.[m
[32m+[m[32m- The pymakr.conf file opens with the following content:[m
[32m+[m
[32m+[m[32m```json[m
[32m+[m[32m{[m
[32m+[m[32m    "name": "Empty Project"[m
[32m+[m[32m}[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m- Next, click on "Add device" and select your device from the list (Your device should appear here). Click OK.[m
[32m+[m[32mNote: When you hover over "Empty Project", you'll see a **thunder** sign and a **</>** symbol. The **thunder** sign is used to connect your device and the **</>** symbol starts the debugging mode.[m
[32m+[m
[32m+[m[32m- Click on the **thunder** sign to connect your device.[m
[32m+[m[32m- Select the **</>** symbol to start debugging mode. This is useful as it restarts the main.py file automatically whenever you make changes to the file and it also saves it to your micro controller as well.[m
[32m+[m[32m- Now, your device is connected. To open the terminal, go to "Devices" where you'll see your device "USB Serial Device (COM3) / Empty Project". Click on the **>** to open the device terminal.[m
[32m+[m[32mYou are all set! Now, go to your project and start coding in main.py file.[m
[32m+[m
[32m+[m[32m![Response Output](./images/pymakr3.jpg)[m
[32m+[m
[32m+[m[32m![Response Output](./images/pymakr2.png)[m
[32m+[m
[32m+[m
[32m+[m[32m![Response Output](./images/pymakr4.jpg)[m
[32m+[m
[32m+[m[32m![Response Output](./images/picoTestcode2.jpg)[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m
[32m+[m[32m1. Input the code snippet shown below after the `>>>` symbols:[m
[32m+[m
[32m+[m[32m```python[m
[32m+[m[32mprint("Hello, world!")[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m1. You should get the same text responded back to you from the connected board like in the picture here:[m
[32m+[m
[32m+[m[32m![Response Output](./images/picoTestcode.jpg)[m
[32m+[m
[32m+[m[32mCongratulations! You've successfully finished this part. It is a good idea to read more about MicroPython tutorials and examples from the [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html#content).[m
[32m+[m
[32m+[m[32m## Troubleshooting[m
[32m+[m
[32m+[m[32mIf your device gets stuck, follow this part to recover it.[m
[32m+[m
[32m+[m[32mAccording to the Raspberry Pi team, there is no way to brick this board through software alone. That's because you can always reset it by following the firmware update procedure described above. If you think your board is stuck, follow the procedure for firmware update again, but instead of the usual firmware, use this [special firmware](https://datasheets.raspberrypi.com/soft/flash_nuke.uf2). This will ensure that the memory will be completely erased. Always remember to have a backup of your project before proceeding. You can find a copy of the firmware in this repository in `OtherFiles`.[m
[32m+[m[32m## Project Structure[m
[32m+[m
[32m+[m[32mThis section describes the Pico_DHT11_WeatherStation structure.[m
[32m+[m
[32m+[m[32m### Projects File Hierarchy[m
[32m+[m
[32m+[m[32m``` comments[m
[32m+[m[32mPico_DHT11_WeatherStation[m
[32m+[m[32m|-lib[m
[32m+[m[32m| |-mqtt.py[m
[32m+[m[32m|-boot.py[m
[32m+[m[32m|-main.py[m
[32m+[m[32m```[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Putting everything together[m
[32m+[m
[32m+[m[32mThe DHT11 sensor is connected to Pin 27 on the Raspberry Pi Pico W, and the LED is connected to the onboard LED pin (LED_BUILTIN).[m
[32m+[m
[32m+[m[32m### Wiring[m
[32m+[m
[32m+[m[32m- The DHT11 sensor typically has 3 pins: VCC, Data, and Ground. Connect the VCC to 3.3V on the Raspberry Pi Pico W, the Data to GPIO 27, and the Ground to one of the Ground pins on the Raspberry Pi Pico W.[m
[32m+[m[32m- The LED is already onboard and doesn't need any external connections.[m
[32m+[m
[32m+[m[32mBelow are diagrams of the Pi Pico on a breadboard, the wiring setup, and the final assembly[m
[32m+[m
[32m+[m[32m![Wiring Diagram](./images/FinalWiring.jpg)[m
[32m+[m
[32m+[m[32m### Resistors, Current, and Voltage[m
[32m+[m
[32m+[m[32m The DHT11 can operate at 3.3V which is convenient because that's what the Raspberry Pi Pico W can output. Becareful not to connect it to 5V, as that could damage it. In terms of resistors, you don't need any for theDHT11 as it already has a built-in pull-up resistor. However, if you were connecting an external LED, you would typically use a current-limiting resistor.[m
[32m+[m
[32m+[m[32m- **Reliability**: This setup is not robust enough for a production environment. For example, it does not account for instances where the network may be unavailable, or where the sensor may fail.[m
[32m+[m[32m- **Security**: The WiFi credentials and Adafruit IO key are stored in plaintext in the code. In a production environment, you would want to store these in a secure way.[m
[32m+[m[32m- **Scalability**: If you wanted to deploy many such devices, you would likely want a more streamlined way to manage them.[m
[32m+[m[32m- **Fritz Diagram**[m
[32m+[m
[32m+[m[32m![Fritzing Diagram](./images/FritzingDiagram.png)[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Platform[m
[32m+[m
[32m+[m[32mThe platform chosen is the Raspberry Pi Pico, a microcontroller developed by the Raspberry Pi foundation. It's local and it does not require any paid subscription.[m
[32m+[m
[32m+[m[32m### Comparison with other platforms[m
[32m+[m
[32m+[m[32mThe Raspberry Pi Pico is an excellent choice for IoT projects due to its simplicity, compact size, and cost-effectiveness. It's powerful enough to handle a variety of tasks yet affordable and accessible, which makes it ideal for prototyping or projects with tight budgets. If compared with other microcontrollers such as Arduino, Pico provides better performance, more flexibility, and runs MicroPython, which is a lean and efficient implementation of the Python 3 programming language.[m
[32m+[m
[32m+[m[32m### Cloud vs Local[m
[32m+[m
[32m+[m[32mThis script mainly runs on the local Raspberry Pi Pico device. However, it also communicates with Adafruit IO, a cloud service for IoT, for data exchange. This hybrid approach allows you to collect and process data locally and then publish it to the cloud for remote access, analysis, or interaction.[m
[32m+[m
[32m+[m[32m### Paid vs Free[m
[32m+[m
[32m+[m[32mThis implementation uses the free tier of Adafruit IO as an MQTT broker. If you're scaling up your idea, you may need to consider Adafruit IO Plus, the paid version of the service that provides expanded data capacity.[m
[32m+[m
[32m+[m[32m### Functionality[m
[32m+[m
[32m+[m[32mThe script collects data from a DHT11 temperature and humidity sensor, generates random numbers, and sends these data to Adafruit IO feeds using the MQTT protocol. It also checks for incoming MQTT messages and controls a connected LED based on these messages.[m
[32m+[m
[32m+[m[32m### Scaling[m
[32m+[m
[32m+[m[32mIf you're looking to scale up your idea, you may need to consider a more robust MQTT broker service or host your own, depending on the size of your project. Also, you might need to consider the limitations of the Raspberry Pi Pico, especially for large-scale, complex projects[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## The code[m
[32m+[m
[32m+[m[32mThe code for this project is provided in the linked repository. It's written in MicroPython.[m
[32m+[m
[32m+[m[32mKey sections of the code:[m
[32m+[m
[32m+[m[32m- **Configurations**: Setup details, including Wi-Fi and Adafruit IO server info.[m
[32m+[m[32m- **Functions**: These handle Wi-Fi connection, random number generation, and MQTT message handling.[m
[32m+[m[32m- **Main** Loop: Checks for MQTT messages and sends random numbers to Adafruit IO.[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m### Transmitting the Data / Connectivity[m
[32m+[m
[32m+[m[32m- The data from the `Raspberry Pi Pico W` is transmitted to the internet using `Wi-Fi` and uses the `MQTT protocol` to send data to the `Adafruit IO` server.[m
[32m+[m
[32m+[m[32m- `MQTT` is a lightweight messaging protocol designed for connections where a `small code footprint` is required or network bandwidth is limited. It is commonly used in IoT applications.[m
[32m+[m
[32m+[m[32m- The data is sent as `MQTT messages`, with the feed name as the topic and data value as the payload. This ensures reliable delivery despite high-latency or unreliable networks.[m
[32m+[m
[32m+[m[32m- `Data` is sent at an interval defined by the `RANDOMS_INTERVAL` variable, which in this case is set to `10000` milliseconds (or 10 seconds).[m
[32m+[m
[32m+[m[32m- The wireless protocol in use is `Wi-Fi` and the transport protocol is `MQTT`.[m[41m [m
[32m+[m
[32m+[m[32m- The `send_random()` function measures `temperature` and `humidity`, `generates a random number`, and sends these values to different feeds on the `Adafruit IO server`. This function runs in an infinite loop, sending the data at the specified interval.[m
[32m+[m
[32m+[m[32m- In case of an exception, the `MQTT client disconnects` and cleans up, ensuring a smooth termination of the connection.[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Presenting the data[m
[32m+[m
[32m+[m[32mThe frequency at which data is send to Adafruit IO is controlled by the RANDOMS_INTERVAL constant, set to 10000 milliseconds, or 10 seconds. This means every 10 seconds, the program reads data from the temperature and humidity sensor, generates a random number, and sends this data to Adafruit IO.[m
[32m+[m
[32m+[m[32m### Visual Examples of the data: showing the output and response[m
[32m+[m
[32m+[m[32m- **Temperature, Humidity and LED**[m
[32m+[m
[32m+[m[32m![Final results](./images/DH11Visual.jpg)[m
[32m+[m
[32m+[m[32m***[m
[32m+[m
[32m+[m[32m## Finalizing the Design[m
[32m+[m
[32m+[m[32mOverall, I am thrilled with how this project turned out. Using the `Raspberry Pi Pico W`, I was able to create a data logger that measures `temperature` and `humidity`, as well as `generating a random number`. These data points were successfully sent over `Wi-Fi using MQTT protocol` to the `Adafruit IO server`.[m
[32m+[m
[32m+[m[32mThe Python code developed for the Pico proved to be robust, managing to keep a steady connection and transmitting data at the desired interval.[m
[32m+[m
[32m+[m[32mConsidering the smooth completion of the project and the successful data transmission, I believe this was a successful experiment in `IoT` data logging with the `Raspberry Pi Pico W`.[m
[32m+[m
[32m+[m[32mThere were undoubtedly challenges along the way, such as setting up the initial configuration and ensuring stable data transmission, but overcoming these obstacles has been a rewarding learning experience.[m
[32m+[m
[32m+[m[32m### Reflections and Alternate Approaches[m
[32m+[m
[32m+[m[32mWhile I am content with how the project was executed and its outcomes, reflecting on the process offers some valuable insights.[m
[32m+[m
[32m+[m[32mThe entire project was developed and tested in an isolated environment due to constraints on physical meetings. If circumstances were different, I would have appreciated the opportunity to have a dedicated day for a physical lab session. Being able to meet and interact with other students, observe their approaches, share ideas, and learn from their implementations would have enriched my learning experience and potentially brought new perspectives to my own project.[m
[32m+[m
[32m+[m[32mMoreover, witnessing real-time troubleshooting and diverse solutions to common problems could have offered a broader understanding of the subject matter and opened avenues for collaborative problem solving.[m[41m [m
[32m+[m
[32m+[m[32mHence, in future similar projects, I would strive to incorporate such interactive sessions to harness the collective wisdom of the group and further enrich the learning experience.[m
[32m+[m
[32m+[m[32m***[m
[32m+[m[32m## References[m
[32m+[m
[32m+[m[32m- [1DT305 - Introduction to Applied IoT summer 2023](https://lnu-ftk.instructure.com/courses/255)[m
[32m+[m[32m- [Road map for the course](images/1DT305_Roadmap_Part_3.pdf)[m
[1mdiff --git a/boot.py b/boot.py[m
[1mnew file mode 100644[m
[1mindex 0000000..c31f614[m
[1m--- /dev/null[m
[1m+++ b/boot.py[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32m# boot.py -- run on boot-up[m
[32m+[m[32mimport network, utime[m
[32m+[m[32mfrom secrets import secrets[m
[32m+[m
[32m+[m[32m# Replace the following with your WIFI Credentials[m
[32m+[m[32m# SSID = "iotlab"[m
[32m+[m[32m# SSID_PASSWORD = "modermodemet"[m
[32m+[m
[32m+[m
[32m+[m[32mdef do_connect():[m
[32m+[m[32m    sta_if = network.WLAN(network.STA_IF)[m
[32m+[m[32m    if not sta_if.isconnected():[m
[32m+[m[32m        print('connecting to network...')[m
[32m+[m[32m        sta_if.active(True)[m
[32m+[m[32m        sta_if.connect(secrets["SSID"], secrets["SSID_PASSWORD"])[m
[32m+[m[32m        while not sta_if.isconnected():[m
[32m+[m[32m            print("Attempting to connect....")[m
[32m+[m[32m            utime.sleep(1)[m
[32m+[m[32m    print('Connected! Network config:', sta_if.ifconfig())[m
[32m+[m[41m    [m
[32m+[m[32mprint("Connecting to your wifi...")[m
[32m+[m[32mdo_connect()[m
\ No newline at end of file[m
[1mdiff --git a/images/1DT305_Roadmap_Part_3.pdf b/images/1DT305_Roadmap_Part_3.pdf[m
[1mnew file mode 100644[m
[1mindex 0000000..6502a72[m
[1m--- /dev/null[m
[1m+++ b/images/1DT305_Roadmap_Part_3.pdf[m
[36m@@ -0,0 +1,40 @@[m
[32m+[m[32m                                                                                    Appl i ed I oT Roadmap[m
[32m+[m
[32m+[m[32m   Assigments              Part 1  Development Environment  START[m
[32m+[m[32m    on Canvas[m
[32m+[m[32m                                   &                        Decide what[m
[32m+[m[32m            Quizz 1                                            to create[m
[32m+[m[32m       Due June 12th               Device Configuration[m
[32m+[m
[32m+[m[32m            Quizz 2        Part 2 Network Connection                                                                               Connect to[m
[32m+[m[32m       Due June 19th                                                                                                               a network[m
[32m+[m[32m                           Part 3  Data Visualization[m
[32m+[m[32m            Quizz 3                                                                                                                   Wi-Fi[m
[32m+[m[32m      Due June 22nd        Recommended path                                                                 LoRaWAN                                             LTE[m
[32m+[m[32m                             Alternative Path[m
[32m+[m[32m            Quizz 4[m
[32m+[m[32m       Due June 26th       This roadmap                     Install VS     Install[m
[32m+[m[32m                           contains                          Code &       Thonny[m
[32m+[m[32m  Project Presentation     clickable links                   Pymakr[m
[32m+[m[32m  July 3th, 4th, 5th, 6th  on most of the                     plugin                            Chirpstack  The Things  Helium                          CAT-M1       NB-IoT[m
[32m+[m[32m                           boxes which                                                                        Network[m
[32m+[m[32mInitial report submission  lead to the[m
[32m+[m[32m       & Peer Review       corresponding                       Update[m
[32m+[m[32m           July 4th        tutorials.                         firmware[m
[32m+[m[32m                                                            (RPi Pico W)[m
[32m+[m[32m         Peer review[m
[32m+[m[32m        Due July 7th                                                                                                               Visualize[m
[32m+[m[32m                                                                                                                                   the data[m
[32m+[m[32m        Final Report[m
[32m+[m[32m         Submission                                         Terms &                                   <                            Big Data                                Self-hosted[m
[32m+[m[32m                                                             Project                            Low Code                               IoT                                      IoT[m
[32m+[m[32m           July 9th                                         Structure[m
[32m+[m[32m                                                                                                     IoT                           Solutions                                Solutions[m
[32m+[m[32m                                                                                                Solutions[m
[32m+[m
[32m+[m[32m                                                               Sensor                 Ubidots    Datacake     Adafruit   Google    Amazon      IBM IoT          TIG-stack  ELK-stack     Eclipse[m
[32m+[m[32m                                                            Connection              (REST API)  (LoRaWAN)    (MQTT &    Cloud IoT     IoT                                               Mosquitto[m
[32m+[m[32m                                                                                                            Webhooks)[m
[32m+[m[32m                                                               & Data                                                                                                                         &[m
[32m+[m[32m                                                              Reading                                                                                                                   Node-Red[m
[32m+[m[32m[m
[1mdiff --git a/images/DH11Visual.jpg b/images/DH11Visual.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..1af835a[m
Binary files /dev/null and b/images/DH11Visual.jpg differ
[1mdiff --git a/images/DHT11.jpg b/images/DHT11.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..e8ce63a[m
Binary files /dev/null and b/images/DHT11.jpg differ
[1mdiff --git a/images/FinalWiring.jpg b/images/FinalWiring.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..90e43fe[m
Binary files /dev/null and b/images/FinalWiring.jpg differ
[1mdiff --git a/images/FritzingDiagram.png b/images/FritzingDiagram.png[m
[1mnew file mode 100644[m
[1mindex 0000000..0ae867b[m
Binary files /dev/null and b/images/FritzingDiagram.png differ
[1mdiff --git a/images/Raspberry-Pi-Pico-W.jpg b/images/Raspberry-Pi-Pico-W.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..c048b6d[m
Binary files /dev/null and b/images/Raspberry-Pi-Pico-W.jpg differ
[1mdiff --git a/images/Raspberry-Pi-Pico-W2.jpg b/images/Raspberry-Pi-Pico-W2.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..833864e[m
Binary files /dev/null and b/images/Raspberry-Pi-Pico-W2.jpg differ
[1mdiff --git a/images/breadboard.jpg b/images/breadboard.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..2a46c34[m
Binary files /dev/null and b/images/breadboard.jpg differ
[1mdiff --git a/images/cable-30cm-male-male.jpg b/images/cable-30cm-male-male.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..b5c9162[m
Binary files /dev/null and b/images/cable-30cm-male-male.jpg differ
[1mdiff --git a/images/humidity_1.jpg b/images/humidity_1.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..dca2672[m
Binary files /dev/null and b/images/humidity_1.jpg differ
[1mdiff --git a/images/picoTestcode.jpg b/images/picoTestcode.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..c8e6911[m
Binary files /dev/null and b/images/picoTestcode.jpg differ
[1mdiff --git a/images/picoTestcode2.jpg b/images/picoTestcode2.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..2448bee[m
Binary files /dev/null and b/images/picoTestcode2.jpg differ
[1mdiff --git a/images/pymakr.png b/images/pymakr.png[m
[1mnew file mode 100644[m
[1mindex 0000000..a69f78c[m
Binary files /dev/null and b/images/pymakr.png differ
[1mdiff --git a/images/pymakr2.png b/images/pymakr2.png[m
[1mnew file mode 100644[m
[1mindex 0000000..a2cf3b8[m
Binary files /dev/null and b/images/pymakr2.png differ
[1mdiff --git a/images/pymakr3.jpg b/images/pymakr3.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..cd43e5b[m
Binary files /dev/null and b/images/pymakr3.jpg differ
[1mdiff --git a/images/pymakr4.jpg b/images/pymakr4.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..b226f11[m
Binary files /dev/null and b/images/pymakr4.jpg differ
[1mdiff --git a/images/temp_1.jpg b/images/temp_1.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..2a92baf[m
Binary files /dev/null and b/images/temp_1.jpg differ
[1mdiff --git a/images/usb-cable.jpg b/images/usb-cable.jpg[m
[1mnew file mode 100644[m
[1mindex 0000000..39a12b3[m
Binary files /dev/null and b/images/usb-cable.jpg differ
[1mdiff --git a/main.py b/main.py[m
[1mnew file mode 100644[m
[1mindex 0000000..f2a7f72[m
[1m--- /dev/null[m
[1m+++ b/main.py[m
[36m@@ -0,0 +1,130 @@[m
[32m+[m[32mimport time                   # Allows use of time.sleep() for delays[m
[32m+[m[32mfrom lib.mqtt import MQTTClient   # For use of MQTT protocol to talk to Adafruit IO[m
[32m+[m[32mimport ubinascii              # Conversions between binary data and various encodings[m
[32m+[m[32mimport machine                # Interfaces with hardware components[m
[32m+[m[32mimport micropython            # Needed to run any MicroPython code[m
[32m+[m[32mimport random                 # Random number generator[m
[32m+[m[32mfrom machine import Pin       # Define pin[m
[32m+[m[32mfrom secrets import secrets[m
[32m+[m[32mimport dht                 # import the builtin library[m
[32m+[m
[32m+[m[32mtempSensor = dht.DHT11(Pin(27))     # DHT11 Constructor[m[41m [m
[32m+[m[32m# BEGIN SETTINGS[m
[32m+[m[32m# These need to be change to suit your environment[m
[32m+[m[32mRANDOMS_INTERVAL = 10000    # milliseconds[m
[32m+[m[32mlast_random_sent_ticks = 0  # milliseconds[m
[32m+[m[32mled = Pin("LED", Pin.OUT)   # led pin initialization for Raspberry Pi Pico W[m
[32m+[m
[32m+[m[32m# # Wireless network[m
[32m+[m[32m# WIFI_SSID = "TN_24GHz_D20465"[m
[32m+[m[32m# WIFI_PASS = "B42C3E878A" # No this is not our regular password. :)[m
[32m+[m
[32m+[m[32m# Adafruit IO (AIO) configuration[m
[32m+[m[32mAIO_SERVER = "io.adafruit.com"[m
[32m+[m[32mAIO_PORT = 1883[m
[32m+[m[32mAIO_USER = "rq222ah"[m
[32m+[m[32mAIO_KEY = "aio_EsuN55DL3Z0xHUybR2IOResgSK7C"[m
[32m+[m[32mAIO_CLIENT_ID = ubinascii.hexlify(machine.unique_id())  # Can be anything[m
[32m+[m[32mAIO_LIGHTS_FEED = "rq222ah/feeds/led"[m
[32m+[m[32mAIO_RANDOMS_FEED = "rq222ah/feeds/picow"[m
[32m+[m[32mAIO_TEMPERATURE_FEED = "rq222ah/feeds/temperature"[m
[32m+[m[32mAIO_HUMIDITY_FEED = "rq222ah/feeds/humidity"[m
[32m+[m
[32m+[m[32m# END SETTINGS[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m# FUNCTIONS[m
[32m+[m
[32m+[m[32m# Function to connect Pico to the WiFi[m
[32m+[m[32mdef do_connect():[m
[32m+[m[32m    import network[m
[32m+[m[32m    from time import sleep[m
[32m+[m[32m    import machine[m
[32m+[m[32m    wlan = network.WLAN(network.STA_IF)         # Put modem on Station mode[m
[32m+[m
[32m+[m[32m    if not wlan.isconnected():                  # Check if already connected[m
[32m+[m[32m        print('connecting to network...')[m
[32m+[m[32m        wlan.active(True)                       # Activate network interface[m
[32m+[m[32m        # set power mode to get WiFi power-saving off (if needed)[m
[32m+[m[32m        wlan.config(pm = 0xa11140)[m
[32m+[m[32m        wlan.connect(secrets["WIFI_SSID"], secrets["WIFI_PASS"])  # Your WiFi Credential[m
[32m+[m[32m        print('Waiting for connection...', end='')[m
[32m+[m[32m        # Check if it is connected otherwise wait[m
[32m+[m[32m        while not wlan.isconnected() and wlan.status() >= 0:[m
[32m+[m[32m            print('.', end='')[m
[32m+[m[32m            sleep(1)[m
[32m+[m[32m    # Print the IP assigned by router[m
[32m+[m[32m    ip = wlan.ifconfig()[0][m
[32m+[m[32m    print('\nConnected on {}'.format(ip))[m
[32m+[m[32m    return ip[m[41m [m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m# Callback Function to respond to messages from Adafruit IO[m
[32m+[m[32mdef sub_cb(topic, msg):          # sub_cb means "callback subroutine"[m
[32m+[m[32m    print((topic, msg))          # Outputs the message that was received. Debugging use.[m
[32m+[m[32m    if msg == b"ON":             # If message says "ON" ...[m
[32m+[m[32m        led.on()                 # ... then LED on[m
[32m+[m[32m    elif msg == b"OFF":          # If message says "OFF" ...[m
[32m+[m[32m        led.off()                # ... then LED off[m
[32m+[m[32m    else:                        # If any other message is received ...[m
[32m+[m[32m        print("Unknown message") # ... do nothing but output that it happened.[m
[32m+[m
[32m+[m[32m# Function to generate a random number between 0 and the upper_bound[m
[32m+[m[32mdef random_integer(upper_bound):[m
[32m+[m[32m    return random.getrandbits(32) % upper_bound[m
[32m+[m
[32m+[m[32m# Function to publish random number to Adafruit IO MQTT server at fixed interval[m
[32m+[m[32mdef send_random():[m
[32m+[m[32m    global last_random_sent_ticks[m
[32m+[m[32m    global RANDOMS_INTERVAL[m
[32m+[m
[32m+[m[32m    if ((time.ticks_ms() - last_random_sent_ticks) < RANDOMS_INTERVAL):[m
[32m+[m[32m        return; # Too soon since last one sent.[m
[32m+[m
[32m+[m[32m    some_number = random_integer(100)[m
[32m+[m[32m    tempSensor.measure()[m
[32m+[m[32m    temperature = tempSensor.temperature()[m
[32m+[m[32m    humidity = tempSensor.humidity()[m
[32m+[m[32m    print("RANDOM: Publishing: {0} to {1} ... ".format(some_number, AIO_RANDOMS_FEED), end='')[m
[32m+[m[32m    print("\nHUMIDITY: Publishing: {0} to {1} ... ".format(humidity, AIO_HUMIDITY_FEED), end='')[m
[32m+[m[32m    print("\nTEMPERATURE: Publishing: {0} to {1} ... ".format(temperature, AIO_TEMPERATURE_FEED), end='')[m
[32m+[m[32m    try:[m
[32m+[m[32m        client.publish(topic=AIO_RANDOMS_FEED, msg=str(some_number))[m
[32m+[m[32m        client.publish(topic=AIO_HUMIDITY_FEED, msg=str(humidity))[m
[32m+[m[32m        client.publish(topic=AIO_TEMPERATURE_FEED, msg=str(temperature))[m
[32m+[m[32m        print("DONE")[m
[32m+[m[32m    except Exception as e:[m
[32m+[m[32m        print("FAILED")[m
[32m+[m[32m    finally:[m
[32m+[m[32m        last_random_sent_ticks = time.ticks_ms()[m
[32m+[m
[32m+[m
[32m+[m[32m# Try WiFi Connection[m
[32m+[m[32mtry:[m
[32m+[m[32m    ip = do_connect()[m
[32m+[m[32mexcept KeyboardInterrupt:[m
[32m+[m[32m    print("Keyboard interrupt")[m
[32m+[m
[32m+[m[32m# Use the MQTT protocol to connect to Adafruit IO[m
[32m+[m[32mclient = MQTTClient(AIO_CLIENT_ID, AIO_SERVER, AIO_PORT, AIO_USER, AIO_KEY)[m
[32m+[m
[32m+[m[32m# Subscribed messages will be delivered to this callback[m
[32m+[m[32mclient.set_callback(sub_cb)[m
[32m+[m[32mclient.connect()[m
[32m+[m[32mclient.subscribe(AIO_LIGHTS_FEED)[m
[32m+[m[32mprint("Connected to %s, subscribed to %s topic" % (AIO_SERVER, AIO_LIGHTS_FEED))[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32mtry:                      # Code between try: and finally: may cause an error[m
[32m+[m[32m                          # so ensure the client disconnects the server if[m
[32m+[m[32m                          # that happens.[m
[32m+[m[32m    while 1:              # Repeat this loop forever[m
[32m+[m[32m        client.check_msg()# Action a message if one is received. Non-blocking.[m
[32m+[m[32m        send_random()     # Send a random number to Adafruit IO if it's time.[m
[32m+[m[32mfinally:                  # If an exception is thrown ...[m
[32m+[m[32m    client.disconnect()   # ... disconnect the client and clean up.[m
[32m+[m[32m    client = None[m
[32m+[m[32m    print("Disconnected from Adafruit IO.")[m
\ No newline at end of file[m
[1mdiff --git a/pymakr.conf b/pymakr.conf[m
[1mnew file mode 100644[m
[1mindex 0000000..1e75591[m
[1m--- /dev/null[m
[1m+++ b/pymakr.conf[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32m{[m
[32m+[m[32m    "name": "Empty Project"[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/secrets.py b/secrets.py[m
[1mnew file mode 100644[m
[1mindex 0000000..9e88dc6[m
[1m--- /dev/null[m
[1m+++ b/secrets.py[m
[36m@@ -0,0 +1,4 @@[m
[32m+[m[32msecrets = {[m
[32m+[m[32m   'SSID' : 'your wifi',[m
[32m+[m[32m   'SSID_PASSWORD' : 'wifi password',[m
[32m+[m[32m   }[m
[1mdiff --git a/umqttsimple.py b/umqttsimple.py[m
[1mnew file mode 100644[m
[1mindex 0000000..269da1d[m
[1m--- /dev/null[m
[1m+++ b/umqttsimple.py[m
[36m@@ -0,0 +1,216 @@[m
[32m+[m[32mimport usocket as socket[m
[32m+[m[32mimport ustruct as struct[m
[32m+[m[32mfrom ubinascii import hexlify[m
[32m+[m
[32m+[m
[32m+[m[32mclass MQTTException(Exception):[m
[32m+[m[32m    pass[m
[32m+[m
[32m+[m
[32m+[m[32mclass MQTTClient:[m
[32m+[m[32m    def __init__([m
[32m+[m[32m        self,[m
[32m+[m[32m        client_id,[m
[32m+[m[32m        server,[m
[32m+[m[32m        port=0,[m
[32m+[m[32m        user=None,[m
[32m+[m[32m        password=None,[m
[32m+[m[32m        keepalive=0,[m
[32m+[m[32m        ssl=False,[m
[32m+[m[32m        ssl_params={},[m
[32m+[m[32m    ):[m
[32m+[m[32m        if port == 0:[m
[32m+[m[32m            port = 8883 if ssl else 1883[m
[32m+[m[32m        self.client_id = client_id[m
[32m+[m[32m        self.sock = None[m
[32m+[m[32m        self.server = server[m
[32m+[m[32m        self.port = port[m
[32m+[m[32m        self.ssl = ssl[m
[32m+[m[32m        self.ssl_params = ssl_params[m
[32m+[m[32m        self.pid = 0[m
[32m+[m[32m        self.cb = None[m
[32m+[m[32m        self.user = user[m
[32m+[m[32m        self.pswd = password[m
[32m+[m[32m        self.keepalive = keepalive[m
[32m+[m[32m        self.lw_topic = None[m
[32m+[m[32m        self.lw_msg = None[m
[32m+[m[32m        self.lw_qos = 0[m
[32m+[m[32m        self.lw_retain = False[m
[32m+[m
[32m+[m[32m    def _send_str(self, s):[m
[32m+[m[32m        self.sock.write(struct.pack("!H", len(s)))[m
[32m+[m[32m        self.sock.write(s)[m
[32m+[m
[32m+[m[32m    def _recv_len(self):[m
[32m+[m[32m        n = 0[m
[32m+[m[32m        sh = 0[m
[32m+[m[32m        while 1:[m
[32m+[m[32m            b = self.sock.read(1)[0][m
[32m+[m[32m            n |= (b & 0x7F) << sh[m
[32m+[m[32m            if not b & 0x80:[m
[32m+[m[32m                return n[m
[32m+[m[32m            sh += 7[m
[32m+[m
[32m+[m[32m    def set_callback(self, f):[m
[32m+[m[32m        self.cb = f[m
[32m+[m
[32m+[m[32m    def set_last_will(self, topic, msg, retain=False, qos=0):[m
[32m+[m[32m        assert 0 <= qos <= 2[m
[32m+[m[32m        assert topic[m
[32m+[m[32m        self.lw_topic = topic[m
[32m+[m[32m        self.lw_msg = msg[m
[32m+[m[32m        self.lw_qos = qos[m
[32m+[m[32m        self.lw_retain = retain[m
[32m+[m
[32m+[m[32m    def connect(self, clean_session=True):[m
[32m+[m[32m        self.sock = socket.socket()[m
[32m+[m[32m        addr = socket.getaddrinfo(self.server, self.port)[0][-1][m
[32m+[m[32m        self.sock.connect(addr)[m
[32m+[m[32m        if self.ssl:[m
[32m+[m[32m            import ussl[m
[32m+[m
[32m+[m[32m            self.sock = ussl.wrap_socket(self.sock, **self.ssl_params)[m
[32m+[m[32m        premsg = bytearray(b"\x10\0\0\0\0\0")[m
[32m+[m[32m        msg = bytearray(b"\x04MQTT\x04\x02\0\0")[m
[32m+[m
[32m+[m[32m        sz = 10 + 2 + len(self.client_id)[m
[32m+[m[32m        msg[6] = clean_session << 1[m
[32m+[m[32m        if self.user is not None:[m
[32m+[m[32m            sz += 2 + len(self.user) + 2 + len(self.pswd)[m
[32m+[m[32m            msg[6] |= 0xC0[m
[32m+[m[32m        if self.keepalive:[m
[32m+[m[32m            assert self.keepalive < 65536[m
[32m+[m[32m            msg[7] |= self.keepalive >> 8[m
[32m+[m[32m            msg[8] |= self.keepalive & 0x00FF[m
[32m+[m[32m        if self.lw_topic:[m
[32m+[m[32m            sz += 2 + len(self.lw_topic) + 2 + len(self.lw_msg)[m
[32m+[m[32m            msg[6] |= 0x4 | (self.lw_qos & 0x1) << 3 | (self.lw_qos & 0x2) << 3[m
[32m+[m[32m            msg[6] |= self.lw_retain << 5[m
[32m+[m
[32m+[m[32m        i = 1[m
[32m+[m[32m        while sz > 0x7F:[m
[32m+[m[32m            premsg[i] = (sz & 0x7F) | 0x80[m
[32m+[m[32m            sz >>= 7[m
[32m+[m[32m            i += 1[m
[32m+[m[32m        premsg[i] = sz[m
[32m+[m
[32m+[m[32m        self.sock.write(premsg, i + 2)[m
[32m+[m[32m        self.sock.write(msg)[m
[32m+[m[32m        # print(hex(len(msg)), hexlify(msg, ":"))[m
[32m+[m[32m        self._send_str(self.client_id)[m
[32m+[m[32m        if self.lw_topic:[m
[32m+[m[32m            self._send_str(self.lw_topic)[m
[32m+[m[32m            self._send_str(self.lw_msg)[m
[32m+[m[32m        if self.user is not None:[m
[32m+[m[32m            self._send_str(self.user)[m
[32m+[m[32m            self._send_str(self.pswd)[m
[32m+[m[32m        resp = self.sock.read(4)[m
[32m+[m[32m        assert resp[0] == 0x20 and resp[1] == 0x02[m
[32m+[m[32m        if resp[3] != 0:[m
[32m+[m[32m            raise MQTTException(resp[3])[m
[32m+[m[32m        return resp[2] & 1[m
[32m+[m
[32m+[m[32m    def disconnect(self):[m
[32m+[m[32m        self.sock.write(b"\xe0\0")[m
[32m+[m[32m        self.sock.close()[m
[32m+[m
[32m+[m[32m    def ping(self):[m
[32m+[m[32m        self.sock.write(b"\xc0\0")[m
[32m+[m
[32m+[m[32m    def publish(self, topic, msg, retain=False, qos=0):[m
[32m+[m[32m        pkt = bytearray(b"\x30\0\0\0")[m
[32m+[m[32m        pkt[0] |= qos << 1 | retain[m
[32m+[m[32m        sz = 2 + len(topic) + len(msg)[m
[32m+[m[32m        if qos > 0:[m
[32m+[m[32m            sz += 2[m
[32m+[m[32m        assert sz < 2097152[m
[32m+[m[32m        i = 1[m
[32m+[m[32m        while sz > 0x7F:[m
[32m+[m[32m            pkt[i] = (sz & 0x7F) | 0x80[m
[32m+[m[32m            sz >>= 7[m
[32m+[m[32m            i += 1[m
[32m+[m[32m        pkt[i] = sz[m
[32m+[m[32m        # print(hex(len(pkt)), hexlify(pkt, ":"))[m
[32m+[m[32m        self.sock.write(pkt, i + 1)[m
[32m+[m[32m        self._send_str(topic)[m
[32m+[m[32m        if qos > 0:[m
[32m+[m[32m            self.pid += 1[m
[32m+[m[32m            pid = self.pid[m
[32m+[m[32m            struct.pack_into("!H", pkt, 0, pid)[m
[32m+[m[32m            self.sock.write(pkt, 2)[m
[32m+[m[32m        self.sock.write(msg)[m
[32m+[m[32m        if qos == 1:[m
[32m+[m[32m            while 1:[m
[32m+[m[32m                op = self.wait_msg()[m
[32m+[m[32m                if op == 0x40:[m
[32m+[m[32m                    sz = self.sock.read(1)[m
[32m+[m[32m                    assert sz == b"\x02"[m
[32m+[m[32m                    rcv_pid = self.sock.read(2)[m
[32m+[m[32m                    rcv_pid = rcv_pid[0] << 8 | rcv_pid[1][m
[32m+[m[32m                    if pid == rcv_pid:[m
[32m+[m[32m                        return[m
[32m+[m[32m        elif qos == 2:[m
[32m+[m[32m            assert 0[m
[32m+[m
[32m+[m[32m    def subscribe(self, topic, qos=0):[m
[32m+[m[32m        assert self.cb is not None, "Subscribe callback is not set"[m
[32m+[m[32m        pkt = bytearray(b"\x82\0\0\0")[m
[32m+[m[32m        self.pid += 1[m
[32m+[m[32m        struct.pack_into("!BH", pkt, 1, 2 + 2 + len(topic) + 1, self.pid)[m
[32m+[m[32m        # print(hex(len(pkt)), hexlify(pkt, ":"))[m
[32m+[m[32m        self.sock.write(pkt)[m
[32m+[m[32m        self._send_str(topic)[m
[32m+[m[32m        self.sock.write(qos.to_bytes(1, "little"))[m
[32m+[m[32m        while 1:[m
[32m+[m[32m            op = self.wait_msg()[m
[32m+[m[32m            if op == 0x90:[m
[32m+[m[32m                resp = self.sock.read(4)[m
[32m+[m[32m                # print(resp)[m
[32m+[m[32m                assert resp[1] == pkt[2] and resp[2] == pkt[3][m
[32m+[m[32m                if resp[3] == 0x80:[m
[32m+[m[32m                    raise MQTTException(resp[3])[m
[32m+[m[32m                return[m
[32m+[m
[32m+[m[32m    # Wait for a single incoming MQTT message and process it.[m
[32m+[m[32m    # Subscribed messages are delivered to a callback previously[m
[32m+[m[32m    # set by .set_callback() method. Other (internal) MQTT[m
[32m+[m[32m    # messages processed internally.[m
[32m+[m[32m    def wait_msg(self):[m
[32m+[m[32m        res = self.sock.read(1)[m
[32m+[m[32m        self.sock.setblocking(True)[m
[32m+[m[32m        if res is None:[m
[32m+[m[32m            return None[m
[32m+[m[32m        if res == b"":[m
[32m+[m[32m            raise OSError(-1)[m
[32m+[m[32m        if res == b"\xd0":  # PINGRESP[m
[32m+[m[32m            sz = self.sock.read(1)[0][m
[32m+[m[32m            assert sz == 0[m
[32m+[m[32m            return None[m
[32m+[m[32m        op = res[0][m
[32m+[m[32m        if op & 0xF0 != 0x30:[m
[32m+[m[32m            return op[m
[32m+[m[32m        sz = self._recv_len()[m
[32m+[m[32m        topic_len = self.sock.read(2)[m
[32m+[m[32m        topic_len = (topic_len[0] << 8) | topic_len[1][m
[32m+[m[32m        topic = self.sock.read(topic_len)[m
[32m+[m[32m        sz -= topic_len + 2[m
[32m+[m[32m        if op & 6:[m
[32m+[m[32m            pid = self.sock.read(2)[m
[32m+[m[32m            pid = pid[0] << 8 | pid[1][m
[32m+[m[32m            sz -= 2[m
[32m+[m[32m        msg = self.sock.read(sz)[m
[32m+[m[32m        self.cb(topic, msg)[m
[32m+[m[32m        if op & 6 == 2:[m
[32m+[m[32m            pkt = bytearray(b"\x40\x02\0\0")[m
[32m+[m[32m            struct.pack_into("!H", pkt, 2, pid)[m
[32m+[m[32m            self.sock.write(pkt)[m
[32m+[m[32m        elif op & 6 == 4:[m
[32m+[m[32m            assert 0[m
[32m+[m[32m        return op[m
[32m+[m
[32m+[m[32m    # Checks whether a pending message from server is available.[m
[32m+[m[32m    # If not, returns immediately with None. Otherwise, does[m
[32m+[m[32m    # the same processing as wait_msg.[m
[32m+[m[32m    def check_msg(self):[m
[32m+[m[32m        self.sock.setblocking(False)[m
[32m+[m[32m        return self.wait_msg()[m
\ No newline at end of file[m
