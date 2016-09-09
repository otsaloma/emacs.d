@echo off
if exist "%HOME%\.emacs.d\server\server" (
    :: Open files given as arguments in existing Emacs.
    "%PROGRAMFILES(X86)%\GNU Emacs\bin\emacsclientw.exe" -n %*
) else (
    :: Start a new Emacs and open files given as arguments.
    "%PROGRAMFILES(X86)%\GNU Emacs\bin\runemacs.exe" -g 90x35 --eval "(server-start)" %*
)
