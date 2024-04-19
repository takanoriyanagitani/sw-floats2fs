#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

docdir=./doc.d
mkdir -p "${docdir}"

swift \
	package \
	--jobs ${jobs} \
	--allow-writing-to-directory "${docdir}" \
	generate-documentation \
	--enable-inherited-docs \
	--transform-for-static-hosting \
	--include-extended-types \
	--output-path "${docdir}" \
	--product FloatsToFileSystem
