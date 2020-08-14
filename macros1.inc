
_main macro
main proc
mov ax, @data
mov ds, ax
endm

_main_end macro
mov ah, 4ch
int 21h
main endp
endm

_string_inp macro p
mov dx, offset p
mov ah, 3fh
int 21h
endm

_print_string macro p
mov dx, offset p
mov ah, 09h
int 21h
endm

_input macro  ; input saved in al
mov ah, 01h
int 21h
endm

_ouput macro o
mov dl, o
mov ah, 02h
int 21h
endm

_ouputX macro o
mov dx, o
mov ah, 02h
int 21h
endm

_ouput_num macro o
mov dl, byte ptr [o]
add dl, 48
mov ah, 02h
int 21h
endm

_input_num_al macro
_input
mov ah, 0
sub ax , 48
endm


;-----------------------------------macros to swap variables (convinient than to mov into vables by typing in registers as temporary stores)
_mov macro a, b
push al
mov al, b
mov a, al
pop al
endm

_movx macro a, b
push ax
mov ax, b
mov a, ax
pop ax
endm

_add macro a, b
push ax
mov ax, a
add ax, b
mov a,ax
pop ax
endm

_move macro a, b
push eax
mov eax, b
mov a, eax
pop eax
endm


;----------------------------------------------------FLAG

draw_flag macro
;----------------------------------------------------FLAG

_change_block 630,5,5,300,1111b			;pole
call drawblock

_change_block 540,5,85,60,14				;flag
call drawblock 
call draw_M

endm


;---------------------------------to reset values in the mario position variables
mario_reset macro
_movx mcol, mstart_col			; 10
_movx mrow, mstart_row			; 295
endm


;------------------------to reset initial values of floor
floor_reset macro
_movx fcol, fstart_col			;0
_movx frow, fstart_row			;301 
endm



mk_floor macro

top:cmp varloop,14
jae endloop
add varloop,1
call mk_floor_block
add fstart_col,48
jmp top
endloop:

endm



;------------------------to reset initial values of brick
brick_reset macro
_movx bcol, bstart_col		
_movx brow, bstart_row			
endm


;------------------------to reset initial values of coin
coin_reset macro
_movx ccol, cstart_col		
_movx crow, cstart_row			
endm

;------------------------to reset initial values of tunnel
tunnel_reset macro
_movx tcol, tstart_col			; 152
_movx trow, tstart_row			; 252
endm

;===============================================

;===================================================
;======================TUNNEL MACROS ===============
;===================================================


;---------------------------------to reset values of the tunnel position variables

;----------------------make tunnel
mk_tunnel macro length

;---------------------*row 1*

tunnel_reset
_change_block tcol,trow,57,3,0		
call drawblock

;---------------------*row 2*

tunnel_reset
add trow,3

_change_block tcol,trow,3,3,0		
call drawblock

add tcol,3
_change_block tcol,trow,51,3,10		
call drawblock

add tcol,51
_change_block tcol,trow,3,3,0		
call drawblock

;---------------------*row 3*

tunnel_reset
add trow,6

_change_block tcol,trow,3,3,0		
call drawblock

add tcol,3
_change_block tcol,trow,6,3,2	
call drawblock

add tcol,6
_change_block tcol,trow,12,3,10		
call drawblock

add tcol,12
_change_block tcol,trow,30,3,2		
call drawblock

add tcol,30
_change_block tcol,trow,3,3,10		
call drawblock

add tcol,3
_change_block tcol,trow,3,3,0		
call drawblock

;---------------------*row 4*

tunnel_reset
add trow,9

_change_block tcol,trow,3,18,0		
call drawblock

add tcol,3
_change_block tcol,trow,3,18,10	
call drawblock

add tcol,3
_change_block tcol,trow,3,18,2	
call drawblock

add tcol,3
_change_block tcol,trow,12,18,10		
call drawblock

add tcol,12
_change_block tcol,trow,30,18,2		
call drawblock

add tcol,30
_change_block tcol,trow,3,18,10		
call drawblock

add tcol,3
_change_block tcol,trow,3,18,0		
call drawblock

;---------------------*row 5*

tunnel_reset
add trow,27
_change_block tcol,trow,57,3,0		
call drawblock

;---------------------*row 6*

tunnel_reset
add trow,30

add tcol,6
_change_block tcol,trow,45,3,0		
call drawblock

;---------------------*row 7*

tunnel_reset
add trow,33

add tcol,6
_change_block tcol,trow,3,length,0		
call drawblock

add tcol,3
_change_block tcol,trow,3,length,10	
call drawblock

add tcol,3
_change_block tcol,trow,3,length,2	
call drawblock

add tcol,3
_change_block tcol,trow,9,length,10		
call drawblock

add tcol,9
_change_block tcol,trow,3,length,2		
call drawblock

add tcol,3
_change_block tcol,trow,3,length,10		
call drawblock

add tcol,3
_change_block tcol,trow,15,length,2		
call drawblock

add tcol,15
_change_block tcol,trow,3,length,10		
call drawblock


add tcol,3
_change_block tcol,trow,3,length,0		
call drawblock
;---------------------------
endm

;===================================================
;======================TUNNEL MACROS END============
;===================================================


;===============================================
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


