#!/usr/bin/env python3
import bs4, re, time, urllib.request
def soup_from_url(url):
    print("Parsing {}".format(url))
    page = urllib.request.urlopen(url).read()
    return bs4.BeautifulSoup(page, "html.parser")
def get_hrefs(soup, pattern):
    return soup.find_all("a", {"href": re.compile(pattern)})
names = []
soup = soup_from_url("http://doc.qt.io/qt-5/qmltypes.html")
root = "http://doc.qt.io/qt-5/"
for tag in get_hrefs(soup, "qml-.*html"):
    names.append(tag.text.strip())
    soup = soup_from_url(root + tag.attrs["href"].strip())
    for tag in get_hrefs(soup, "-(prop|method)$"):
        names.append(tag.text.strip())
    time.sleep(1)
soup = soup_from_url("https://sailfishos.org/develop/docs/silica/sailfish-silica-all.html")
root = "https://sailfishos.org/develop/docs/silica/"
for tag in get_hrefs(soup, "qml-.*html"):
    names.append(tag.text.strip())
    soup = soup_from_url(root + tag.attrs["href"].strip())
    for tag in get_hrefs(soup, "-(prop|method)$"):
        names.append(tag.text.strip())
    time.sleep(1)
for i in range(len(names)):
    names[i] = re.sub(r"^.+::", "", names[i])
    names[i] = re.sub(r"\(\)$", "", names[i])
    names[i] = re.sub("r: .+$", "", names[i])
names = list(filter(lambda x: len(x) > 2, names))
names = sorted(set(names))
open("ots-qml-mode", "w").write("\n".join(names) + "\n")
