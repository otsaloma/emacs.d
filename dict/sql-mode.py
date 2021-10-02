#!/usr/bin/env python3

from pathlib import Path

# https://sqlite.org/lang_keywords.html
names = Path("sql-mode.in").read_text("utf-8").splitlines()
names = [x.lower() for x in names] + [x.upper() for x in names]
names = sorted(set(names))
text = "\n".join(names) + "\n"
Path("sql-mode").write_text(text, "utf-8")
