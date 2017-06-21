#!/usr/bin/env python3
import os, re, sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(".."))
import docsets
names = []
root = "https://doc.qt.io/qt-5.6/"
soup = docsets.soup_from_url("https://doc.qt.io/qt-5.6/qmltypes.html")
for tag in soup.find_all("a", dict(href=re.compile("qml-.*html"))):
    names.append(tag.text.split(":")[0].strip())
    path = root + tag.attrs["href"].strip()
    soup = docsets.soup_from_url(path)
    for li in soup.find_all("li", class_="fn"):
        attrs = dict(href=re.compile("-(prop|method)$"))
        for tag in li.find_all("a", attrs):
            names.append(tag.text.strip())
root = "https://sailfishos.org/develop/docs/silica/"
soup = docsets.soup_from_url("https://sailfishos.org/develop/docs/silica/sailfish-silica-all.html")
for tag in soup.find_all("a", dict(href=re.compile("qml-.*html"))):
    names.append(tag.text.split(":")[0].strip())
    path = root + tag.attrs["href"].strip()
    soup = docsets.soup_from_url(path)
    for li in soup.find_all("li", class_="fn"):
        attrs = dict(href=re.compile("-(prop|method)$"))
        for tag in li.find_all("a", attrs):
            names.append(tag.text.strip())
names = sorted(set(names))
open("ots-qml-mode", "w").write("\n".join(names) + "\n")
