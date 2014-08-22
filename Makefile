SHELL := /bin/bash

all: install
install:
	install -m 0644 -o root -g root klez.xml /etc/layman/overlays
