#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

swift-format \
	format \
	--in-place \
	--recursive \
	--ignore-unparsable-files \
	--parallel \
	--color-diagnostics \
	./Sources \
	./Package.swift
