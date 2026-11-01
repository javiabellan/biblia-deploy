

http://jafrog.com/2013/11/23/colors-in-terminal.html
https://en.wikipedia.org/wiki/ANSI_escape_code#SGR



## `ESC` character



|                   python
|-----------|------|-------------
| Character | \e   |   -
| ASCII Oct | 33   | "\033"
| ASSII Dec | 23   |   - 
| ASCII Hex | 1B   | "\x1B"
| Unicode   | 001B | "\u001b"


Shell   \e
ASCII Hex   \0x1B
ASCII Oct   \033



```python
for esc in ["\\e", "\23", "\o33", "\033", "\x1B", "\u001b"]:
    GREEN = esc + "[92m"
    RED   = esc + "[91m"
    ENDC  = esc + '[0m'
    print(GREEN + " hello " + RED + "world" + ENDC)
```

Basic 8 colors  30..37


Basic "high contrast" colors    90..97


DARK_BLUE = '\033[94m'
PURPLE = '\033[95m'
OKCYAN = '\033[96m'
OKGREEN = # '\033[92m' # "\033[1;32m"
WARNING = '\033[93m'
FAIL = '\033[91m'



        
\ooo    Octal value 
\xhh    Hex value



ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'


Bold: \u001b[1m
Underline: \u001b[4m
Reversed: \u001b[7m


Black: \u001b[30m
Red: \u001b[31m
Green: \u001b[32m
Yellow: \u001b[33m
Blue: \u001b[34m
Magenta: \u001b[35m
Cyan: \u001b[36m
White: \u001b[37m
Reset: \u001b[0m

Bright Black: \u001b[30;1m
Bright Red: \u001b[31;1m
Bright Green: \u001b[32;1m
Bright Yellow: \u001b[33;1m
Bright Blue: \u001b[34;1m
Bright Magenta: \u001b[35;1m
Bright Cyan: \u001b[36;1m
Bright White: \u001b[37;1m
Reset: \u001b[0m

Background Bright Black: \u001b[40;1m
Background Bright Red: \u001b[41;1m
Background Bright Green: \u001b[42;1m
Background Bright Yellow: \u001b[43;1m
Background Bright Blue: \u001b[44;1m
Background Bright Magenta: \u001b[45;1m
Background Bright Cyan: \u001b[46;1m
Background Bright White: \u001b[47;1m

ENDCOLOR = '\033[0m'
RED    = '\033[91m'
GREEN  = '\033[92m'
YELLOW = '\033[93m'
print(GREEN + "● OK\t" + ENDC + "This text is Bright Green\n" )
print(YELLOW + "● WARNING\t" + ENDC + "This text is Bright Green\n" )
print(RED + "● ERROR\t" + ENDC + "This text is Bright Green\n" )