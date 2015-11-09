#!/usr/bin/env python3
# -*- coding: utf-8-unix -*-
with open("python-mode", "w") as f:
    f.write("\n".join(sorted(dir(__builtins__))) + "\n")
