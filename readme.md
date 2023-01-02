## WADUZITDO
An implementation of WADUZITDO for the KIM-1.

### Introduction
WADUZITDO is a high level interpreted language that fits in less than 256 bytes of memory on a 6502 based system. The language was conceived by Larry Kheriaty to demonstrate 'what a computer can do in a manner simple enough for almost anyone to understand'. [^1]

### WADUZITDO statements
WADUZITDO is derived from the PILOT language [^2]. For the sake of simplicity WADUZITDO supports only 5 statements: 

`T:text`  
   The _type_ statement displays a line of text on the terminal.

`A:`  
   The _accept_ statement allows the program to receive 1 input character from the terminal keyboard.
   
`M:character`  
   The _match_ statement is used to test the characted entered by the user on a previous _accept_. The character in the statement is compared to the last character entered by the user. The result of the match is recorded in the match flag: `Y` if the match is equal, `N` if it is not equal.

`Y<statement>`  
`N<statement>`  
   Statements can be conditionally executed after the match flag is set. This is done by placing either a `Y` (yes) or `N` (no) immediately before a statement.

`J:<number>`  
   Statements are executed sequentially. The _jump_ statement can be used to alter the normal sequence. The jump statement `J` is followed by a colon and a number from zero to nine. The `J:0` statement causes a branch back to the most recently executed _accept_ statement. Other values, one to nine, cause a branch to the n<sup>th</sup> program marker `*` forward from the jump.
   
`S:`  
   The _stop_ statement terminates execution of the program and returns control to the WADUZITDO editor.

### Example code

Following is a simple example that demonstrates some of WADUZITDO's capabilities:

```
    T:WHAT IS 2+3?
    A:
    M:5
    YT:FIVE IS RIGHT!
    YJ:1
    NT:NO, THE ANSWER IS 5.  
    NJ:0
    *T:GOODBYE!
    S:
```
   
### WADUZITDO editor
The WADUZITDO environment includes a simple editor. Because of the editor's significant limitations it is considerably easier to write programs in a more capable editor and then copy and paste them into WADUZITDO. Nevertheless, following are the editor commands for those who relish a 'retro' experience:

`$`  
   Start execution.

`\`  
   Move edit pointer to the start of the program.

`/`  
   Display the next line of the program.

`%`  
   Pad remainder of the current line with nulls.

`←` (or backspace)  
   Backspace to correct typing error.

`↲` (or enter)
   End program line or statement.

Any other character typed is stored in program memory. With each character typed the edit pointer is advanced by one position. This pointer may be reset using the `\` command. The maximum length of a program line is 64 characters. The maximum length of a user program is 256 characters.

Note that because of WADUZITDO's minimal error checking and error handling capabilities, it is easy to get into a situation where the entire envirement needs to be reloaded.

Refer to Kheriaty's BYTE article for further details on WADUZITDO statements and the editor.

### Building WADUZITDO
The source code uses vasm '8-bit oldstyle' syntax [^3] and can be built using the `vasm6502_oldstyle` assembler. This assembler, and the sources required to build it, can be downloaded from the vasm website [^4]. Since the code does not make use of vasm specific features it should be relatively simple to modify it for other 6502 compilers. 

A `Makefile` is provided for environments that support `make(1)`.

[^1]: Larry Kheriaty, ‘WADUZITDO: How to Write a Language in 256 Words or Less’, in The BYTE Book of Pascal, ed. by Blaise W. Liffick (Peterborough, NH: BYTE Publications, 1979), pp. 97–105.

[^2]: ‘PILOT’, Wikipedia, 2021 <https://en.wikipedia.org/w/index.php?title=PILOT&oldid=1058013823> [accessed 1 January 2023].

[^3]: Volker Barthelmann and Frank Wille, _‘Vasm Assembler System’_ (2022), <http://sun.hasenbraten.de/vasm/release/vasm.pdf> [accessed 25 November 2022].

[^4]: Volker Barthelmann and Frank Wille, _'vasm: A portable and retargetable assembler'_ (2022), <http://sun.hasenbraten.de/vasm/index.php?view=binrel> [accessed 6 December 2022].
