#!/bin/bash
# Copyright (c) 2013 The Chromium Embedded Framework Authors. All rights
# reserved. Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file.

# Determine the absolute path to the library directory.
export LIB_PATH=$(readlink -f "./bin/lib/linux64")

# Necessary for jcef_helper to find libcef.so.
if [ -n "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=$LIB_PATH:${LD_LIBRARY_PATH}
else
  LD_LIBRARY_PATH=$LIB_PATH
fi
export LD_LIBRARY_PATH

# Preload libcef.so to avoid crashes.
LD_PRELOAD=$LIB_PATH/libcef.so java -cp "./bin:./bin/*" -Djava.library.path=$LIB_PATH tests.detailed.MainFrame "$@"
