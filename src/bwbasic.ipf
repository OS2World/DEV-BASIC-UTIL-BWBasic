:userdoc.
:title.Bywater BASIC Documentation
.********************************************************************
.*
.*
.*
:h1.Read Me
:lines align=center.
Bywater Software Announces
the First Public Release of


:hp5.Bywater BASIC Interpreter/Shell, version 1.10:ehp5.

Copyright (c) 1992, Ted A. Campbell
for bwBASIC version 1.10, 1 November 1992
:elines.
:font facename=Courier size=16x14.
:lines.
DESCRIPTION&colon.

   The Bywater BASIC Interpreter (bwBASIC) implements a large
   superset of the ANSI Standard for Minimal BASIC (X3.60-1978)
   implemented in ANSI C, and offers a simple interactive environ-
   ment including some shell program facilities as an extension of
   BASIC. The interpreter has been compiled successfully on a range
   of ANSI C compilers on varying platforms with no alterations
   to source code necessary. 


OBTAINING THE SOURCE CODE&colon.

   The source code for bwBASIC 1.10 will be posted to network news
   groups and is available immediately by anonymous ftp. To obtain
   the source code, ftp to site duke.cs.duke.edu, cd to /pub/bywater
   and get the appropriate files.  These are as follows&colon.

   bwb110.zip	Source code in ZIP compressed format, with text lines
   		concluded with CR-LF. This is the appropriate version
   		for DOS-based computers.

   bwb110.tar.Z	Tar'd and compressed source code with text lines con-
   		cluded with LF only.  This is the appropriate version
   		for Unix-based computers.


COMMUNICATIONS&colon.

   Ted A. Campbell
   Bywater Software
   P.O. Box 4023
   Duke Station
   Durham, NC  27706
   USA

   email&colon.  tcamp@acpub.duke.edu


