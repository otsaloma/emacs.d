emacs.d
=======

This is my personal Emacs configuration, i.e. `~/.emacs.d`. It contains
oddities (e.g. entirely redesigned keybindings) and, for some features,
dependencies on unavailable executables or assumptions about a
particular platform and environment. It is not a recommended general-use
solution and is unlikely to be of popular interest as-is.

![Screenshot](http://otsaloma.io/pub/emacs-1.png)

This configuration should work on both Unix and Windows, perhaps Mac
too, but that has not been tested. For Windows users,
[Vincent Goulet's Emacs package][1] is recommended. All needed packages
not included in Emacs itself should be available via ELPA. You can
install them in one go with the following shell command.

    emacs25 --script bootstrap.el

My emacs.d is available under the GNU General Public License (GPL), see
the file [`COPYING`](COPYING) for details. See also my [docsets][2] for
documentation packages used by default by this configuration.

[1]: http://vgoulet.act.ulaval.ca/en/emacs/
[2]: http://github.com/otsaloma/docsets
