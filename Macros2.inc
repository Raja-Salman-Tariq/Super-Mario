;============================================================
;======================================GRAPHICS MACROS
;============================================================


;---------------------------------------------------DRAW BLOCK MACRO
_draw_bloc macro x1, y1, x2, y2, c

MOV AH, 06h
MOV AL, 0
MOV CH, y1		; start row of colouring
MOV CL, x1		; start col of colouring
MOV DH, y2		; ending row
MOV DL, x2		; ending col
MOV BH, c		; clrs
INT 10h

endm


;---------------------------------------------------ENTER VIDEO MODE
_enter_vid_mode macro mode
mov ah, 0
mov al, mode							; sixe: 320 x 200 , width x vertical length====== 13h 
int 10h									; but be careful. e.g. during _make_block, a pixel becomes 8x8 times the standard size (that in 320x200)
endm

;---------------------------------------------------CLEAR SCREEN
_clear_screen macro		; Graphics Macro
;push ax
MOV AL,13
MOV AH,0
INT 10H
;pop ax
endm					;	Q: with these commands, stack wont be modified, right ?!? (excluding line 53/57)



;---------------------------------------------------TIMER
_timerr macro			;graphics macro, for about 1 second
MOV CX, 000fh
MOV DX, 4246h			; CX:DX Number of microseconds to elapse
MOV AH, 86H
INT 15H
endm


;--------------------------------------------------PRINT CHARACTER(S)
_print_graphic_char macro _charr, col, n
mov al, _charr			; Character to print
mov bh, 0				; page no
mov cx, n				; how many times to print	
mov bl, col				; colour !
mov ah, 0Ah
int 10h
endm


;--------------------------------------------------CHANGE BLOCK PARAMETERS

_change_block macro xaxis, yaxis, wid1, len1, col1

mov ax, xaxis
mov x_axis,ax

mov ax, yaxis
mov y_axis,ax

mov ax, wid1
mov wid,ax

mov ax, len1
mov len,ax

mov al, col1
mov col,al

endm



_make_mario macro lasr, lasc			;left arm start row,    left arm start col

push ax
pop ax

endm



;================================	|;=================================================================	|
;======---COLOUR SCHEME---=======	|;=======================---VIDEO MODES---=========================	|
;================================	|;=================================================================	|
;Dec	Hex	Binary	Color			|Mode (in AL)	Display Lines	Number of Colors	Adapters
;0	0	0000	Black				|0				40 x 25			B&W text			CGA, EGA, VGA
;1	1	0001	Blue				|1				40 x 25			Color text			CGA, EGA, VGA	
;2	2	0010	Green				|2				80 x 25			B&W text			CGA, EGA, VGA
;3	3	0011	Cyan				|3				80 x 25			Color text			CGA, EGA, VGA
;4	4	0100	Red					|4				320 x 200		4					CGA, EGA, VGA
;5	5	0101	Magenta				|5				320 x 200		B&W					CGA, EGA, VGA
;6	6	0110	Brown				|6				640 x 200		2 (on or off)		CGA, EGA, VGA
;7	7	0111	Light Gray			|7				80 x 25			Monochrome			MDA, EGA, VGA
;8	8	1000	Dark Gray			|8				160 x 200		16					PCjr
;9	9	1001	Light Blue			|9				320 x 200		16					PCjr
;10	A	1010	Light Green			|A				640 x 200		1					PCjr
;11	B	1011	Light Cyan			|B				Reserved for future use	
;12	C	1100	Light Red			|C				Reserved for future use	
;13	D	1101	Light Magenta		|D				320 x 200		16					EGA, VGA
;14	E	1110	Yellow				|E				640 x 200		16					EGA, VGA
;15	F	1111	White				|F				640 x 350		Monochrome			EGA, VGA
;									|10H			640 x 350		16					EGA, VGA
;									|11H			640 x 480		2					VGA
;									|12H			640 x 480		16					VGA
;									|13H			320 x 200		256					VGA


