@echo off
if exist "%HOME%\.emacs.d\server\server" (
    :: Open files given as arguments in already running server.
    "%PROGRAMFILES(X86)%\GNU Emacs\bin\emacsclientw.exe" ^
        -n %1 %2 %3 %4 %5 %6 %7 %8 %9
) else (
    :: Start a new emacs, open files given as arguments and start the server.
    "%PROGRAMFILES(X86)%\GNU Emacs\bin\runemacs.exe" ^
        -g 90x35 --eval "(server-start)" %1 %2 %3 %4 %5 %6 %7 %8 %9
)