A LIST OF BASIC COMMANDS AND FUNCTIONS IMPLEMENTED in bwBASIC 1.10&colon.

   ABS( number )
   ASC( string$ )
   ATN( number )
   CHAIN [MERGE] file-name [, line-number] [, ALL]
   CHR$( number )
   CINT( number )
   CLEAR
   CLOSE [[#]file-number]...
   COMMON variable [, variable...]
   COS( number )
   CSNG( number )
   CVD( string$ )
   CVI( string$ )
   CVS( string$ )
   DATA constant[,constant]...
   DATE$
   DEF FNname(arg...)] = expression
   DEFDBL letter[-letter](, letter[-letter])...
   DEFINT letter[-letter](, letter[-letter])...
   DEFSNG letter[-letter](, letter[-letter])...
   DEFSTR letter[-letter](, letter[-letter])...
   DELETE line[-line]
   DIM variable(elements...)[variable(elements...)]...
   END
   ENVIRON variable-string = string
   ENVIRON$( variable-string )
   EOF( device-number )
   ERASE variable[, variable]...
   ERL
   ERR
   ERROR number
   EXP( number )
   FIELD [#] device-number, number AS string-variable [, number AS string-variable...]
   FOR counter = start TO finish [STEP increment]
   GET [#] device-number [, record-number]
   GOSUB line
   GOTO line
   HEX$( number )
   IF expression THEN statement [ELSE statement]
   INPUT [# device-number]|[;]["prompt string";]list of variables
   INSTR( [start-position,] string-searched$, string-pattern$ )
   INT( number )
   KILL file-name
   LEFT$( string$, number-of-spaces )
   LEN( string$ )
   LET variable = expression
   LINE INPUT [[#] device-number,]["prompt string";] string-variable$
   LIST line[-line]
   LOAD file-name
   LOC( device-number )
   LOF( device-number )
   LOG( number )
   LSET string-variable$ = expression
   MERGE file-name
   MID$( string$, start-position-in-string[, number-of-spaces ] )
   MKD$( double-value# )
   MKI$( integer-value% )
   MKS$( single-value! )
   NAME old-file-name AS new-file-name
   NEW
   NEXT counter
   OCT$( number )
   ON variable GOTO|GOSUB line[,line,line,...]
   ON ERROR GOSUB line
   OPEN O|I|R, [#]device-number, file-name [,record length]
        file-name FOR INPUT|OUTPUT|APPEND AS [#]device-number [LEN = record-length]
   OPTION BASE number
   POS
   PRINT [# device-number,][USING format-string$;] expressions...
   PUT [#] device-number [, record-number]
   RANDOMIZE number
   READ variable[, variable]...
   REM string
   RESTORE line
   RETURN
   RIGHT$( string$, number-of-spaces )
   RND( number )
   RSET string-variable$ = expression
   RUN [line][file-name]
   SAVE file-name
   SGN( number )
   SIN( number )
   SPACE$( number )
   SPC( number )
   SQR( number )
   STOP
   STR$( number )
   STRING$( number, ascii-value|string$ )
   SWAP variable, variable
   SYSTEM
   TAB( number )
   TAN( number )
   TIME$
   TIMER
   TROFF
   TRON
   VAL( string$ )
   WEND
   WHILE expression
   WIDTH [# device-number,] number
   WRITE [# device-number,] element [, element ].... 

   If DIRECTORY_CMDS is set to TRUE when the program is compiled,
   then the following commands will be available&colon.

   CHDIR pathname
   MKDIR pathname
   RMDIR pathname
:elines.
:font facename=default size=0x0.
.********************************************************************
.*
.*
.*
:h1.Documentation
:lines align=center.
:hp5.Bywater BASIC Interpreter/Shell, version 1.10:ehp5.

Copyright (c) 1992, Ted A. Campbell
for bwBASIC version 1.10, 1 November 1992
:elines.
:font facename=Courier size=16x14.
.********************************************************************
.*
.*
.*
:h2.Description
:p.
The Bywater BASIC Interpreter (bwBASIC) implements a large
superset of the ANSI Standard for Minimal BASIC (X3.60-1978)
in ANSI C and offers shell program facilities as an extension
of BASIC.
:p.
The set of BASIC commands and functions implemented is fairly
limited (see section three below), although more commands and
functions are implemented than appear in the specification
for Minimal BASIC. There are no commands that are terminal- or
hardware specific. (Seriously -- CLS may work under bwBASIC
on your DOS-based pc, but that is because bwBASIC shells
out to DOS when it does not recognize CLS and executes CLS there.)
:p.
The interpreter is slow.  Whenever faced with a choice between
conceptual clarity and speed, I have consistently chosen
the former.  The interpreter is the simplest design available,
and utilizes no system of intermediate code, which would speed
up considerably its operation.  As it is, each line is interpreted
afresh as the interpreter comes to it.
:p.
bwBASIC implements one feature not available in previous BASIC
interpreters&colon. a shell command can be entered interactively at the
bwBASIC prompt, and the interpreter will execute it under a
command shell.  For instance, the command "dir *.bas" can be
entered in bwBASIC (under DOS, or "ls -l *.bas" under UNIX) and
it will be executed as from the operating system command line.
Shell commands can also be given on numbered lines in a bwBASIC
program, so that bwBASIC can be used as a shell programming
language. bwBASIC's implementation of the RMDIR, CHDIR, MKDIR,
NAME, KILL, ENVIRON, and ENVIRON$() commands and functions
offer further shell-processing capabilities.
.********************************************************************
.*
.*
.*
:h2.Terms of Use
:p.
The bwBASIC source code and executables produced from it can be
used subject to the following statement which is included in
the header to all the source code files&colon.
:p.
All U.S. and international copyrights are claimed by the
author. The author grants permission to use this code
and software based on it under the following conditions&colon.
(a) in general, the code and software based upon it may be
used by individuals and by non-profit organizations; (b) it
may also be utilized by governmental agencies in any country,
with the exception of military agencies; (c) the code and/or
software based upon it may not be sold for a profit without
an explicit and specific permission from the author, except
that a minimal fee may be charged for media on which it is
copied, and for copying and handling; (d) the code must be
distributed in the form in which it has been released by the
author; and (e) the code and software based upon it may not
be used for illegal activities.
.********************************************************************
.*
.*
.*
:h2.BASIC Commands and Functions Implemented
:lines.
ABS( number )
ASC( string$ )
ATN( number )
CHAIN [MERGE] file-name [, line-number] [, ALL]
CHR$( number )
CINT( number )
CLEAR
CLOSE [[#]file-number]...
COMMON variable [, variable...]
COS( number )
CSNG( number )
CVD( string$ )
CVI( string$ )
CVS( string$ )
DATA constant[,constant]...
DATE$
DEF FNname(arg...)] = expression
DEFDBL letter[-letter](, letter[-letter])...
DEFINT letter[-letter](, letter[-letter])...
DEFSNG letter[-letter](, letter[-letter])...
DEFSTR letter[-letter](, letter[-letter])...
DELETE line[-line]
DIM variable(elements...)[variable(elements...)]...
END
ENVIRON variable-string = string
ENVIRON$( variable-string )
EOF( device-number )
ERASE variable[, variable]...
ERL
ERR
ERROR number
EXP( number )
FIELD [#] device-number, number AS string-variable [, number AS string-variable...]
FOR counter = start TO finish [STEP increment]
GET [#] device-number [, record-number]
GOSUB line
GOTO line
HEX$( number )
IF expression THEN statement [ELSE statement]
INPUT [# device-number]|[;]["prompt string";]list of variables
INSTR( [start-position,] string-searched$, string-pattern$ )
INT( number )
KILL file-name
LEFT$( string$, number-of-spaces )
LEN( string$ )
LET variable = expression
LINE INPUT [[#] device-number,]["prompt string";] string-variable$
LIST line[-line]
LOAD file-name
LOC( device-number )
LOF( device-number )
LOG( number )
LSET string-variable$ = expression
MERGE file-name
MID$( string$, start-position-in-string[, number-of-spaces ] )
MKD$( double-value# )
MKI$( integer-value% )
MKS$( single-value! )
NAME old-file-name AS new-file-name
NEW
NEXT counter
OCT$( number )
ON variable GOTO|GOSUB line[,line,line,...]
ON ERROR GOSUB line
OPEN O|I|R, [#]device-number, file-name [,record length]
     file-name FOR INPUT|OUTPUT|APPEND AS [#]device-number [LEN = record-length]
OPTION BASE number
POS
PRINT [# device-number,][USING format-string$;] expressions...
PUT [#] device-number [, record-number]
RANDOMIZE number
READ variable[, variable]...
REM string
RESTORE line
RETURN
RIGHT$( string$, number-of-spaces )
RND( number )
RSET string-variable$ = expression
RUN [line][file-name]
SAVE file-name
SGN( number )
SIN( number )
SPACE$( number )
SPC( number )
SQR( number )
STOP
STR$( number )
STRING$( number, ascii-value|string$ )
SWAP variable, variable
SYSTEM
TAB( number )
TAN( number )
TIME$
TIMER
TROFF
TRON
VAL( string$ )
WEND
WHILE expression
WIDTH [# device-number,] number
WRITE [# device-number,] element [, element ]....
:elines.
:p.
If DIRECTORY_CMDS is set to TRUE when the program is compiled,
then the following commands will be available&colon.
:lines.
CHDIR pathname
MKDIR pathname
RMDIR pathname
:elines.
:p.
:hp8.[There commands *are* implemented]:ehp8.
:p.
If DEBUG is set to TRUE when the program is compiled then
the following debugging commands (unique to bwBASIC) will
be available&colon.
:lines.
VARS                 (prints a list of all variables)
CMDS                 (prints a list of all commands)
FNCS                 (prints a list of all functions)
:elines.
:p.
:hp8.[There commands *are* implemented]:ehp8.
:p.
If COMMAND_SHELL is set to TRUE when the program is compiled,
then the user may enter a shell command at the bwBASIC prompt.
.********************************************************************
.*
.*
.*
:h2.Some Notes on Usage
:p.
An interactive environment is provided, so that a line with a
line number can be entered at the bwBASIC prompt and it will be
added to the program in memory.
:p.
Line numbers are not strictly required, but are useful if the
interactive enviroment is used for programming.  For longer
program entry one might prefer to use an ASCII text editor, and
in this case lines can be entered without numbers. In this case,
however, one will not be able to alter the numberless lines
within the interactive environment.
:p.
Command names and function names are not case sensitive,
so that "Run" and "RUN" and "run" are equivalent and "abs()"
and "ABS()" and "Abs()" are equivalent. HOWEVER&colon. variable
names ARE case sensitive in bwbASIC, so that "d$" and "D$"
are different variables.  This differs from some BASIC
implementations where variable names are not case sensitive.
:p.
A filename can be specified on the command line and will be
LOADed and RUN immediately, so that the command line
:font facename=Courier size=16x14.
:p.
bwbasic prog.bas
:font facename=default size=0x0.
:p.
will load and execute "prog.bas".
:p.
All programs are stored as ASCII text files.
:p.
TRUE is defined as -1 and FALSE is defined as 0 in the default
distribution of bwBASIC. These definitions can be changed by
those compiling bwBASIC (see file BWBASIC.H).
:p.
Assignment must be made to variables.  This differs from some
implementations of BASIC where assignment can be made to a
function.  Implication&colon. "INSTR( 3, x$, y$ ) = z$" will not
work under bwBASIC.
:p.
:hp2.Notes on the implementation of specific commands&colon.:ehp2.
:p.
CVI(), CVD(), CVS(), MKI$(), MKD$(), MKS$()&colon. These functions
are implemented, but are dependent on a) the sizes for integer,
float, and double values on particular systems, and b) how
particular versions of C store these numerical values. The
implication is that data files created using these functions
on a DOS-based microcomputer may not be translated correctly
by bwBASIC running on a Unix-based computer.  Similarly, data
files created by bwBASIC compiled by one version of C may not be
readable by bwBASIC compiled by another version of C (even under
the same operating system). So be careful with these.
:p.
ENVIRON&colon.  The ENVIRON command requires BASIC strings on either
side of the equals sign.  Thus&colon.
:font facename=Courier size=16x14.
:p.
      environ "PATH" = "/usr/bin"
:font facename=default size=0x0.
:p.
It might be noted that this differs from the implementation
of ENVIRON in some versions of BASIC, but bwBASIC's ENVIRON
allows BASIC variables to be used on either side of the equals
sign.  Note that the function ENVIRON$() is different from the
command, and be aware of the fact that in some operating systems
an environment variable set within a program will not be passed
to its parent shell.
:p.
ERR&colon. Note that if PROG_ERRORS has been defined when bwBASIC is
compiled, the ERR variable will not be set correctly upon
errors.  It only works when standard error messages are used.
:p.
FOR and NEXT&colon.  In this implementation of bwBASIC, a NEXT
statement must appear in the first position in a program
line; it cannot appear in a line segment beyond a colon.
:p.
INPUT&colon. bwBASIC cannot support the optional feature of INPUT
that suppresses the carriage-return and line-feed at the end
of the input.  This is because ANSI C does not provide for any
means of input other than CR-LF-terminated strings.
.********************************************************************
.*
.*
.*
:h2.Unimplemented Commands and Functions
:p.
There are a few items not implemented that have been so long
a part of standard BASICs that their absence will seem surprising.
In each case, though, their implementation would require opera-
ting-system-specific functions or terminal-specific functions
that ANSI C cannot provide. Some specific examples&colon.
:dl compact tsize=13.
:dt.:hp2.CALL:ehp2.
:dd.In some versions of BASIC, CALL is used to call a
machine language subroutine, but machine language
routines are highly system-specific.  In other
BASICs (conforming to the more complete ANSI
definition of BASIC), CALL is used to call a
named subroutine.  Although it's possible that
bwBASIC could develop as a numberless BASIC
with named subroutine calls, these features
are not implemented in this earliest released
version.
:dt.:hp2.CLOAD:ehp2.
:dd.See CALL above (machine language subroutines).
:dt.:hp2.CONT:ehp2.
:dd.See RESUME below (programmer ignorance?).
:dt.:hp2.DEF USR:ehp2.
:dd.See CALL above (machine language subroutines).
:dt.:hp2.EDIT:ehp2.
:dd.EDIT would be especially nice, but requires some
specific knowledge of how particular computers
handle interaction between the screen and the
keyboard.  This knowledge isn't available within
the bounds of ANSI C alone ("innerhalb die Grenzen
der reinen Vernunft," with apologies to Immanuel
Kant).
:dt.:hp2.FRE():ehp2.
:dd.The ability to report the amount of free memory
remaining is system-specific due to varying patterns
of memory allocation and access; consequently this
ability is not present in ANSI C and this function
is not available in bwBASIC.
:dt.:hp2.FILES:ehp2.
:dd.The FILES command requires a list of files conforming
to a specifier; ANSI C does not provide this. When
COMMAND_SHELL is defined as TRUE, users might want
to issue operating-system commands such as "DIR"
(DOS) or "ls -l" (Unix) to get a list of files.
:dt.:hp2.INKEY$:ehp2.
:dd.This function requires a keyboard scan to indicate
whether a key is pending. Although this facility
is easily available on microcomputers (it is part
of the minimal CP/M Operating System), it is not
easily available on some more complex systems.
Consequently, it's not part of the C standard and
bwBASIC has not implemented INKEY$.
:dt.:hp2.INPUT$():ehp2.
:dd.Similar to INKEY$ above, ANSI C by itself is not
able to read unechoed keyboard input, and can read
keyboard input only after a Carriage-Return has
been entered.
:dt.:hp2.INP:ehp2.
:dd.Calls to hardware ports, like machine-language
routines, are highly system-specific and cannot
be implemented in ANSI C alone.
:dt.:hp2.LLIST:ehp2.
:dd.See LPRINT below.
:dt.:hp2.LPOS:ehp2.
:dd.See LPRINT below.
:dt.:hp2.LPRINT:ehp2.
:dd.and LLIST, etc., require access to a printer device,
and this varies from one system to another. Users
might try OPENing the printer device on their own
operating system (e.g., "/dev/lp" on Unix systems,
or "PRN" under DOS) and see if printing can be done
from bwBASIC in this way.
:dt.:hp2.NULL:ehp2.
:dd.In this case, I am convinced that NULL is no longer
necessary, since very few printers now require NULLs
at the end of lines.
:dt.:hp2.OUT:ehp2.
:dd.See INP above (calls to hardware ports).
:dt.:hp2.PEEK():ehp2.
:dd.PEEK and POKE enabled earlier BASICs to address
particular memory locations. Although bwBASIC
could possibly implement this command (POKE) and
this function (PEEK()), the limitation would be
highly limited by the different systems for
memory access in different systems.
:dt.:hp2.POKE:ehp2.
:dd.see PEEK() above.
:dt.:hp2.RENUM:ehp2.
:dd.Since unnumbered lines can be entered and
executed under bwBASIC, it would not be
possible to implement a RENUM routine.
:dt.:hp2.RESUME:ehp2.
:dd.Is this possible under ANSI C? If so, I
simply have failed to figure it out yet.
Mea culpa (but not maxima).
:dt.:hp2.USR:ehp2.
:dd.See CALL and DEF USR above (machine language
subroutines).
:dt.:hp2.VARPTR:ehp2.
:dd.See PEEK and POKE above.
:dt.:hp2.WAIT:ehp2.
:dd.See INP and OUT above.
:edl.
.********************************************************************
.*
.*
.*
:h2.Some Notes on Compilation
:p.
bwBASIC is written in ANSI C and takes advantage of some of the
enhancements of ANSI C over the older K&amp.R standard.  The program
expects to find standard ANSI C include files (such as <stddef.h>).
Because there is nothing terminal- or hardware-specific about it,
I should hope that it would compile correctly under any ANSI C
compiler, but you may have to construct your own makefile.
:p.
Two makefiles are currently provided&colon. "makefile.qcl" will compile
the program utilizing the Microsoft QuickC (tm) line-oriented
compiler on DOS-based p.c.'s, and "makefile.gcc" will compile
the program utilizing the ANSI option of Gnu C++. I have also
compiled the program utilizing Borland's Turbo C++ (tm) on DOS-
based machines.
:p.
No alterations to flags are necessary for varied environments,
but the beginning of file <bwbasic.h> allows the user to set
some debugging flags and to control some program defaults.
The file <bwb_mes.h> has a number of language-specific message
sets that can be controlled by setting the appropriate language
flag.
.********************************************************************
.*
.*
.*
:h2.The Story of Bywater BASIC
:p.
This program was originally begun in 1982 by my grandmother, Mrs.
Verda Spell of Beaumont, TX.  She was writing the program using
an ANSI C compiler on an Osborne I CP/M computer and although my
grandfather (Lockwood Spell) had bought an IBM PC with 256k of
RAM my grandmother would not use it, paraphrasing George Herbert
to the effect that "He who cannot in 64k program, cannot in 512k."
She had used Microsoft BASIC and although she had nothing against
it she said repeatedly that she didn't understand why Digital
Research didn't "sue the socks off of Microsoft" for version 1.0
of MSDOS and so I reckon that she hoped to undercut Microsoft's
entire market and eventually build a new software empire on
the North End of Beaumont. Her programming efforts were cut
tragically short when she was thrown from a Beaumont to Port
Arthur commuter train in the summer of 1986. I found the source
code to bwBASIC on a single-density Osborne diskette in her knitting
bag and eventually managed to have it all copied over to a PC
diskette. I have revised it slightly prior to this release. You
should know, though, that I myself am an historian, not a programmer.
.********************************************************************
.*
.*
.*
:h2.Communications
:lines.
Ted A. Campbell
Bywater Software
P.O. Box 4023
Duke Station
Durham, NC  27706
USA

email&colon.  tcamp@acpub.duke.edu
:elines.
:font facename=default size=0x0.
.********************************************************************
.*
.*
.*
:h1.OS/2 Port Notes
:p.
:hp5.Changes&colon.:ehp5.
:ul compact.
:li.OS/2 2.x required.
:li.Makefile completely rewritten.
:li.IPF help file added in place of documentation.  (README, etc.)
:li.Small changes made to the language to make it nicer to live with
under the OS/2 environment.
:eul.
:p.
This was compiled with emx-0.8f but it does not require EMX.DLL.
:p.
Since the full, unmodified source and documentation was not included, I
am obligated to tell you that you can get it from the archive site
:hp2.wuarchive.wustl.edu:ehp2. in the directory
:hp8./usenet/comp.sources.games/&per.&per.&per.&per.&per.:ehp8.
:lines align=center.
Jeff M. Garzik - April 27, 1993
gtd543a@prism.gatech.edu (preferred until June 1997)
jgarzik@nyx.cs.du.edu
jeff.garzik@bbs.oit.unc.edu
:elines.
:euserdoc.

