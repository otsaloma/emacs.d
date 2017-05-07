#!/usr/bin/env python3
names = (dir(__builtins__) +
         dir(bool()) +
         dir(dict()) +
         dir(float()) +
         dir(int()) +
         dir(list()) +
         dir(set()) +
         dir(str()) +
         dir(tuple()))

names = sorted(set(names))
names = [x for x in names if not x.startswith("_")]
open("python-mode", "w").write("\n".join(names) + "\n")
