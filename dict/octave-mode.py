#!/usr/bin/env python3
import os, re, sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(".."))
import docsets
names = open("octave-mode.keywords").read().splitlines()
root = "https://www.gnu.org/software/octave/doc/interpreter/"
soup = docsets.soup_from_url("https://www.gnu.org/software/octave/doc/interpreter/Function-Index.html")
tags = soup.find_all("a", dict(href=re.compile("#index-")))
names.extend(x.text.strip() for x in tags)
names = sorted(set(names))
open("octave-mode", "w").write("\n".join(names) + "\n")
