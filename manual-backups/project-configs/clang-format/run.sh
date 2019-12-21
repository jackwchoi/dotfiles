#!/usr/bin/env bash

find . -type f |
  grep -P '\.(c|cpp|h|hpp)$' |
  xargs clang-format -i
