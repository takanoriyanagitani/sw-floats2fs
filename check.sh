#!/bin/sh

jobs=8

find \
	Sources \
	-type f \
	-name '*.swift' |
	xargs \
		swiftc \
		-typecheck \
		-j ${jobs}
