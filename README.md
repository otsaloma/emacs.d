emacs.d
=======

This is my personal Emacs configuration, i.e. `~/.emacs.d`. It contains
oddities (e.g. entirely redesigned keybindings) and, for some features,
dependencies on unavailable executables or assumptions about a
particular platform and environment. It is not a recommended general-use
solution and is unlikely to be of popular interest as-is.

This configuration should work on both Unix and Windows, perhaps Mac
too, but that has not been tested. For Windows users,
[Vincent Goulet's Emacs package][1] is recommended. All needed packages
not included in Emacs itself should be available via ELPA. You can
install them in one go with the following shell command.

    emacs24 --script bootstrap.el

As an exception, [YASnippet][2] is included under `site-lisp` due to
relying on a particular older version.

My emacs.d is available under the GNU General Public License (GPL), see
the file `COPYING` for details. For YASnippet's authors, copyright and
license, see the file `site-lisp/yasnippet.el`.

See also my [docsets][3] for documentation packages used by default by
this configuration.

![Screenshot](http://dl.dropboxusercontent.com/u/39625783/emacs-1.png)

On GNOME, the default dark theme can be complemented with the following
Lua code as a [Devilspie2][4] script.

    if (get_application_name() == "emacs24" and
        get_window_type() == "WINDOW_TYPE_NORMAL") then
       os.execute("xprop -id " .. get_window_xid() .. " -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT dark")
    end

 [1]: http://vgoulet.act.ulaval.ca/en/emacs/
 [2]: http://github.com/capitaomorte/yasnippet
 [3]: http://github.com/otsaloma/docsets
 [4]: http://www.gusnan.se/devilspie2/
