all: html
	g++  global.cpp -o aeinfo -lusb -DUSE_COLORS -Wno-deprecated
	g++  aquaerod.cpp -o aquaerod -lusb -lpthread -Wno-deprecated

static: html
	g++ global.cpp -o aeinfo -lusb -static -Wno-deprecated -DUSE_COLORS
	g++ -o aquaerod -lusb -static -Wno-deprecated -lpthread aquaerod.cpp

cygwin:
	g++ global.cpp -o aeinfo -DWINDOWS -lsetupapi

nocolors:
	g++ global.cpp -o aeinfo -lusb

doc:
	doxygen

html:
	cat htdocs/fan.1.htm | sed -e "s/FAN 1/FAN 2/" -e "s/fan.1/fan.2/g" > htdocs/fan.2.htm
	cat htdocs/fan.1.htm | sed -e "s/FAN 1/FAN 3/" -e "s/fan.1/fan.3/g" > htdocs/fan.3.htm
	cat htdocs/fan.1.htm | sed -e "s/FAN 1/FAN 4/" -e "s/fan.1/fan.4/g" > htdocs/fan.4.htm
	cat htdocs/sensor.1.htm | sed -e "s/SENSOR 1/SENSOR 2/" -e "s/sensor.1/sensor.2/g" > htdocs/sensor.2.htm
	cat htdocs/sensor.1.htm | sed -e "s/SENSOR 1/SENSOR 3/" -e "s/sensor.1/sensor.3/g" > htdocs/sensor.3.htm
	cat htdocs/sensor.1.htm | sed -e "s/SENSOR 1/SENSOR 4/" -e "s/sensor.1/sensor.4/g" > htdocs/sensor.4.htm
	cat htdocs/sensor.1.htm | sed -e "s/SENSOR 1/SENSOR 5/" -e "s/sensor.1/sensor.5/g" > htdocs/sensor.5.htm
	cat htdocs/sensor.1.htm | sed -e "s/SENSOR 1/SENSOR 6/" -e "s/sensor.1/sensor.6/g" > htdocs/sensor.6.htm


clean:
	rm -f aeinfo aquaerod *.o

install:
	install -o root -g root -m 755 -s aeinfo /usr/local/bin
	install -o root -g root -m 755 -d /opt/aquaerod/
	install -o root -g root -m 755 -s aquaerod /opt/aquaerod/
	install -o root -g root -m 755 -d /opt/aquaerod/htdocs/images/
	install -o root -g root -m 755 htdocs/*.htm /opt/aquaerod/htdocs/
	install -o root -g root -m 755 htdocs/images/* /opt/aquaerod/htdocs/images/

uninstall:
	rm -f /usr/local/bin/aeinfo
	echo "To remove the aquaerod-Daemon, enter  'rm -rf /opt/aquaerod/'"
