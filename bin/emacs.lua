-- Devilspie2: Dark Emacs window decorations.
-- http://unix.stackexchange.com/q/14129
if (string.lower(get_window_class()) == "emacs" and
    get_window_type() == "WINDOW_TYPE_NORMAL") then
   os.execute("xprop -id " .. get_window_xid() ..
      " -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT dark")
end
