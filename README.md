# Z80MachineCodeTools
Z80 Machine Code Editor, Monitor and machine code programs.

The Editor and Monitor tools are written in Sinclair BASIC and are designed to be used to enter, run, edit and monitor Z80 assembler programs.

Since a full assembler takes too much memory it's good practice to assemble code by hand for optimal performance.
Alternatively, run an assembler in Linux, such as pasmo.
https://manpages.ubuntu.com/manpages/jammy/en/man1/pasmo.1.html

ie.
```
$ pasmo --tap 64.asm 64.tap
```
## Z80/Z80A Machine Language Editor

This is a machine code editor for the Z80 chip that supports the following:

1. INPUT a machine code program module in either a fully assembled format or a semi-assmbled format with all relative jump and absolute jumpes expressed in the form of line number.

2. LIST the source input program module.

3. DUMP the input program module into the specified memory address.

4. EXAMINE a range of memory locations

5. SAVE EITHER the "source moudle"  OR the dumped program in fully machine code format.

6. LOAD a saved "source program" from cassette.

7. RUN the dumped machine program module.

## PREREQUISITS
Before using the editor to input any machine language program, you must assemble your assembly language program. You do not need to calculate the relative or absolute jumps.

Your program module must not be greater than 800 bytes or more than 200 instructions.

You cannot load the final program below memory 31499 (in order not to wipe off the editor program).

## CONCEPT OF THE EDITOR
The concept behind this program is to enable you to enter machine code instructions in a numbered line format.

Each line of the source program has a line number and up to 4 bytes of machine code.

A benefit is therefore the ability to "edit" any line.

Another benefit is support for relative jumps or absolute jumps without having to calculate the numbers involved in any jump by referring to line numbers, very useful when editing a program without having to update jump destinations.

The machine code of the source program is transferred to memory by the "dump" command.

## INSTRUCTION SUMMARY

The first question you will be asked is "Loading address".

This is the address where the machine code program is to go, which cannot be below 31500.

**** Entering LINEs ****

1. To ENTER lines of source code:

(line-no)(blank)(maximum of 4 bytes in Hexadecimal)(ENTER)
```
eg. 1 210040 will insert the machine code instructions
        LD HL, 4000H into line number 1.
```
2. To EDIT a line:
(line-no)(blank)(retype new bytes)(ENTER)
```
eg. 1 210140 will change line number 1 to the instructions
        LD HL,4001H
```
3. TO DELETE a line
(line-no)(ENTER)
```
eg. 1 (ENTER) will delete line number 1.
```
4. To specify RELATIVE or ABSOLUTE jump
(line-no)(blank)(jump instruction)("lower case "L"")(line-no)(ENTER)
```
eg. 1 c312  represents the instruction JP to line 2
    2 1811  represents the instruction JR to line 1.
```

**** COMMANDs ****

1. dump(ENTER)
    * dump the source listing into the memory starting from the specified loading address.
    * this must be done before running the machine code program.

    abbreviation: du

2. exit(ENTER)
    * exit from the editor program and re-enter BASIC system.

    abbreviation: ex

3. list(ENTER)
    * list the first twenty-two instruction lines of the source listing.
    * press any key except "m" and "BREAK" to continue listing

    abbreviation: li

    list#(ENTER)
    * list twenty-two lines of the source listing starting from line number #, a number between 1 and 200 inclusively.

    abbreviation: NO abbreviation

4.  load(ENTER)
    * load a source listing module from the cassette replacing the existing module.

    abbreviation: lo

5. mem(ENTER)
    prompt: Starting address:
    * enter memory address you want to start displaying from.
    * can be from 0 to 32767 for 16k Spectrum or 0 to 65535 for 48K Spectrum.
    * press "m" to exist memory examine mode.

    abbreviation: me

6. new(ENTER)
    * clear the current module and re-run th editor.
    * this is useful when you want to start coding in another program module.

    abbreviation: ne

7. run(ENTER)
    * run the dumped program module from LOADING address you specified when starting the editor or when you LOAD a new source listing.

    abbreviation: ru

8. save(ENTER)
    * save either the source listing or dumped machine code onto cassette.

    prompt: Enter name:
        enter the name you want to use.
    Source or Machine code: (s or m)
        enter s four source listing saving
        enter m for machine code saving
    Start tape, then press any key.
        make sure that the cassette lead is properly winded.
        press any key when the cassette is ready.

    abbreviation: sa

## NOTES
1. if you don't want the result of BC register returned after running, change line 3090 to :
    3090 IF k$="ru" THEN LET L=USR R

2. To restart the editor :
    Either use RUN and resulting with all variables reinitialised
    or use GOTO 2020 which returns the prompt "Command or Line(###): ".

3. All numeric entry except machine instruction code has to be in decimal format.

4. To enable you to insert additional lines in teh current listing, it is good to space out the listing.
    i.e. instead of entering instruction lines as 1, 2, 3 enter as 1, 5, 10 etc.
    This will make the input of the module more flexible


## EXAMPLE
Enter the following codes.

    210040    LD      HL,4000H          ; fill screen
    110140    LD      DE,4001H
    01FF17    LD      BC,6143
    3EFF      LD      A,  0FFH
    77        LD      (HL),  A
    EDB0      LDIR
    3E7F LOOP:LD      A,  7FH           ;trap BREAK key
    DBFE      IN      A,(0FEH)
    E601      AND     1
    20F8      JR      NZ, LOOP
    C9        RET

    To enter the above code using the editor

    (RUN)
    Loading address: 31500(ENTER)
    Command or Line(###): 1 210040(ENTER)
    Command or Line(###): 5 110140(ENTER)
    Command or Line(###): 10 01ff17(ENTER)
    Command or Line(###): 15 3eff(ENTER)
    Command or Line(###): 20 77(ENTER)
    Command or Line(###): 25 edb0(ENTER)
    Command or Line(###): 30 3e7f(ENTER)
    Command or Line(###): 35 dbfe(ENTER)
    Command or Line(###): 40 e601(ENTER)
    Command or Line(###): 45 20l30(ENTE)
    (This is 20 then lower case "L", then 30. In other words JR NZ, line 30)
    Command or Line(###): 50 c9(ENTER)
    Command or Line(###): list(ENTER)
    Command or Line(###): dump(ENTER)
    Command or Line(###): mem(ENTER)
    Starting address: 31500(ENTER)
                m (this is the key to exit the memory display mode)
    Command or Line(###): run(ENTER)
                            (BREAK)

Note how there must be a space after the line numbers.

CREDITS
This is based on EZCODE  Copyright (c) 1982 by William Tang and A.M.Sullivan
