#!/usr/bin/env python3
import re
lines = ["\n# Keybindings"]
for line in open("keys.in", "r").read().splitlines():
    if line.startswith("["):
        title = line[1:-1]
        lines.append("\n## {}\n".format(title))
        lines.append("| Key | Command |")
        lines.append("| ---: | :--- |")
    elif line:
        key, command = re.split("\s+", line, 1)
        key = re.split(r"(?<!\+)\+", key)
        key = " + ".join("<kbd>{}</kbd>".format(x) for x in key)
        lines.append("| {} | {} |".format(key, command))
with open("keys.md", "w") as f:
    f.write("\n".join(lines) + "\n")
