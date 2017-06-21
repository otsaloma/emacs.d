#!/usr/bin/env python3
# https://sqlite.org/lang_keywords.html
names = open("sql-mode.in").read().splitlines()
names = [x.lower() for x in names] + [x.upper() for x in names]
names = sorted(set(names))
open("sql-mode", "w").write("\n".join(names) + "\n")
