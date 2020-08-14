.model small
.stack 4096

include macros1.inc 
include macros2.inc 

.data
interm_msg BYTE ' Press any key to continue.'
str_row BYTE ?
str_column BYTE ?

sister db ' Peach ! '
brother db ' Mario ! '

intermed_screen dw 0
x_axis word ?
y_axis word ? 
len word ?
wid word ?
col byte ?


;mario2 db

mario_start dw 10
mario_width dw 80


pixelsize dw 0
rowsize dw 1

mstart_col dw  10
mstart_row dw  273
mcol dw ?
mrow dw ?

hstart_row dw 265
hstart_col dw 245
hrow dw ?
hcol dw ?


e1_drawn dw 1
e1_die dw 1
e1_r dw 273  	;start position row
e1_c dw 250  	;start position col

e2_drawn dw 1
e2_die dw 1
e2_r dw 273
e2_c dw 400
er dw ?
ec dw ?

fstart_col dw 0
fstart_row dw 305
fcol dw ?
frow dw ?

tstart_col dw 150; 
tstart_row dw 251; 
tcol dw ?
trow dw ?

bstart_col dw 162
bstart_row dw 120
bcol dw ?
brow dw ?

cstart_col dw 162
cstart_row dw 88
ccol dw ?
crow dw ?

kstart_col dw 350
kstart_row dw 67
kcol dw ?
krow dw ?
kvar dw 0

lstart_col dw 5
lstart_row dw 5
lcol dw ?
lrow dw ?
lives dw 3

mario1start_col dw 10
mario1start_row dw 173
mario1col dw ?
mario1row dw ?
mario1_arr db 3,3,3,4,4,4,4,4,4,3,3,3,3
		   db 3,3,4,4,4,4,4,4,4,4,4,4,3
		   db 3,3,6,6,6,15,15,15,0,15,3,3,3
		   db 3,6,15,6,15,15,15,15,0,15,15,15,3
		   db 3,6,15,6,6,15,15,15,15,0,15,15,15
		   db 3,6,6,15,15,15,15,15,0,0,0,0,3
		   db 3,3,3,15,15,15,15,15,15,15,15,3,3
		   db 3,3,4,4,1,4,4,4,4,3,3,3,3
		   db 3,4,4,4,1,4,4,1,4,4,4,3,3
		   db 4,4,4,4,1,1,1,1,4,4,4,4,3
		   db 15,15,4,1,14,1,1,14,1,4,15,15,3
		   db 15,15,15,1,1,1,1,1,1,15,15,15,3
		   db 15,15,1,1,1,1,1,1,1,1,15,15,3
		   db 3,3,1,1,1,3,3,1,1,1,3,3,3
		   db 3,0,0,0,3,3,3,3,0,0,0,3,3
		   db 0,0,0,0,3,3,3,3,0,0,0,0,3

		   
titlestart_col dw 115
titlestart_row dw 50
titlecol dw ?
titlerow dw ?
title_arr  db 3,3,3,3,3,3,3,0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0,3,3,0,0,3,3,3,0,0,0,0,3,3,3,3,3,3,3
		   db 3,3,3,3,3,3,0,1,1,1,1,0,0,0,0,0,3,3,0,4,4,4,4,0,0,2,2,0,0,0,14,14,14,14,0,3,3,3,3,3,3
		   db 3,3,3,3,3,0,1,1,1,0,1,1,0,14,14,0,0,0,0,0,4,4,4,4,4,0,2,2,2,0,14,14,14,14,14,0,3,3,3,3,3
		   db 3,3,3,3,3,0,1,1,1,0,0,0,0,14,14,0,14,14,14,0,4,4,0,0,4,0,2,0,0,0,14,14,0,0,14,0,3,3,3,3,3
		   db 3,3,3,3,3,0,0,0,1,1,1,0,0,14,0,0,14,14,14,0,4,4,0,0,4,0,2,2,2,0,14,14,0,0,14,0,3,3,3,3,3
		   db 3,3,3,3,3,0,1,1,0,1,1,1,0,14,0,0,14,14,0,0,4,4,4,4,0,2,2,2,2,0,14,14,14,14,0,0,3,3,3,3,3
		   db 3,3,3,3,3,0,1,1,1,1,1,1,0,14,14,14,14,14,0,0,4,4,0,0,2,2,2,0,0,0,14,14,0,14,14,0,3,3,3,3,3
		   db 3,3,3,3,3,3,0,1,1,1,1,0,0,0,14,14,14,0,0,0,4,4,0,0,2,2,2,2,2,0,14,14,0,0,14,0,3,3,3,3,3
		   db 3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3
		   db 3,3,3,0,4,4,0,0,4,4,4,0,0,0,2,2,2,0,0,0,14,14,14,14,14,0,0,0,1,1,0,0,0,2,2,2,0,0,0,3,3
		   db 3,3,3,0,4,4,4,0,4,4,4,0,0,2,2,2,2,2,0,0,14,14,14,14,14,14,14,0,1,1,1,0,0,2,2,2,2,2,0,0,3
		   db 3,3,0,4,4,4,4,0,4,4,4,0,0,2,2,2,2,2,0,0,14,14,0,0,14,14,14,0,1,1,1,0,2,2,2,2,2,2,2,0,0
		   db 3,3,0,4,4,4,4,4,4,4,4,0,2,2,2,0,2,2,0,0,14,14,0,0,14,14,14,0,1,1,1,0,2,2,0,0,0,2,2,2,0
		   db 3,0,4,4,4,0,4,4,0,4,4,0,2,2,2,0,2,2,2,0,14,14,14,14,14,14,0,0,1,1,1,0,2,2,0,0,0,2,2,2,0
		   db 3,0,4,4,4,0,4,0,0,4,4,4,0,2,2,2,2,2,2,0,14,14,14,14,14,0,0,0,1,1,0,0,2,2,0,0,0,2,2,2,0
		   db 0,4,4,4,4,0,0,0,0,4,4,4,0,2,2,2,2,2,2,0,14,14,0,14,14,14,0,0,1,1,0,0,2,2,2,2,2,2,2,0,0
		   db 0,4,4,4,0,3,0,0,0,4,4,4,0,2,0,0,0,2,2,2,0,14,0,0,14,14,14,0,1,1,0,0,2,2,2,2,2,2,2,0,3
		   db 0,0,0,4,0,3,0,3,0,4,4,4,0,2,0,0,0,2,2,2,0,14,0,0,14,0,0,0,1,1,0,0,0,0,2,2,2,0,0,0,3
		   db 3,0,0,0,0,3,3,3,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3
		   db 3,3,3,0,0,3,3,3,0,0,0,0,0,0,0,3,0,0,0,3,0,0,0,3,0,0,0,3,3,3,0,0,0,0,3,3,3,3,3,3,3
		   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

		   
		   
castlestart_col dw 525
castlestart_row dw 193
castlecol dw ?
castlerow dw ?
castle_arr db 3,3,0,0,0,3,0,0,0,0,3,0,0,0,3,3
		   db 3,3,0,7,0,3,0,7,7,0,3,0,7,0,3,3
		   db 3,3,0,7,0,0,0,7,7,0,0,0,7,0,3,3
		   db 3,3,0,7,7,7,7,7,7,7,7,7,7,0,3,3
		   db 3,3,0,7,7,0,0,7,7,0,0,7,7,0,3,3
		   db 0,0,0,0,7,0,0,7,7,0,0,7,0,0,0,0
		   db 0,7,7,0,7,0,0,0,0,0,0,7,0,7,7,0
		   db 0,7,7,0,0,0,0,7,7,0,0,0,0,7,7,0
		   db 0,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
		   db 0,7,7,7,7,7,0,0,0,0,7,7,7,7,7,0
		   db 0,7,7,7,7,0,0,0,0,0,0,7,7,7,7,0
		   db 0,7,7,7,7,0,0,0,0,0,0,7,7,7,7,0
		   db 0,7,7,7,7,0,0,0,0,0,0,7,7,7,7,0
		   db 0,7,7,7,7,0,0,0,0,0,0,7,7,7,7,0
		   db 0,7,7,7,7,0,0,0,0,0,0,7,7,7,7,0
		   db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

princessstart_col dw 270
princessstart_row dw 269
princesscol dw ?
princessrow dw ?
princess_arr db 3,3,3,3,12,3,12,3,12,3,3,3,3
			 db 3,3,3,3,1,12,4,12,1,3,3,3,3
			 db 3,3,3,3,14,14,14,14,14,14,3,3,3
			 db 3,3,3,14,14,14,14,14,14,14,14,3,3
			 db 3,3,14,14,15,14,14,14,14,14,14,3,3
			 db 3,3,14,14,15,1,15,14,14,14,14,14,14
			 db 3,3,3,15,15,9,15,14,15,14,14,14,3
			 db 3,3,3,15,15,15,15,14,1,14,14,3,3
			 db 3,3,3,3,15,15,15,15,14,14,14,14,3
			 db 3,3,3,13,1,12,4,4,4,14,14,14,14
			 db 3,3,13,13,13,13,13,13,13,13,14,14,3
			 db 3,3,15,13,13,13,13,13,15,15,14,3,3
			 db 3,3,3,4,4,4,4,4,4,3,3,3,3
			 db 3,3,4,4,13,13,4,4,4,4,3,3,3
			 db 3,3,4,13,13,13,13,13,4,4,3,3,3
			 db 3,3,13,13,13,13,13,13,13,13,3,3,3
			 db 3,13,13,13,13,13,13,13,13,13,13,3,3
			 db 4,4,4,4,4,4,4,4,4,4,4,4,3

			 
			 
bull1_x dw ?  
bull1_y dw ?  
bull1_is dw 0
b1c dw 0

bull2_x dw ?
bull2_y dw ?
bull2_is dw 0
b2c dw 0

bull3_x dw ?
bull3_y dw ?
bull3_is dw 0
b3c dw 0

bulletsent dw 0

bullet_count dw 0
bulletstart_col dw 500
bulletstart_row dw 50
bulletcol dw ?
bulletrow dw ?
bullet_arr db 0,15,0,0,0,0,0,0,0,0,0,0,0,0
		   db 0,15,0,0,0,0,0,0,0,0,0,0,0,0
		   db 3,0,15,0,0,0,0,0,0,0,0,0,0,3
		   db 3,0,0,0,0,0,0,0,0,0,0,0,0,3
		   db 0,15,0,0,0,0,0,15,15,0,0,0,0,0
		   db 0,15,0,0,0,0,15,15,15,15,0,0,0,0
		   db 0,15,0,0,0,0,15,15,15,15,0,0,0,0
		   db 0,15,0,0,0,0,0,0,15,15,15,0,0,0
		   db 0,15,0,0,0,0,0,15,15,15,15,0,0,0
		   db 0,0,15,0,0,0,0,15,15,15,15,0,0,0
		   db 3,0,0,0,0,0,0,0,15,15,0,0,0,3
		   db 3,0,0,15,15,15,0,0,0,0,0,0,0,3
		   db 3,3,0,0,15,15,15,0,0,0,0,0,3,3
		   db 3,3,0,0,0,0,15,0,0,0,0,0,3,3
	       db 3,3,3,0,0,15,15,0,0,0,0,3,3,3
		   db 3,3,3,3,3,0,0,0,0,3,3,3,3,3

fortstart_col dw 300
fortstart_row dw 65
fortcol dw ?
fortrow dw ?
fort_arr db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,3,8,3,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,7,7,7,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,7,7,7,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,3,8,7,8,7,8,3,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,7,7,7,7,7,7,7,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,8,3,8,3,8,7,14,7,14,7,14,7,8,3,8,3,8,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,7,14,7,14,7,14,7,8,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,7,7,7,3,7,7,7,7,7,7,7,3,7,7,7,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,3,7,7,7,3,7,7,7,7,7,7,7,3,7,7,7,3,3,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,8,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,3,3,3,3,3,3,3,3,3,3,3
		 db 3,3,3,3,3,3,3,3,3,3,3,3,7,14,7,14,7,7,7,7,7,7,7,7,7,14,7,14,7,3,3,3,3,3,3,3,3,3,3,3,3
		 db 8,3,8,3,8,3,8,3,3,3,3,3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3,3,3,3,3,8,3,8,3,8,3,8
		 db 8,8,8,8,8,8,8,3,3,3,3,3,7,7,7,7,8,7,8,7,8,7,8,7,8,7,7,7,7,3,3,3,3,3,8,8,8,8,8,8,8
		 db 3,7,7,7,7,7,3,3,3,3,3,3,7,7,7,7,8,8,8,8,8,8,8,8,8,7,7,7,7,3,3,3,3,3,3,7,7,7,7,7,3
		 db 3,7,14,7,14,7,3,3,3,3,8,3,8,7,8,7,7,7,7,7,7,7,7,7,7,7,8,7,8,3,8,3,3,3,3,7,14,7,14,7,3
		 db 3,7,7,7,7,7,3,3,3,3,8,8,8,8,8,7,7,7,14,7,14,7,14,7,7,7,8,8,8,8,8,3,3,3,3,7,7,7,7,7,3
		 db 3,7,14,7,14,7,3,3,3,3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3,3,3,3,3,7,14,7,14,7,3
		 db 3,7,7,7,7,7,8,3,8,3,8,7,14,7,8,7,8,7,8,7,8,7,8,7,8,7,8,7,14,7,8,3,8,3,8,7,7,7,7,7,3
		 db 3,7,7,7,7,7,8,8,8,8,8,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,7,8,8,8,8,8,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,14,7,14,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,14,7,14,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,4,6,4,6,4,6,4,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,4,6,4,6,4,6,4,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,4,6,4,6,4,6,4,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,4,6,4,6,4,6,4,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,4,6,4,6,4,6,4,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,3
		 db 3,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,3
		 
		 










varloop dw 0
varloop1 dw 0
drawing_loop dw 0
evaR1 dw 1
evar2 dw -1 

; h1_l: 140, r: 215, h: 55
; h2_l: 290. r: 355, h:95 
; h3_l: 440, r: 515, h: 58

level dw 0
;====================================================================
;=======================........code..........=======================
;====================================================================




.code
_main

startgame:

_enter_vid_mode 10h 
_draw_bloc 0,0,79,44,3
call mk_title

;=========================
top1:cmp varloop,14
jae endloop1
add varloop,1
call mk_floor_block
add fstart_col,48
jmp top1
endloop1:
mov varloop,0
;=========================
mov mstart_col,200
call mk_mario

mov ax,SEG interm_msg ; set ES segment
mov dl,30
mov dh,20
mov bl, 15
mov cx, sizeof interm_msg
call printStr

mov ah,0
int 16h


mov mstart_col, 10

level_start:
_enter_vid_mode 10h 

.if level>2
jmp _win_out
.endif 

_draw_bloc 0,0,79,44,3
.if (level <=1)
draw_flag 
.endif

.if (level >=2)
call mk_castle
.endif


;call mk_mario1
;call mk_bullet

.if lives>0
call mk_life
 .endif 
 
.if lives>1 
add lstart_col,38
call mk_life
.endif 

.if lives>2
add lstart_col,38
call mk_life
.endif

call mk_mario
mk_floor
call mk_kamek
call mk_brick
mov bstart_col,130
call mk_brick
mov bstart_col,194
call mk_brick
call mk_coin



mk_tunnel 21					; TUNNEL 1			

mov tstart_col,300
mov tstart_row,212
mk_tunnel 60					; TUNNEL 2

mov tstart_col,450
mov tstart_row,248
mk_tunnel 24					; TUNNEL 3


mov ax, 0305h
mov bh, 0
mov bl, 1
int 16h
play::

call mk_mario
call mov_enemy1
call mov_enemy2
call mov_kamek


;mov cx, level 
;inc cx
;key_rect1:
mov ah, 1
int 16h
jz play
mov ah, 10h
int 16h
;loop key_rect1


call chk_keys


;----------------------------------------------------arrow key definitions
arr_up::

topupkey:
.if (mstart_row<=161 && mstart_row>=120  && mstart_col>=105 && mstart_col<=226) ||  mstart_row<=10 
jmp arr_dn
.endif
call mov_enemy1
call mov_enemy2
call mov_kamek
cmp varloop1, 100
jae endupkey			;end condition	
add varloop1,10
call clearmario
call clearmariojump
call clearmariorun
sub mstart_row, 10

call mk_mario_jump

;mov cx, level 
;inc cx
;key_rect2:
mov ah, 01
int 16h
jz topupkey
mov ah, 0
int 16h
;loop key_rect2


.if ah==4bh
call clearmario
call clearmariojump
sub mstart_col, 10
call mk_mario_jump
.endif 

.if ah==4dh
call clearmario
call clearmariojump
add mstart_col, 10
call mk_mario_jump
cmp mstart_col,595
jge toprtkey
.endif 

jmp topupkey			;reloop
endupkey:
mov varloop1,0
jmp arr_dn



arr_lft::
mov ax, mstart_col;150 col , 251-row   21t  start_col,300  mov tstart_row,212  mk_tunnel 60||| row:-36 (21+15), col:-30, w: 100 ||  row:-37, col:-35, w: 90 *** 450 col, 248 row::
.if ax <15 || (mstart_row>215 && mstart_col<215 && mstart_col>=125)||(mstart_row>175 && mstart_col<375 && mstart_col>=270)||(mstart_row>215 && mstart_col<525 && mstart_col>=415);
call clearmariorun
jmp play
.endif
mov ax,cstart_col
add ax,40
.if (mstart_row <150 && mstart_col <= ax )
call clear_coin
.endif

toplftkey:
call mov_enemy1
call mov_enemy2
call mov_kamek
cmp varloop1, 10
jae endlftkey			;end condition	
add varloop1,10
call clearmariorun	
call clearmario
sub mstart_col, 10
call mk_mario_run
jmp toplftkey			;reloop
endlftkey:
call clearmariojump
call clearmariorun
mov varloop1,0				
jmp arr_dn


arr_rt::

toprtkey:

mov ax, mstart_col
mov bx,mstart_row
add ax,25
add bx,34
.if (mstart_col>=595) || (level == 2 && bx >= castlestart_row && ax >= castlestart_col)

inc level 
call clearmario
call clearmariorun
inc intermed_screen
call levelUp
;call resetAllVals
jmp level_start
jmp play

.endif
.if (mstart_row>215 && mstart_col<=205 && mstart_col>115)||(mstart_row>175 && mstart_col<=365 && mstart_col>260)||(mstart_row>215 && mstart_col<=515 && mstart_col>415);
call clearmariorun	
jmp play
.endif

call mov_enemy1
call mov_enemy2
call mov_kamek
cmp varloop1, 10
jae endrtkey				;end condition	
add varloop1,10				;increment

call clearmariorun			;body of loop
call clearmario
add mstart_col,10
call mk_mario_run

jmp toprtkey			;reloop
endrtkey:		
mov varloop1,0	
call clearmariojump	
call clearmariorun
jmp arr_dn

arr_dn::
.if mstart_row>270
jmp play
.endif


topdnkey:
.if (mstart_row<=97 && mstart_row>80  && mstart_col>=105 && mstart_col<=226)
jmp play
.endif
call mov_enemy1
call mov_enemy2
call mov_kamek
.if mstart_row>264 || (mstart_row>=209 && mstart_col<220 && mstart_col>110) || (mstart_row>=173 && mstart_col<365 && mstart_col>260)||(mstart_row>=205 && mstart_col<515 && mstart_col>410);
jmp enddnkey			;end condition	

.endif
add varloop1,2			;increment
call clearmario
call clearmariojump
add mstart_row, 10		;body of loop
call mk_mario_jump

;mov cx, level
;inc cx
;key_rect3:
mov ah, 01
int 16h
jz topdnkey
mov ah, 0
int 16h
;loop key_rect3


.if ah==4bh
call clearmario
call clearmariojump
.if (mstart_row<152 && mstart_col<=235);
jmp arr_dn
.endif

sub mstart_col, 10
call mk_mario
.endif 

.if ah==4dh
call clearmario
call clearmariojump
add mstart_col, 10
call mk_mario
cmp mstart_col,595
jge toprtkey
.endif 

jmp topdnkey			;reloop
enddnkey:	
call clearmariojump	
mov varloop1,0		
jmp play


;----------------------------------------------------arrow key definitions end

_out::

_draw_bloc 8,3,72,11,1		;background


_draw_bloc 10,5,10,7,6	; left vertical of Y
_draw_bloc 10,7,16,7,6	; bottom horizontal of Y
_draw_bloc 16,5,16,7,6	; right vertical of Y
_draw_bloc 13,7,13,9,6	; center vertical of Y

_draw_bloc 18,5,18,9,6	; left vertical of O
_draw_bloc 24,5,24,9,6	; right vertical of O
_draw_bloc 18,5,24,5,6	; top horizontal of O
_draw_bloc 18,9,24,9,6	; bottom horizontal of O

_draw_bloc 26,5,26,9,6	; left vertical of U
_draw_bloc 32,5,32,9,6	; right vertical of U
_draw_bloc 26,9,32,9,6	; bottom horizontal of U
;----------------
_draw_bloc 40,5,40,9,6	; left vertical of L
_draw_bloc 40,9,46,9,6	; bottom horizontal of U

_draw_bloc 48,5,48,9,6	; left vertical of O
_draw_bloc 54,5,54,9,6	; right vertical of O
_draw_bloc 48,5,54,5,6	; top horizontal of O
_draw_bloc 48,9,54,9,6	; bottom horizontal of O

_draw_bloc 56,5,62,5,6	; top horizontal of S
_draw_bloc 56,9,62,9,6	; bottom horizontal of S
_draw_bloc 56,5,58,7,6	; left vertical of O
_draw_bloc 60,7,62,9,6	; left vertical of O
_draw_bloc 56,7,62,7,6	; center horizontal of S

_draw_bloc 64,5,70,5,6	; top horizontal of E
_draw_bloc 64,9,70,9,6	; bott horizontal of E
_draw_bloc 64,5,64,9,6	; left vertical of O
_draw_bloc 64,7,70,7,6	; center horizontal of S

;///////////////////////////////////////
;///////////////////////////////////////


jmp _out_of_game

_win_out::

_draw_bloc 0,0,80,80,3		;background

_movx varloop,0
_movx  fstart_col, 0
_movx fstart_row, 305
mov cx, 14
floor_re_top:
push cx
call mk_floor_block
add fstart_col,48
pop cx
loop floor_re_top

_movx mstart_col, 25
_movx mstart_row, 271
call mk_mario
;.if (level ==3)
call mk_princess
;.endif
call mk_fort

mov cx,00fH                    
mov dx,0000h                    
mov ah,86h                 
int 15h

;--------------printing vv
mov ax,SEG sister ; set ES segment
mov es, ax
mov ah, 13h
mov al, 1
mov bh, 0
mov dl,	1		; col
mov dh,18		;row
mov bl, 15
mov cx, sizeof sister
mov bp, offset sister
int 10h


;--------------printing vv
mov ax,SEG brother ; set ES segment
mov es, ax
mov ah, 13h
mov al, 1
mov bh, 0
mov dl,	106		; col
mov dh,18		;row
mov bl, 15
mov cx, sizeof brother
mov bp, offset brother
int 10h


;--------------printing ^^
mov cx,0020H                    
mov dx,0000h                    
mov ah,86h                 
int 15h

_draw_bloc 1,18,10,18,3
_change_block 200,250,80,20,3
call drawblock



mov cx, 5
cutsceneloop:
push cx 
mov cx,0010H                    
mov dx,0                    
mov ah,86h                 
int 15h

call clearmario
add mstart_col, 35
call mk_mario

pop cx 
loop cutsceneloop 

call mk_heart
mov cx,001fH                    
mov dx,0                    
mov ah,86h                 
int 15h

mov ax,SEG interm_msg ; set ES segment
mov dl,25
mov dh,13
mov bl, 15
mov cx, sizeof interm_msg
call printStr

mov ah, 0
int 16h
;==============================================
;=============================================
;============================================

_draw_bloc 8,3,72,11,1		;background


_draw_bloc 10,5,10,7,10; left vertical of Y
_draw_bloc 10,7,16,7,10; bottom horizontal of Y
_draw_bloc 16,5,16,7,10; right vertical of Y
_draw_bloc 13,7,13,9,10; center vertical of Y

_draw_bloc 18,5,18,9,10; left vertical of O
_draw_bloc 24,5,24,9,10; right vertical of O
_draw_bloc 18,5,24,5,10; top horizontal of O
_draw_bloc 18,9,24,9,10; bottom horizontal of O

_draw_bloc 26,5,26,9,10; left vertical of U
_draw_bloc 32,5,32,9,10; right vertical of U
_draw_bloc 26,9,32,9,10; bottom horizontal of U
;----------------
_draw_bloc 40,5,40,9,10; left vertical of W
_draw_bloc 44,5,44,9,10; center vertical of W
_draw_bloc 40,9,48,9,10; bottom horizontal of W
_draw_bloc 48,5,48,9,10; right vertical of W

_draw_bloc 50,5,54,5,10; top of I
_draw_bloc 52,5,52,9,10; I
_draw_bloc 50,9,54,9,10; bottom of I

_draw_bloc 56,5,56,9,10; N left 
_draw_bloc 64,5,64,9,10; N rt 
_draw_bloc 56,5,59,5,10; top of I
_draw_bloc 60,5,60,9,10; N cent 
_draw_bloc 60,9,64,9,10	; bott of I

_draw_bloc 68,4,70,7,10	; exclama
_draw_bloc 68,9,70,10,10	; dot



_out_of_game::

_main_end


;-------------------------------------------------------DRAW BLOCK
drawblock proc 
mov dx,y_axis			;row number which is y_axis
l1:
    mov bx,dx			;y-axis backup
	  
   ;below loops drawing sqaure of given size
   mov cx,len
   l2:
      push cx
      mov cx,wid
      l3:
       add cx,x_axis
	   mov bh,0
       mov ah,0Ch
       mov al,col	;setting given colour
       int 10h
       sub cx,x_axis
      loop l3
	  pop cx
	  inc dx
   loop l2
   
   mov dx,bx
ret
drawblock endp
;-------------------------------------------------------DRAW BLOCK END

;----------------------------------------------------DRAW EVERYTHING
draw_all proc
_enter_vid_mode 10h

draw_flag
call mk_mario
ret
draw_all endp
;----------------------------------------------------DRAW EVERYTHING END


draw_M proc	

;///Left line of M
MOV AH, 06h
MOV AL, 0
MOV CH, 1		; start row of colouring
MOV CL, 70		; start col of colouring
MOV DH, 3		; ending row
MOV DL, 70		; ending col
MOV BH, 4		;colour
INT 10h


;///Top line of M
MOV CH, 1		; start row of colouring
MOV CL, 71		; start col of colouring
MOV DH, 1		; ending row
MOV DL, 75		; ending col
MOV BH, 4
INT 10h


MOV AH, 06h		;///right line of M
MOV AL, 0
MOV CH, 1		; start row of colouring
MOV CL, 76		; start col of colouring
MOV DH, 3		; ending row
MOV DL, 76		; ending col
MOV BH, 4
INT 10h


;///center line of M
MOV AH, 06h
MOV AL, 0
MOV CH, 1		; start row of colouring
MOV CL, 73		; start col of colouring
MOV DH, 3		; ending row
MOV DL, 73		; ending col
MOV BH, 4
INT 10h


;/////////attempt to draw stars (failed)
;_draw_bloc 0,0,0,0,15
;_draw_bloc 5,5,5,5,15
;_draw_bloc 10,0,10,0,15
;_draw_bloc 15,5,15,5,15
;_draw_bloc 20,0,20,0,15
;_draw_bloc 25,5,25,5,15
;_draw_bloc 30,0,30,0,15
;_draw_bloc 35,5,35,5,15

ret
draw_M endp

;===============================================================================
;===============================================================================
;============================  GRAPHICS PROCEDURES  ============================
;===============================================================================
;===============================================================================


;===================================================
;========================= MARIO MACROS ============
;===================================================
	
mk_mario proc
;----------------------------------------------------MARIO
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,12,2,4		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,20,2,4
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,8
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,6,2,15	
call drawblock

;eye
add mcol,6
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,8,2,15
call drawblock

;eye
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,8,2,15
call drawblock

;eye/stash
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,10,2,15
call drawblock

;eye/stash
add mcol,10
_change_block mcol,mrow,8,2,0
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,16,2,15
call drawblock

;------------*row 8*
mario_reset
add mrow,14

;red cloth
add mcol, 4
_change_block mcol,mrow,4,2,4
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,4
call drawblock

;blue cloth
add mcol , 4
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,4
call drawblock

;------------*row 9*
mario_reset
add mrow,16

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,4
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,4
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;red cloth
_change_block mcol,mrow,8,2,4
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,8,2,1
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,8,2,4
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

;skin
_change_block mcol,mrow,4,2,15
call drawblock

;red cloth
add mcol , 4
_change_block mcol,mrow,2,2,4
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,2,2,1
call drawblock

;yellow
add mcol, 2
_change_block mcol,mrow,2,2,14
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,4,2,1
call drawblock

;yellow
add mcol, 4
_change_block mcol,mrow,2,2,14
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,2,2,1
call drawblock

;red
add mcol, 2
_change_block mcol,mrow,2,2,4
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,4,2,15
call drawblock
 
;------------*row 12*
mario_reset
add mrow, 22

;skin
_change_block mcol,mrow,6,2,15
call drawblock

;blue
add mcol, 6
_change_block mcol,mrow,12,2,1
call drawblock

;skin
add mcol, 12
_change_block mcol,mrow,6,2,15
call drawblock

;------------*row 13*
mario_reset
add mrow, 24

;skin
_change_block mcol,mrow,4,2,15
call drawblock

;blue
add mcol,4
_change_block mcol,mrow,6,2,1
call drawblock

;blue
add mcol,10
_change_block mcol,mrow,6,2,1
call drawblock


;skin
add mcol , 6
_change_block mcol,mrow,4,2,15
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

;blue
add mcol, 4
_change_block mcol,mrow,6,2,1
call drawblock

;blue
add mcol, 10
_change_block mcol,mrow,6,2,1
call drawblock

;------------*row 15*
mario_reset
add mrow, 28

;brown
add mcol, 2
_change_block mcol,mrow,6,2,0
call drawblock

;brown
add mcol, 14
_change_block mcol,mrow,6,2,0
call drawblock

;------------*row 16*
mario_reset
add mrow, 30

;black
_change_block mcol,mrow,8,2,0
call drawblock

;black
add mcol ,16
_change_block mcol,mrow,8,2,0
call drawblock

ret
mk_mario endp

;===================================================
;===================== MARIO MACROS END=============
;===================================================


;===================================================
;=================== MARIO JUMP MACROS =============
;===================================================

mk_mario_jump proc 
;----------------------------------------------------MARIO
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,10,2,4		
call drawblock

add mcol,14
_change_block mcol,mrow,6,2,15		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,18,2,4
call drawblock

add mcol,18
_change_block mcol,mrow,4,2,15		
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,8
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,4,2,15	
call drawblock

;eye
add mcol,4
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

add mcol,4
_change_block mcol,mrow,6,2,4		
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;eye
add mcol, 6
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

add mcol,6
_change_block mcol,mrow,4,2,4		
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,6,2,15
call drawblock

;eye/stash
add mcol, 6
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

add mcol,6
_change_block mcol,mrow,2,2,4		
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,8,2,15
call drawblock

;eye/stash
add mcol,8
_change_block mcol,mrow,8,2,0
call drawblock

add mcol,8
_change_block mcol,mrow,2,2,4		
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,14,2,15
call drawblock

add mcol,14
_change_block mcol,mrow,4,2,4		
call drawblock

;------------*row 8*
mario_reset
add mrow,14

sub mcol,4
_change_block mcol,mrow,4,2,15		
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,8,2,4
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol , 6
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,4
call drawblock

add mcol,8
_change_block mcol,mrow,2,2,0		
call drawblock

;------------*row 9*
mario_reset
add mrow,16

sub mcol,4
_change_block mcol,mrow,4,2,15		
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,10,2,4
call drawblock

;blue cloth
add mcol, 10
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,2,2,1
call drawblock

add mcol,6
_change_block mcol,mrow,4,2,0		
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;red cloth
add mcol,4
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,8,2,1
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,2,2,14
call drawblock

add mcol,2
_change_block mcol,mrow,4,2,1		
call drawblock

add mcol,4
_change_block mcol,mrow,4,2,0		
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

add mcol,6
_change_block mcol,mrow,6,2,1
call drawblock

add mcol , 6
_change_block mcol,mrow,2,2,14
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,10,2,1
call drawblock

;yellow
add mcol, 10
_change_block mcol,mrow,4,2,0
call drawblock

 
;------------*row 12*
mario_reset
add mrow, 22

add mcol,2
_change_block mcol,mrow,4,2,0
call drawblock

;blue
add mcol, 4
_change_block mcol,mrow,18,2,1
call drawblock

add mcol, 18
_change_block mcol,mrow,4,2,0
call drawblock

;------------*row 13*
mario_reset
add mrow, 24

_change_block mcol,mrow,6,2,0
call drawblock

;blue
add mcol,6
_change_block mcol,mrow,12,2,1
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

_change_block mcol,mrow,4,2,0
call drawblock

ret
mk_mario_jump endp

;===================================================
;=============== MARIO JUMP MACROS END =============
;===================================================


;===================================================
;================ MARIO RUN MACROS =================
;===================================================

mk_mario_run proc 
;----------------------------------------------------MARIO
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,12,2,4		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,20,2,4
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,8
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,6,2,15	
call drawblock

;eye
add mcol,6
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,8,2,15
call drawblock

;eye
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,8,2,15
call drawblock

;eye/stash
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,10,2,15
call drawblock

;eye/stash
add mcol,10
_change_block mcol,mrow,8,2,0
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,16,2,15
call drawblock

;------------*row 8*
mario_reset
add mrow,14

;red cloth
_change_block mcol,mrow,8,2,4
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,4,2,1
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,4,2,4
call drawblock


;------------*row 9*
mario_reset
add mrow,16

;skin
sub mcol,4
_change_block mcol,mrow,6,2,15
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,6,2,1
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,6,2,4
call drawblock

;skin
add mcol, 6
_change_block mcol,mrow,6,2,15
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;skin
sub mcol,4
_change_block mcol,mrow,8,2,15
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,4,2,4
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,1
call drawblock

;yellow cloth
add mcol, 2
_change_block mcol,mrow,2,2,14
call drawblock

;blue cloth
add mcol, 2
_change_block mcol,mrow,6,2,1
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,4,2,4
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,4,2,15
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

;skin
sub mcol,4
_change_block mcol,mrow,6,2,15
call drawblock

;blue cloth
add mcol , 8
_change_block mcol,mrow,14,2,1
call drawblock

;shoe
add mcol, 16
_change_block mcol,mrow,4,2,0
call drawblock

 
;------------*row 12*
mario_reset
add mrow, 22

;red
add mcol,2
_change_block mcol,mrow,18,2,1
call drawblock

;shoe
add mcol, 18
_change_block mcol,mrow,4,2,0
call drawblock



;------------*row 13*
mario_reset
add mrow, 24

;blue
_change_block mcol,mrow,20,2,1
call drawblock

;shoe
add mcol,20
_change_block mcol,mrow,4,2,0
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

;shoe
sub mcol, 2
_change_block mcol,mrow,4,2,0
call drawblock

;blue
add mcol, 4
_change_block mcol,mrow,6,2,1
call drawblock

;blue
add mcol, 10
_change_block mcol,mrow,8,2,1
call drawblock

;shoe
add mcol, 8
_change_block mcol,mrow,4,2,0
call drawblock


;------------*row 15*
mario_reset
add mrow, 28

;shoe
sub mcol, 2
_change_block mcol,mrow,6,2,0
call drawblock

;------------*row 16*
mario_reset
add mrow, 30

;shoe
_change_block mcol,mrow,6,2,0
call drawblock

ret
mk_mario_run endp

;===================================================
;=============== MARIO RUN MACROS END ==============
;===================================================


;===================================================
;================ MARIO SIDE MACROS ================
;===================================================

mk_mario_side proc 
;----------------------------------------------------MARIO
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,12,2,4		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,20,2,4
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,8
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,6,2,15	
call drawblock

;eye
add mcol,6
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,8,2,15
call drawblock

;eye
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,8
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,15
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,8,2,15
call drawblock

;eye/stash
add mcol, 8
_change_block mcol,mrow,2,2,0
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,15
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,8
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,10,2,15
call drawblock

;eye/stash
add mcol,10
_change_block mcol,mrow,8,2,0
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,16,2,15
call drawblock

;------------*row 8*
mario_reset
add mrow,14

;red cloth
add mcol,4
_change_block mcol,mrow,4,2,4
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,1
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,4
call drawblock


;------------*row 9*
mario_reset
add mrow,16

;red
add mcol,2
_change_block mcol,mrow,8,2,4
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,4,2,1
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,4,2,4
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;red
add mcol,2
_change_block mcol,mrow,6,2,4
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,4,2,1
call drawblock

;yelloq
add mcol, 4
_change_block mcol,mrow,2,2,14
call drawblock

;blue cloth
add mcol, 2
_change_block mcol,mrow,4,2,1
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,2,2,15
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

;red
add mcol,2
_change_block mcol,mrow,8,2,4
call drawblock

;blue cloth
add mcol , 8
_change_block mcol,mrow,10,2,1
call drawblock

;------------*row 12*
mario_reset
add mrow, 22

;blue
add mcol,2
_change_block mcol,mrow,2,2,1
call drawblock

;red
add mcol, 2
_change_block mcol,mrow,4,2,4
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,6,2,15
call drawblock

;blue
add mcol, 6
_change_block mcol,mrow,6,2,1
call drawblock

;------------*row 13*
mario_reset
add mrow, 24

;blue
add mcol,4
_change_block mcol,mrow,2,2,1
call drawblock

;red
add mcol, 2
_change_block mcol,mrow,2,2,4
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,4,2,15
call drawblock

;blue
add mcol, 4
_change_block mcol,mrow,6,2,1
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

;blue
add mcol, 6
_change_block mcol,mrow,6,2,1
call drawblock

;shoe
add mcol, 6
_change_block mcol,mrow,6,2,0
call drawblock

;------------*row 15*
mario_reset
add mrow, 28

;shoe
add mcol, 6
_change_block mcol,mrow,12,2,0
call drawblock

;------------*row 16*
mario_reset
add mrow, 30

;shoe
add mcol,6
_change_block mcol,mrow,8,2,0
call drawblock

ret
mk_mario_side endp

;===================================================
;=============== MARIO SIDE MACROS END =============
;===================================================


;===================================================
;===================== ENEMY MACROS ================
;===================================================

mk_enemy proc uses ax bx

;-----------row 1
_movx er, ax
_movx ec, bx
_change_block ec,er,8,2,4
call drawblock

;----------row 2
add er, 2
sub ec, 2
_change_block ec,er,12,2,4
call drawblock	

;----------row 3
add er, 2
sub ec, 2
_change_block ec,er,16,2,4
call drawblock

;----------row 4
add er, 2
sub ec, 2
_change_block ec,er,20,2,4
call drawblock
;----------row 5
add er, 2
sub ec, 2
push ec
_change_block ec,er,2,2,4
call drawblock
add ec, 2
_change_block ec,er,4,2,0
call drawblock
add ec, 4
_change_block ec,er,12,2,4
call drawblock
add ec, 12
_change_block ec,er,4,2,0
call drawblock
add ec, 4
_change_block ec,er,2,2,4
call drawblock
;----------row 6
add er, 2
pop ec
sub ec, 2
push ec
_change_block ec,er,6,2,4
call drawblock

add ec, 6
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,2,2,0
call drawblock
add ec, 2
_change_block ec,er,8,2,4
call drawblock
add ec, 8
_change_block ec,er,2,2,0
call drawblock
add ec, 2
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,6,2,4
call drawblock

;----------row 7
add er, 2
pop ec
push ec
_change_block ec,er,6,2,4
call drawblock

add ec, 6
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,12,2,0
call drawblock
add ec, 12
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,6,2,4
call drawblock

;----------row 8
pop ec
add er, 2
sub ec, 2
push ec
_change_block ec,er,8,2,4
call drawblock
add ec, 8
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,2,2,0
call drawblock
add ec, 2
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,4,2,4
call drawblock
add ec, 4
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,2,2,0
call drawblock
add ec, 2
_change_block ec,er,2,2,15
call drawblock
add ec, 2
_change_block ec,er,8,2,4
call drawblock

;----------row 9
pop ec
add er, 2
push ec
_change_block ec,er,8,2,4
call drawblock
add ec, 8
_change_block ec,er,6,2,15
call drawblock
add ec, 6
_change_block ec,er,4,2,4
call drawblock
add ec, 4
_change_block ec,er,6,2,15
call drawblock
add ec, 6
_change_block ec,er,8,2,4
call drawblock
;----------row 10
add er, 2
pop ec
push ec
_change_block ec,er,32,2,4
call drawblock
;----------row 11
add er, 2
pop ec
add ec, 2
push ec

_change_block ec,er,8,2,4
call drawblock
add ec, 8
_change_block ec,er,12,2,15
call drawblock
add ec, 12
_change_block ec,er,8,2,4
call drawblock
;----------row 12 & 13
add er, 2
pop ec
add ec, 6
push ec
_change_block ec,er,16,2,15
call drawblock
add er,2
_change_block ec,er,16,2,15
call drawblock
;----------row 14
add er, 2
pop ec
sub ec, 4
push ec

_change_block ec,er,6,2,0
call drawblock
add ec, 6
_change_block ec,er,12,2,15
call drawblock
add ec, 12
_change_block ec,er,6,2,0
call drawblock

;----------row 15
add er, 2
pop ec
sub ec, 2
push ec

_change_block ec,er,10,2,0
call drawblock
add ec, 10
_change_block ec,er,8,2,15
call drawblock
add ec, 8
_change_block ec,er,10,2,0
call drawblock

;----------row 16
add er, 2
pop ec

_change_block ec,er,12,2,0
call drawblock
add ec, 16

_change_block ec,er,12,2,0
call drawblock

ret
mk_enemy endp

;===================================================
;===================== ENEMY MACRO END =============
;===================================================


;===================================================
;===================== FLOOR MACROS ================
;===================================================
mk_floor_block proc
;------------*row 1*

floor_reset
_change_block fcol,frow,3,3,6
call drawblock

add fcol, 3
_change_block fcol,frow,24,3,14
call drawblock

add fcol, 24
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,6
call drawblock

add fcol, 3
_change_block fcol,frow,12,3,14
call drawblock

add fcol, 12
_change_block fcol,frow,3,3,6
call drawblock

;------------*row 2,3,4*

floor_reset
add frow,3

_change_block fcol,frow,3,9,14
call drawblock

add fcol, 3
_change_block fcol,frow,24,9,6
call drawblock

add fcol, 24
_change_block fcol,frow,3,9,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,9,14
call drawblock

add fcol, 3
_change_block fcol,frow,12,9,6
call drawblock

add fcol, 12
_change_block fcol,frow,3,9,0
call drawblock

;------------*row 5*

floor_reset
add frow,9

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,24,3,6
call drawblock

add fcol, 24
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,9,3,6
call drawblock

add fcol, 9
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 6*

floor_reset
add frow,12

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,24,3,6
call drawblock

add fcol, 24
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,6
call drawblock

add fcol, 3
_change_block fcol,frow,12,3,0
call drawblock

add fcol, 12
_change_block fcol,frow,3,3,6
call drawblock

;------------*row 7*

floor_reset
add frow,15

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,24,3,6
call drawblock

add fcol, 24
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,12,3,14
call drawblock

add fcol, 12
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 8,9,10*

floor_reset
add frow,18

_change_block fcol,frow,3,9,14
call drawblock

add fcol, 3
_change_block fcol,frow,24,9,6
call drawblock

add fcol, 24
_change_block fcol,frow,3,9,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,9,14
call drawblock

add fcol, 3
_change_block fcol,frow,12,9,6
call drawblock

add fcol, 12
_change_block fcol,frow,3,9,0
call drawblock

;------------*row 11*

floor_reset
add frow,27

_change_block fcol,frow,6,3,0
call drawblock

add fcol, 6
_change_block fcol,frow,18,3,6
call drawblock

add fcol, 18
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,15,3,6
call drawblock

add fcol, 15
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 12*

floor_reset
add frow, 30

_change_block fcol,frow,6,3,14
call drawblock

add fcol, 6
_change_block fcol,frow,6,3,0
call drawblock

add fcol, 6
_change_block fcol,frow,12,3,6
call drawblock

add fcol, 12
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,15,3,6
call drawblock

add fcol, 15
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 13*

floor_reset
add frow, 33

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,6
call drawblock

add fcol, 3
_change_block fcol,frow,6,3,14
call drawblock

add fcol, 6
_change_block fcol,frow,12,3,0
call drawblock

add fcol, 12
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,18,3,6
call drawblock

add fcol, 18
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 14*

floor_reset
add frow, 36

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,9,3,6
call drawblock

add fcol, 9
_change_block fcol,frow,9,3,14
call drawblock

add fcol, 9
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,18,3,6
call drawblock

add fcol, 18
_change_block fcol,frow,3,3,0
call drawblock

;------------*row 15*

floor_reset
add frow, 39

_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,18,3,6
call drawblock

add fcol, 18
_change_block fcol,frow,3,3,0
call drawblock

add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,15,3,6
call drawblock

add fcol, 15
_change_block fcol,frow,6,3,0
call drawblock

;------------*row 16*

floor_reset
add frow, 42

_change_block fcol,frow,3,3,6
call drawblock

add fcol, 3
_change_block fcol,frow,18,3,0
call drawblock

add fcol, 18
_change_block fcol,frow,3,3,6
call drawblock


add fcol, 3
_change_block fcol,frow,3,3,14
call drawblock

add fcol, 3
_change_block fcol,frow,18,3,0
call drawblock

add fcol, 18
_change_block fcol,frow,6,3,6
call drawblock

;------------*end of rows*

ret
mk_floor_block endp

;===================================================
;===================== FLOOR MACROS END=============
;===================================================


;===================================================
;===================== BRICK MACROS ================
;===================================================
mk_brick proc

.if (level<2)
;------------*row 1*

brick_reset
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

brick_reset
add brow,6

_change_block bcol,brow,32,2,0
call drawblock

;------------*row 2*

brick_reset
add brow,8
_change_block bcol,brow,6,6,6
call drawblock

add bcol,6
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,8,6,6
call drawblock

brick_reset
add brow,14

_change_block bcol,brow,32,2,0
call drawblock

;------------*row 3*

brick_reset
add brow,16
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

brick_reset
add brow,22

_change_block bcol,brow,32,2,0
call drawblock

;------------*row 4*

brick_reset
add brow,24
_change_block bcol,brow,6,6,6
call drawblock

add bcol,6
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,14,6,6
call drawblock

add bcol,14
_change_block bcol,brow,2,6,0
call drawblock

add bcol,2
_change_block bcol,brow,8,6,6
call drawblock

brick_reset
add brow,30

_change_block bcol,brow,32,2,0
call drawblock
.endif 
ret
mk_brick endp

;===================================================
;===================== BRICK PROCEDURES END=============
;===================================================


;===================================================
;===================== Heart PROCEDURES =================
;===================================================

heart_reset proc 
_movx hcol, hstart_col
_movx hrow, hstart_row
ret 
heart_reset endp 

mk_heart proc 

;;------------*row 1*
call heart_reset
_change_block hcol, hrow,4,2,0
call drawblock
add hcol, 10
_change_block hcol,hrow,4,2,0
call drawblock
;;------------*row 2*
call heart_reset
add  hrow,2
sub  hcol,2 
_change_block hcol, hrow,2,2,0
call drawblock

add hcol, 2
_change_block hcol,hrow,4,2,4
call drawblock

add hcol, 4
_change_block hcol, hrow,2,2,0
call drawblock

add hcol, 4
_change_block hcol, hrow,2,2,0
call drawblock

add hcol, 2
_change_block hcol,hrow,4,2,4
call drawblock

add hcol, 4
_change_block hcol, hrow,2,2,0
call drawblock

;------------*row 3,4,5*

call heart_reset

sub hcol, 4
add hrow, 4

_change_block hcol, hrow,2,6,0
call drawblock

add hcol, 2
_change_block hcol, hrow,8,6,4
call drawblock

add hcol, 8
_change_block hcol, hrow,2,2,0
call drawblock

add hcol, 2
_change_block hcol, hrow,2,2,4
call drawblock

add hcol, 2
_change_block hcol, hrow,4,2,15
call drawblock

add hcol, 4
_change_block hcol, hrow,2,2,4
call drawblock

add hcol, 2
_change_block hcol, hrow,2,2,0
call drawblock

sub hcol, 10
add hrow,2
_change_block hcol, hrow,6,4,4
call drawblock

add hcol, 6
_change_block hcol, hrow,2,4,15
call drawblock

add hcol, 2
_change_block hcol, hrow,2,4,4
call drawblock

add hcol, 2
_change_block hcol, hrow,2,4,0
call drawblock



;------------*row 6*
call heart_reset
add hrow, 10
sub hcol, 2
_change_block hcol, hrow, 2,2,0
call drawblock

add hcol, 2
_change_block hcol, hrow, 14,2,4
call drawblock

add hcol, 14
_change_block hcol, hrow, 2,2,0
call drawblock
;------------*row 7*
call heart_reset
add hrow, 12
;sub hcol, 2
_change_block hcol, hrow, 2,2,0
call drawblock

add hcol, 2
_change_block hcol, hrow, 10,2,4
call drawblock

add hcol, 10
_change_block hcol, hrow, 2,2,0
call drawblock
;------------*row 8*
call heart_reset
add hrow, 14
add hcol, 2
_change_block hcol, hrow, 2,2,0
call drawblock

add hcol, 2
_change_block hcol, hrow, 6,2,4
call drawblock

add hcol, 6
_change_block hcol, hrow, 2,2,0
call drawblock
;------------*row 9*
call heart_reset
add hrow, 16
add hcol, 4
_change_block hcol, hrow, 2,2,0
call drawblock

add hcol, 2
_change_block hcol, hrow, 2,2,4
call drawblock

add hcol, 2
_change_block hcol, hrow, 2,2,0
call drawblock
;------------*row 10*
call heart_reset
add hrow, 18
add hcol, 6
_change_block hcol, hrow, 2,2,0
call drawblock




ret 
mk_heart endp 


;===================================================
;===================== Heart PROCEDURES END=============
;===================================================

;===================================================
;===================== COIN PROCEDURES =================
;===================================================

mk_coin proc

.if level<2
;------------*row 1*

coin_reset
add ccol,8
_change_block ccol,crow,12,2,0
call drawblock

;------------*row 2*
coin_reset
add crow,2

add ccol,4
_change_block ccol,crow,6,2,0
call drawblock

add ccol,6
_change_block ccol,crow,6,2,15
call drawblock

add ccol,6
_change_block ccol,crow,8,2,0
call drawblock

;------------*row 3*

coin_reset
add crow,4

add ccol,2
_change_block ccol,crow,4,2,0
call drawblock

add ccol,4
_change_block ccol,crow,4,2,15
call drawblock

add ccol,4
_change_block ccol,crow,10,2,14
call drawblock

add ccol,10
_change_block ccol,crow,4,2,0
call drawblock

;------------*row 4*

coin_reset
add crow,6

add ccol,2
_change_block ccol,crow,2,2,0
call drawblock

add ccol,2
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,6,2,15
call drawblock

add ccol,6
_change_block ccol,crow,2,2,0
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,4,2,0
call drawblock


;------------*row 5*

coin_reset
add crow,8

_change_block ccol,crow,4,2,0
call drawblock

add ccol,4
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,2,2,0
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,4,2,0
call drawblock

;------------*row 6-11*

coin_reset
add crow,10

_change_block ccol,crow,2,12,0
call drawblock

add ccol,2
_change_block ccol,crow,2,12,15
call drawblock

add ccol,2
_change_block ccol,crow,6,12,14
call drawblock

add ccol,6
_change_block ccol,crow,2,12,15
call drawblock

add ccol,2
_change_block ccol,crow,4,12,14
call drawblock

add ccol,4
_change_block ccol,crow,2,12,0
call drawblock

add ccol,2
_change_block ccol,crow,6,12,14
call drawblock

add ccol,6
_change_block ccol,crow,4,12,0
call drawblock

;------------*row 12*

coin_reset
add crow,22

_change_block ccol,crow,4,2,0
call drawblock

add ccol,4
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,2,2,0
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,4,2,0
call drawblock


;------------*row 13*


coin_reset
add crow,24

add ccol,2
_change_block ccol,crow,2,2,0
call drawblock

add ccol,2
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,8,2,0
call drawblock

add ccol,8
_change_block ccol,crow,4,2,14
call drawblock

add ccol,4
_change_block ccol,crow,4,2,0
call drawblock

;------------*row 14*

coin_reset
add crow,26

add ccol,2
_change_block ccol,crow,4,2,0
call drawblock

add ccol,4
_change_block ccol,crow,2,2,15
call drawblock

add ccol,2
_change_block ccol,crow,12,2,14
call drawblock

add ccol,12
_change_block ccol,crow,4,2,0
call drawblock

;------------*row 15*


coin_reset
add crow,28

add ccol,4
_change_block ccol,crow,6,2,0
call drawblock

add ccol,6
_change_block ccol,crow,6,2,14
call drawblock

add ccol,6
_change_block ccol,crow,8,2,0
call drawblock

;------------*row 16*

coin_reset
add crow,30

add ccol,8
_change_block ccol,crow,12,2,0
call drawblock
.endif
ret
mk_coin endp

;===================================================
;===================== COIN PROCEDURES END==============
;===================================================

;===================================================
;================ LIFE PROCEDURES ==================
;===================================================

life_reset proc
_movx lcol, lstart_col		
_movx lrow, lstart_row			
ret
life_reset endp

mk_life proc

;------------*row 1*
call life_reset
add lcol,14
_change_block lcol,lrow,8,2,0
call drawblock

;------------*row 2*
call life_reset
add lrow,2

add lcol,10
_change_block lcol,lrow,4,2,0
call drawblock

add lcol,4
_change_block lcol,lrow,6,2,4
call drawblock

add lcol,6
_change_block lcol,lrow,4,2,0
call drawblock

;------------*row 3*
call life_reset
add lrow,4

add lcol,8
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,12,2,4
call drawblock

add lcol,12
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 4*
call life_reset
add lrow,6

add lcol,6
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,8,2,4
call drawblock

add lcol,8
_change_block lcol,lrow,10,2,0
call drawblock

;------------*row 5*
call life_reset
add lrow,8

add lcol,4
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,6,2,4
call drawblock

add lcol,6
_change_block lcol,lrow,16,2,0
call drawblock

;------------*row 6*
call life_reset
add lrow,10

add lcol,4
_change_block lcol,lrow,8,2,0
call drawblock

add lcol,8
_change_block lcol,lrow,12,2,15
call drawblock

add lcol,12
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 7*
call life_reset
add lrow,12

add lcol,2
_change_block lcol,lrow,8,2,0
call drawblock

add lcol,8
_change_block lcol,lrow,6,2,15
call drawblock

add lcol,6
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,15
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,15
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 8*
call life_reset
add lrow,14

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,15
call drawblock

add lcol,2
_change_block lcol,lrow,4,2,0
call drawblock

add lcol,4
_change_block lcol,lrow,6,2,15
call drawblock

add lcol,6
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,15
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,15
call drawblock

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock


;------------*row 9*
call life_reset
add lrow,16

_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,4,2,15
call drawblock

add lcol,4
_change_block lcol,lrow,6,2,0
call drawblock

add lcol,6
_change_block lcol,lrow,14,2,15
call drawblock

add lcol,14
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 10*
call life_reset
add lrow,18

_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,6,2,15
call drawblock

add lcol,6
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,4,2,15
call drawblock

add lcol,4
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,10,2,15
call drawblock

add lcol,10
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 11*
call life_reset
add lrow,20

add lcol,2
_change_block lcol,lrow,2,2,0
call drawblock

add lcol,2
_change_block lcol,lrow,8,2,15
call drawblock

add lcol,8
_change_block lcol,lrow,8,2,0
call drawblock

add lcol,8
_change_block lcol,lrow,4,2,15
call drawblock

add lcol,4
_change_block lcol,lrow,4,2,0
call drawblock

;------------*row 12*
call life_reset
add lrow,22

add lcol,4
_change_block lcol,lrow,4,2,0
call drawblock

add lcol,4
_change_block lcol,lrow,8,2,15
call drawblock

add lcol,8
_change_block lcol,lrow,10,2,0
call drawblock

;------------*row 13*
call life_reset
add lrow,24

add lcol,6
_change_block lcol,lrow,6,2,0
call drawblock

add lcol,6
_change_block lcol,lrow,10,2,15
call drawblock

add lcol,10
_change_block lcol,lrow,2,2,0
call drawblock

;------------*row 14*
call life_reset
add lrow,26

add lcol,12
_change_block lcol,lrow,10,2,0
call drawblock

ret
mk_life endp

;===================================================
;================ LIFE PROCEDURES END===============
;===================================================

;===================================================
;===================== KAMEK PROCEDURES END==============
;===================================================

kamek_reset proc
_movx kcol, kstart_col		
_movx krow, kstart_row			
ret
kamek_reset endp

mk_kamek proc

.if level==2 || intermed_screen
;------------*row 1*

call kamek_reset
_change_block kcol,krow,4,2,12
call drawblock

add kcol,4
_change_block kcol,krow,2,2,5
call drawblock

;------------*row 2*
call kamek_reset
add krow,2


_change_block kcol,krow,4,2,12
call drawblock

add kcol,4
_change_block kcol,krow,4,2,5
call drawblock

add kcol,30
_change_block kcol,krow,14,2,1
call drawblock

;------------*row 3*
call kamek_reset
add krow,4


_change_block kcol,krow,8,2,5
call drawblock

add kcol,30
_change_block kcol,krow,28,2,1
call drawblock

;------------*row 4*
call kamek_reset
add krow,6

add kcol,2
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,2,2,6
call drawblock

add kcol,18
_change_block kcol,krow,10,2,15
call drawblock

add kcol,10
_change_block kcol,krow,22,2,1
call drawblock

;------------*row 5*
call kamek_reset
add krow,8

add kcol,6
_change_block kcol,krow,6,2,6
call drawblock

add kcol,20
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,6,2,15
call drawblock


add kcol,6
_change_block kcol,krow,18,2,1
call drawblock

;------------*row 6*
call kamek_reset
add krow,10

add kcol,8
_change_block kcol,krow,6,2,6
call drawblock

add kcol,10
_change_block kcol,krow,4,2,15
call drawblock

add kcol,6
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock


add kcol,2
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,12,2,1
call drawblock

;------------*row 7*
call kamek_reset
add krow,12

add kcol,10
_change_block kcol,krow,6,2,6
call drawblock

add kcol,6
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,1
call drawblock


add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,5
call drawblock

add kcol,2
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,6,2,1
call drawblock

;------------*row 8*
call kamek_reset
add krow,14

add kcol,12
_change_block kcol,krow,4,2,6
call drawblock

add kcol,4
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,5
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,2,2,5
call drawblock

add kcol,2
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,4,2,1
call drawblock

add kcol,4
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,4,2,1
call drawblock

;------------*row 9*
call kamek_reset
add krow,16

add kcol,12
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,2,2,6
call drawblock

add kcol,2
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,8,2,5
call drawblock

add kcol,8
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,10,2,15
call drawblock

add kcol,10
_change_block kcol,krow,6,2,1
call drawblock

;------------*row 10*
call kamek_reset
add krow,18

add kcol,14
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,18,2,5
call drawblock

add kcol,18
_change_block kcol,krow,8,2,15
call drawblock

add kcol,8
_change_block kcol,krow,8,2,1
call drawblock

;------------*row 11*
call kamek_reset
add krow,20

add kcol,16
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,8,2,5
call drawblock

add kcol,8
_change_block kcol,krow,6,2,7
call drawblock

add kcol,6
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,12,2,1
call drawblock

;------------*row 12*
call kamek_reset
add krow,22

add kcol,16
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,2,2,7
call drawblock

add kcol,2
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,2,2,5
call drawblock

add kcol,2
_change_block kcol,krow,4,2,7
call drawblock

add kcol,4
_change_block kcol,krow,2,2,5
call drawblock

add kcol,2
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,8,2,5
call drawblock


add kcol,8
_change_block kcol,krow,24,2,1
call drawblock

;------------*row 13*
call kamek_reset
add krow,24

add kcol,16
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,2,2,7
call drawblock

add kcol,2
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,14,2,5
call drawblock

add kcol,14
_change_block kcol,krow,28,2,1
call drawblock

add kcol,32
_change_block kcol,krow,2,2,12
call drawblock

add kcol,4
_change_block kcol,krow,2,2,12
call drawblock

;------------*row 14*
call kamek_reset
add krow,26

add kcol,18
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,4,2,1
call drawblock

add kcol,6
_change_block kcol,krow,6,2,5
call drawblock

add kcol,6
_change_block kcol,krow,32,2,1
call drawblock

add kcol,34
_change_block kcol,krow,6,2,12
call drawblock

add kcol,6
_change_block kcol,krow,4,2,8
call drawblock

;------------*row 15*
call kamek_reset
add krow,28

add kcol,18
_change_block kcol,krow,4,2,15
call drawblock

add kcol,18
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,2,2,15
call drawblock

add kcol,2
_change_block kcol,krow,28,2,1
call drawblock

add kcol,28
_change_block kcol,krow,6,2,12
call drawblock

add kcol,6
_change_block kcol,krow,2,2,8
call drawblock

add kcol,2
_change_block kcol,krow,6,2,12
call drawblock

;------------*row 16*
call kamek_reset
add krow,30

add kcol,8
_change_block kcol,krow,2,2,8
call drawblock

add kcol,2
_change_block kcol,krow,6,2,6
call drawblock

add kcol,26
_change_block kcol,krow,2,2,1
call drawblock

add kcol,2
_change_block kcol,krow,4,2,15
call drawblock

add kcol,4
_change_block kcol,krow,26,2,1
call drawblock

add kcol,26
_change_block kcol,krow,10,2,12
call drawblock

add kcol,10
_change_block kcol,krow,4,2,8
call drawblock

;------------*row 17*
call kamek_reset
add krow,32

add kcol,8
_change_block kcol,krow,18,2,6
call drawblock

add kcol,26
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,22,2,1
call drawblock

add kcol,22
_change_block kcol,krow,10,2,12
call drawblock

add kcol,10
_change_block kcol,krow,2,2,8
call drawblock

add kcol,2
_change_block kcol,krow,4,2,12
call drawblock

;------------*row 18*
call kamek_reset
add krow,34

add kcol,14
_change_block kcol,krow,22,2,6
call drawblock

add kcol,22
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,6,2,15
call drawblock

add kcol,6
_change_block kcol,krow,16,2,1
call drawblock

add kcol,16
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,16,2,12
call drawblock

add kcol,16
_change_block kcol,krow,2,2,8
call drawblock

;------------*row 19*
call kamek_reset
add krow,36

add kcol,24
_change_block kcol,krow,14,2,6
call drawblock

add kcol,14
_change_block kcol,krow,4,2,5
call drawblock

add kcol,4
_change_block kcol,krow,10,2,15
call drawblock

add kcol,10
_change_block kcol,krow,8,2,1
call drawblock

add kcol,8
_change_block kcol,krow,2,2,6
call drawblock

add kcol,2
_change_block kcol,krow,2,2,0
call drawblock

add kcol,2
_change_block kcol,krow,12,2,12
call drawblock

add kcol,12
_change_block kcol,krow,4,2,8
call drawblock

;------------*row 20*
call kamek_reset
add krow,38

add kcol,36
_change_block kcol,krow,8,2,5
call drawblock

add kcol,8
_change_block kcol,krow,8,2,15
call drawblock

add kcol,8
_change_block kcol,krow,6,2,1
call drawblock

add kcol,6
_change_block kcol,krow,2,2,4
call drawblock

add kcol,12
_change_block kcol,krow,10,2,12
call drawblock

;------------*row 21*
call kamek_reset
add krow,40

add kcol,38
_change_block kcol,krow,4,2,5
call drawblock

add kcol,8
_change_block kcol,krow,14,2,4
call drawblock

;------------*row 22*
call kamek_reset
add krow,42

add kcol,48
_change_block kcol,krow,4,2,4
call drawblock

add kcol,4
_change_block kcol,krow,4,2,4
call drawblock

.endif
ret 
mk_kamek endp

;=========================================================================================
CLEAR_kamek proc
;------------*row 1*

call kamek_reset
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

;------------*row 2*
call kamek_reset
add krow,2


_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,4,2,3
call drawblock

add kcol,30
_change_block kcol,krow,14,2,3
call drawblock

;------------*row 3*
call kamek_reset
add krow,4


_change_block kcol,krow,8,2,3
call drawblock

add kcol,30
_change_block kcol,krow,28,2,3
call drawblock

;------------*row 4*
call kamek_reset
add krow,6

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,18
_change_block kcol,krow,10,2,3
call drawblock

add kcol,10
_change_block kcol,krow,22,2,3
call drawblock

;------------*row 5*
call kamek_reset
add krow,8

add kcol,6
_change_block kcol,krow,6,2,3
call drawblock

add kcol,20
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock


add kcol,6
_change_block kcol,krow,18,2,3
call drawblock

;------------*row 6*
call kamek_reset
add krow,10

add kcol,8
_change_block kcol,krow,6,2,3
call drawblock

add kcol,10
_change_block kcol,krow,4,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock


add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,12,2,3
call drawblock

;------------*row 7*
call kamek_reset
add krow,12

add kcol,10
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock


add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,6,2,3
call drawblock

;------------*row 8*
call kamek_reset
add krow,14

add kcol,12
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

;------------*row 9*
call kamek_reset
add krow,16

add kcol,12
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,10,2,3
call drawblock

add kcol,10
_change_block kcol,krow,6,2,3
call drawblock

;------------*row 10*
call kamek_reset
add krow,18

add kcol,14
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,18,2,3
call drawblock

add kcol,18
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,8,2,3
call drawblock

;------------*row 11*
call kamek_reset
add krow,20

add kcol,16
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,12,2,3
call drawblock

;------------*row 12*
call kamek_reset
add krow,22

add kcol,16
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,8,2,3
call drawblock


add kcol,8
_change_block kcol,krow,24,2,3
call drawblock

;------------*row 13*
call kamek_reset
add krow,24

add kcol,16
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,14,2,3
call drawblock

add kcol,14
_change_block kcol,krow,28,2,3
call drawblock

add kcol,32
_change_block kcol,krow,2,2,3
call drawblock

add kcol,4
_change_block kcol,krow,2,2,3
call drawblock

;------------*row 14*
call kamek_reset
add krow,26

add kcol,18
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,4,2,3
call drawblock

add kcol,6
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,32,2,3
call drawblock

add kcol,34
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,4,2,3
call drawblock

;------------*row 15*
call kamek_reset
add krow,28

add kcol,18
_change_block kcol,krow,4,2,3
call drawblock

add kcol,18
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,28,2,3
call drawblock

add kcol,28
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

;------------*row 16*
call kamek_reset
add krow,30

add kcol,8
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,6,2,3
call drawblock

add kcol,26
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,26,2,3
call drawblock

add kcol,26
_change_block kcol,krow,10,2,3
call drawblock

add kcol,10
_change_block kcol,krow,4,2,3
call drawblock

;------------*row 17*
call kamek_reset
add krow,32

add kcol,8
_change_block kcol,krow,18,2,3
call drawblock

add kcol,26
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,22,2,3
call drawblock

add kcol,22
_change_block kcol,krow,10,2,3
call drawblock

add kcol,10
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,4,2,3
call drawblock

;------------*row 18*
call kamek_reset
add krow,34

add kcol,14
_change_block kcol,krow,22,2,3
call drawblock

add kcol,22
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,16,2,3
call drawblock

add kcol,16
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,16,2,3
call drawblock

add kcol,16
_change_block kcol,krow,2,2,3
call drawblock

;------------*row 19*
call kamek_reset
add krow,36

add kcol,24
_change_block kcol,krow,14,2,3
call drawblock

add kcol,14
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,10,2,3
call drawblock

add kcol,10
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,2,2,3
call drawblock

add kcol,2
_change_block kcol,krow,12,2,3
call drawblock

add kcol,12
_change_block kcol,krow,4,2,3
call drawblock

;------------*row 20*
call kamek_reset
add krow,38

add kcol,36
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,8,2,3
call drawblock

add kcol,8
_change_block kcol,krow,6,2,3
call drawblock

add kcol,6
_change_block kcol,krow,2,2,3
call drawblock

add kcol,12
_change_block kcol,krow,10,2,3
call drawblock

;------------*row 21*
call kamek_reset
add krow,40

add kcol,38
_change_block kcol,krow,4,2,3
call drawblock

add kcol,8
_change_block kcol,krow,14,2,3
call drawblock

;------------*row 22*
call kamek_reset
add krow,42

add kcol,48
_change_block kcol,krow,4,2,3
call drawblock

add kcol,4
_change_block kcol,krow,4,2,3
call drawblock


ret 
clear_kamek endp


;-------------------------move kamek----------------------------------

mov_kamek proc 
.if level==2

call clear_kamek

.if (kvar)
add kstart_col,5
jmp k_mov_end
.endif

sub kstart_col,5


k_mov_end:

call mk_kamek
.if (kstart_col<125)
_movx kvar, 1
.endif

.if (kstart_col>480)
_movx kvar, 0
.endif

.endif 


ret 
mov_kamek endp  


;===================================================
;===================== KEMEK PROCEDURES END=========
;===================================================

;===================================================
;======================MARIO PROCEDURES ============
;===================================================

mario1_reset proc
_movx mario1col, mario1start_col					
ret
mario1_reset endp

mk_mario1 proc

_movx mario1row, mario1start_row
call mario1_reset
mov pixelsize,2
mov si,0
;===============13x16================
mario1top:
cmp drawing_loop,208	
jae mario1end

_change_block mario1col,mario1row,pixelsize,pixelsize,mario1_arr[si]
call drawblock
_add mario1col,pixelsize
add drawing_loop,1

.if( rowsize == 13 )
call mario1_reset
_add mario1row,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp mario1top

mario1end:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_mario1 endp

;===================================================
;=====================MARIO PROCEDURES END==========
;===================================================

;===================================================
;=====================CASTLE PROCEDURES ============
;===================================================

castle_reset proc
_movx castlecol, castlestart_col					
ret
castle_reset endp

mk_castle proc

_movx castlerow, castlestart_row
call castle_reset
mov pixelsize,7
mov si,0
;===============16x16================
castletop:
cmp drawing_loop,256		
jae castleend

_change_block castlecol,castlerow,pixelsize,pixelsize,castle_arr[si]
call drawblock
_add castlecol,pixelsize
add drawing_loop,1

.if( rowsize == 16 )
call castle_reset
_add castlerow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp castletop

castleend:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_castle endp

;===================================================
;=====================CASTLE PROCEDURES END=========
;===================================================


;===================================================
;===================PRINCESS PROCEDURES ============
;===================================================

princess_reset proc
_movx princesscol, princessstart_col					
ret
princess_reset endp

mk_princess proc

_movx princessrow, princessstart_row
call princess_reset
mov pixelsize,2
mov si,0
;===============13x18================
princesstop:
cmp drawing_loop,234		
jae princessend

_change_block princesscol,princessrow,pixelsize,pixelsize,princess_arr[si]
call drawblock
_add princesscol,pixelsize
add drawing_loop,1

.if( rowsize == 13 )
call princess_reset
_add princessrow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp princesstop

princessend:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_princess endp

;===================================================
;===================PRINCESS PROCEDURES END=========
;===================================================


;===================================================
;===================BULLET PROCEDURES ==============
;===================================================

bullet_reset proc
_movx bulletcol, bulletstart_col					
ret
bullet_reset endp

mk_bullet proc

_movx bulletrow, bulletstart_row
call bullet_reset
mov pixelsize,1
mov si,0
;===============14x16================
bullettop:
cmp drawing_loop,224		
jae bulletend

_change_block bulletcol,bulletrow,pixelsize,pixelsize,bullet_arr[si]
call drawblock
_add bulletcol,pixelsize
add drawing_loop,1

.if( rowsize == 14 )
call bullet_reset
_add bulletrow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp bullettop

bulletend:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_bullet endp

;--------------------------------------
;--------------------------------------
;--------------------------------------


clear_bullet proc

_movx bulletrow, bulletstart_row
call bullet_reset
mov pixelsize,1
mov si,0
;===============14x16================
bullettopC:
cmp drawing_loop,224		
jae bulletendC

_change_block bulletcol,bulletrow,pixelsize,pixelsize,3
call drawblock
_add bulletcol,pixelsize
add drawing_loop,1

.if( rowsize == 14 )
call bullet_reset
_add bulletrow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp bullettopC

bulletendC:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
clear_bullet endp






;===================================================
;===================BULLET PROCEDURES END===========
;===================================================

;===================================================
;=====================TITLE PROCEDURES ============
;===================================================

title_reset proc
_movx titlecol, titlestart_col					
ret
title_reset endp

mk_title proc

_movx titlerow, titlestart_row
call title_reset
mov pixelsize,10
mov si,0
;===============41x20================
titletop:
cmp drawing_loop,820		
jae titleend

_change_block titlecol,titlerow,pixelsize,pixelsize,title_arr[si]
call drawblock
_add titlecol,pixelsize
add drawing_loop,1

.if( rowsize == 41 )
call title_reset
_add titlerow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp titletop

titleend:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_title endp

;===================================================
;=====================TITLE PROCEDURES END=========
;===================================================


;===================================================
;=======================FORT PROCEDURES ============
;===================================================

fort_reset proc
_movx fortcol, fortstart_col					
ret
fort_reset endp

mk_fort proc

_movx fortrow, fortstart_row
call fort_reset
mov pixelsize,8
mov si,0
;===============34x41================
forttop:
cmp drawing_loop,1230		
jae fortend

_change_block fortcol,fortrow,pixelsize,pixelsize,fort_arr[si]
call drawblock
_add fortcol,pixelsize
add drawing_loop,1

.if( rowsize == 41 )
call fort_reset
_add fortrow,pixelsize
mov rowsize,0
.endif

inc si
add rowsize,1
jmp forttop

fortend:
mov rowsize,1
mov drawing_loop,0
mov si,0

ret 
mk_fort endp

;===================================================
;=======================FORT PROCEDURES END=========
;===================================================

;===================================================
;================CLEAR COIN PROCEDURES =============
;===================================================

clear_coin proc

;------------*row 1*

coin_reset
add ccol,8
_change_block ccol,crow,12,2,3
call drawblock

;------------*row 2*
coin_reset
add crow,2

add ccol,4
_change_block ccol,crow,6,2,3
call drawblock

add ccol,6
_change_block ccol,crow,6,2,3
call drawblock

add ccol,6
_change_block ccol,crow,8,2,3
call drawblock

;------------*row 3*

coin_reset
add crow,4

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,10,2,3
call drawblock

add ccol,10
_change_block ccol,crow,4,2,3
call drawblock

;------------*row 4*

coin_reset
add crow,6

add ccol,2
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,6,2,3
call drawblock

add ccol,6
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,4,2,3
call drawblock


;------------*row 5*

coin_reset
add crow,8

_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,4,2,3
call drawblock

;------------*row 6-11*

coin_reset
add crow,10

_change_block ccol,crow,2,12,3
call drawblock

add ccol,2
_change_block ccol,crow,2,12,3
call drawblock

add ccol,2
_change_block ccol,crow,6,12,3
call drawblock

add ccol,6
_change_block ccol,crow,2,12,3
call drawblock

add ccol,2
_change_block ccol,crow,4,12,3
call drawblock

add ccol,4
_change_block ccol,crow,2,12,3
call drawblock

add ccol,2
_change_block ccol,crow,6,12,3
call drawblock

add ccol,6
_change_block ccol,crow,4,12,3
call drawblock

;------------*row 12*

coin_reset
add crow,22

_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,4,2,3
call drawblock


;------------*row 13*


coin_reset
add crow,24

add ccol,2
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,8,2,3
call drawblock

add ccol,8
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,4,2,3
call drawblock

;------------*row 14*

coin_reset
add crow,26

add ccol,2
_change_block ccol,crow,4,2,3
call drawblock

add ccol,4
_change_block ccol,crow,2,2,3
call drawblock

add ccol,2
_change_block ccol,crow,12,2,3
call drawblock

add ccol,12
_change_block ccol,crow,4,2,3
call drawblock

;------------*row 15*


coin_reset
add crow,28

add ccol,4
_change_block ccol,crow,6,2,3
call drawblock

add ccol,6
_change_block ccol,crow,6,2,3
call drawblock

add ccol,6
_change_block ccol,crow,8,2,3
call drawblock

;------------*row 16*

coin_reset
add crow,30

add ccol,8
_change_block ccol,crow,12,2,3
call drawblock

ret
clear_coin endp

;===================================================
;=============== CLEAR COIN PROCEDURES END==========
;===================================================



clearmario proc

;----------------------------------------------------CLEARMARIO

;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,12,2,3		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,20,2,3
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,6,2,3	
call drawblock

;eye
add mcol,6
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,8,2,3
call drawblock

;eye
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,8,2,3
call drawblock

;eye/stash
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,10,2,3
call drawblock

;eye/stash
add mcol,10
_change_block mcol,mrow,8,2,3
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,16,2,3
call drawblock

;------------*row 8*
mario_reset
add mrow,14

;red cloth
add mcol, 4
_change_block mcol,mrow,4,2,3
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;blue cloth
add mcol , 4
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 9*
mario_reset
add mrow,16

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;red cloth
_change_block mcol,mrow,8,2,3
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,8,2,3
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,8,2,3
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

;skin
_change_block mcol,mrow,4,2,3
call drawblock

;red cloth
add mcol , 4
_change_block mcol,mrow,2,2,3
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;yellow
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;yellow
add mcol, 4
_change_block mcol,mrow,2,2,3
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;red
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock
 
;------------*row 12*
mario_reset
add mrow, 22

;skin
_change_block mcol,mrow,6,2,3
call drawblock

;blue
add mcol, 6
_change_block mcol,mrow,12,2,3
call drawblock

;skin
add mcol, 12
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 13*
mario_reset
add mrow, 24

;skin
_change_block mcol,mrow,4,2,3
call drawblock

;blue
add mcol,4
_change_block mcol,mrow,6,2,3
call drawblock

;blue
add mcol,10
_change_block mcol,mrow,6,2,3
call drawblock


;skin
add mcol , 6
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

;blue
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock

;blue
add mcol, 10
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 15*
mario_reset
add mrow, 28

;brown
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;brown
add mcol, 14
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 16*
mario_reset
add mrow, 30

;black
_change_block mcol,mrow,8,2,3
call drawblock

;black
add mcol ,16
_change_block mcol,mrow,8,2,3
call drawblock


ret
clearmario endp
;--------------------------------------------
;--------------------CLEAR MARIO END---------
;--------------------------------------------

;--------------------------------------------
;--------------------CLEAR MARIO JUMP--------
;--------------------------------------------

clearmariojump proc
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,10,2,3		
call drawblock

add mcol,14
_change_block mcol,mrow,6,2,3		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,18,2,3
call drawblock

add mcol,18
_change_block mcol,mrow,4,2,3		
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,4,2,3	
call drawblock

;eye
add mcol,4
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

add mcol,4
_change_block mcol,mrow,6,2,3		
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;eye
add mcol, 6
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

add mcol,6
_change_block mcol,mrow,4,2,3		
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock

;eye/stash
add mcol, 6
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

add mcol,6
_change_block mcol,mrow,2,2,3		
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,8,2,3
call drawblock

;eye/stash
add mcol,8
_change_block mcol,mrow,8,2,3
call drawblock

add mcol,8
_change_block mcol,mrow,2,2,3		
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,14,2,3
call drawblock

add mcol,14
_change_block mcol,mrow,4,2,3		
call drawblock

;------------*row 8*
mario_reset
add mrow,14

sub mcol,4
_change_block mcol,mrow,4,2,3		
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,8,2,3
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol , 6
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

add mcol,8
_change_block mcol,mrow,2,2,3
call drawblock

;------------*row 9*
mario_reset
add mrow,16

sub mcol,4
_change_block mcol,mrow,4,2,3		
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,10,2,3
call drawblock

;blue cloth
add mcol, 10
_change_block mcol,mrow,2,2,3
call drawblock

;red cloth
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,2,2,3
call drawblock

add mcol,6
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;red cloth
add mcol,4
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,8,2,3
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

add mcol,2
_change_block mcol,mrow,4,2,3
call drawblock

add mcol,4
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

add mcol,6
_change_block mcol,mrow,6,2,3
call drawblock

add mcol , 6
_change_block mcol,mrow,2,2,3
call drawblock

;blue
add mcol, 2
_change_block mcol,mrow,10,2,3
call drawblock

;yellow
add mcol, 10
_change_block mcol,mrow,4,2,3
call drawblock

 
;------------*row 12*
mario_reset
add mrow, 22

add mcol,2
_change_block mcol,mrow,4,2,3
call drawblock

;blue
add mcol, 4
_change_block mcol,mrow,18,2,3
call drawblock

add mcol, 18
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 13*
mario_reset
add mrow, 24

_change_block mcol,mrow,6,2,3
call drawblock

;blue
add mcol,6
_change_block mcol,mrow,12,2,3
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

_change_block mcol,mrow,4,2,3
call drawblock

ret 
clearmariojump endp

;--------------------------------------------
;----------------CLEAR MARIO JUMP END--------
;--------------------------------------------


;--------------------------------------------
;----------------CLEAR MARIO RUN ------------
;--------------------------------------------

clearmariorun proc
;---------------------*row 1*
;hat top
mario_reset

add mcol,6
_change_block mcol,mrow,12,2,3		
call drawblock

;---------------------*row 2*
;hat lower
mario_reset
add mrow,2 

add mcol,4
_change_block mcol,mrow,20,2,3
call drawblock

;---------------------*row 3*
mario_reset
add mrow, 4

;hair
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock


;skin
add mcol, 6
_change_block mcol,mrow,6,2,3	
call drawblock

;eye
add mcol,6
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;---------------------*row 4*
mario_reset
add mrow, 6

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,8,2,3
call drawblock

;eye
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------------*row 5*
mario_reset
add mrow, 8

;hair
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,8,2,3
call drawblock

;eye/stash
add mcol, 8
_change_block mcol,mrow,2,2,3
call drawblock

;skin
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------ *row 6*
mario_reset
add mrow, 10

;hair
add mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol,4
_change_block mcol,mrow,10,2,3
call drawblock

;eye/stash
add mcol,10
_change_block mcol,mrow,8,2,3
call drawblock

;------------*row 7*
mario_reset
add mrow, 12

;skin
add mcol,6
_change_block mcol,mrow,16,2,3
call drawblock

;------------*row 8*
mario_reset
add mrow,14

;red cloth
_change_block mcol,mrow,8,2,3
call drawblock

;blue cloth
add mcol, 8
_change_block mcol,mrow,4,2,3
call drawblock

;red cloth
add mcol, 4
_change_block mcol,mrow,4,2,3
call drawblock


;------------*row 9*
mario_reset
add mrow,16

;skin
sub mcol,4
_change_block mcol,mrow,6,2,3
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol, 6
_change_block mcol,mrow,6,2,3
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,6,2,3
call drawblock

;skin
add mcol, 6
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 10*
mario_reset
add mrow,18

;skin
sub mcol,4
_change_block mcol,mrow,8,2,3
call drawblock

;red cloth
add mcol, 8
_change_block mcol,mrow,4,2,3
call drawblock

;blue cloth
add mcol, 4
_change_block mcol,mrow,2,2,3
call drawblock

;yellow cloth
add mcol, 2
_change_block mcol,mrow,2,2,3
call drawblock

;blue cloth
add mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;red cloth
add mcol, 6
_change_block mcol,mrow,4,2,3
call drawblock

;skin
add mcol, 4
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 11*
mario_reset
add mrow, 20

;skin
sub mcol,4
_change_block mcol,mrow,6,2,3
call drawblock

;blue cloth
add mcol , 8
_change_block mcol,mrow,14,2,3
call drawblock

;shoe
add mcol, 16
_change_block mcol,mrow,4,2,3
call drawblock

 
;------------*row 12*
mario_reset
add mrow, 22

;red
add mcol,2
_change_block mcol,mrow,18,2,3
call drawblock

;shoe
add mcol, 18
_change_block mcol,mrow,4,2,3
call drawblock



;------------*row 13*
mario_reset
add mrow, 24

;blue
_change_block mcol,mrow,20,2,3
call drawblock

;shoe
add mcol,20
_change_block mcol,mrow,4,2,3
call drawblock

;------------*row 14*
mario_reset
add mrow, 26

;shoe
sub mcol, 2
_change_block mcol,mrow,4,2,3
call drawblock

;blue
add mcol, 4
_change_block mcol,mrow,6,2,3
call drawblock

;blue
add mcol, 10
_change_block mcol,mrow,8,2,3
call drawblock

;shoe
add mcol, 8
_change_block mcol,mrow,4,2,3
call drawblock


;------------*row 15*
mario_reset
add mrow, 28

;shoe
sub mcol, 2
_change_block mcol,mrow,6,2,3
call drawblock

;------------*row 16*
mario_reset
add mrow, 30

;shoe
_change_block mcol,mrow,6,2,3
call drawblock

ret
clearmariorun endp

;--------------------------------------------
;----------------CLEAR MARIO RUN END---------
;--------------------------------------------

clearenemy proc uses ax bx

;-----------row 1
_movx er, ax
_movx ec, bx
_change_block ec,er,8,2,3
call drawblock

;----------row 2
add er, 2
sub ec, 2
_change_block ec,er,12,2,3
call drawblock

;----------row 3
add er, 2
sub ec, 2
_change_block ec,er,16,2,3
call drawblock

;----------row 4
add er, 2
sub ec, 2
_change_block ec,er,20,2,3
call drawblock
;----------row 5
add er, 2
sub ec, 2
push ec
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,4,2,3
call drawblock
add ec, 4
_change_block ec,er,12,2,3
call drawblock
add ec, 12
_change_block ec,er,4,2,3
call drawblock
add ec, 4
_change_block ec,er,2,2,3
call drawblock
;----------row 6
add er, 2
pop ec
sub ec, 2
push ec
_change_block ec,er,6,2,3
call drawblock

add ec, 6
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,8,2,3
call drawblock
add ec, 8
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,6,2,3
call drawblock

;----------row 7
add er, 2
pop ec
push ec
_change_block ec,er,6,2,3
call drawblock

add ec, 6
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,12,2,3
call drawblock
add ec, 12
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,6,2,3
call drawblock

;----------row 8
pop ec
add er, 2
sub ec, 2
push ec
_change_block ec,er,8,2,3
call drawblock
add ec, 8
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,4,2,3
call drawblock
add ec, 4
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,2,2,3
call drawblock
add ec, 2
_change_block ec,er,8,2,3
call drawblock

;----------row 9
pop ec
add er, 2
push ec
_change_block ec,er,8,2,3
call drawblock
add ec, 8
_change_block ec,er,6,2,3
call drawblock
add ec, 6
_change_block ec,er,4,2,3
call drawblock
add ec, 4
_change_block ec,er,6,2,3
call drawblock
add ec, 6
_change_block ec,er,8,2,3
call drawblock
;----------row 10
add er, 2
pop ec
push ec
_change_block ec,er,32,2,3
call drawblock
;----------row 11
add er, 2
pop ec
add ec, 2
push ec

_change_block ec,er,8,2,3
call drawblock
add ec, 8
_change_block ec,er,12,2,3
call drawblock
add ec, 12
_change_block ec,er,8,2,3
call drawblock
;----------row 12 & 13
add er, 2
pop ec
add ec, 6
push ec
_change_block ec,er,16,2,3
call drawblock
add er,2
_change_block ec,er,16,2,3
call drawblock
;----------row 14
add er, 2
pop ec
sub ec, 4
push ec

_change_block ec,er,6,2,3
call drawblock
add ec, 6
_change_block ec,er,12,2,3
call drawblock
add ec, 12
_change_block ec,er,6,2,3
call drawblock

;----------row 15
add er, 2
pop ec
sub ec, 2
push ec

_change_block ec,er,10,2,3
call drawblock
add ec, 10
_change_block ec,er,8,2,3
call drawblock
add ec, 8
_change_block ec,er,10,2,3
call drawblock

;----------row 16
add er, 2
pop ec

_change_block ec,er,12,2,3
call drawblock
add ec, 16

_change_block ec,er,12,2,3
call drawblock

ret
clearenemy endp
;----------------------------------------------------------------------------

mov_enemy1 proc

.if level==2
inc bullet_count


.if bull1_is<1 && bullet_count>=20
_movx bull1_is,1
_movx b1c,bullet_count
.endif 

.if bull2_is<1 && bullet_count>=40
_movx bull2_is,1
.endif

.if bull3_is<1 && bullet_count>=60
_movx bull3_is,1
.endif

.if bullet_count>=70
_movx bullet_count,0
.endif

;;====================bullet 1 =========
.if bull1_is>0
.if bull1_is==1
_movx bull1_x,kstart_col
_movx bull1_y, 100
_movx bull1_is,2
.else
_movx bulletstart_col,bull1_x
_movx bulletstart_row, bull1_y
call clear_bullet
add bull1_y,5
.endif 
_movx bulletstart_col,bull1_x
_movx bulletstart_row, bull1_y

call mk_bullet

mov ax, mstart_col
mov dx, ax
sub dx, 6
add ax, 18
mov bx, bulletstart_row
add bx, 32
.if (dx<=bulletstart_col && ax>=bulletstart_col && bx>=mstart_row)
_movx bulletsent, 1
call clearmario
call clearmariojump
call clearmariorun
jmp chk_mario_die
.endif


.if bull1_y>280|| ( bull1_x<210  &&  bull1_x>125 && bull1_y>230) || (bull1_x<360 && bull1_x>280 && bull1_y>190) || (bull1_x<535 && bull1_x>430 && bull1_y>225)
bulsnt1::
call clear_bullet
_movx bull1_is,0
;_movx bull1_y,100
.endif

.endif
;====================bullet 2 =========
.if bull2_is>0
.if bull2_is==1
_movx bull2_x,kstart_col
_movx bull2_y, 100
_movx bull2_is,2
.else
_movx bulletstart_col,bull2_x
_movx bulletstart_row, bull2_y
call clear_bullet
add bull2_y,5
.endif 
_movx bulletstart_col,bull2_x
_movx bulletstart_row, bull2_y

call mk_bullet

mov ax, mstart_col
mov dx, ax
sub dx, 6
add ax, 18
mov bx, bulletstart_row
add bx, 32
.if (dx<=bulletstart_col && ax>=bulletstart_col && bx>=mstart_row)
_movx bulletsent, 2
call clearmario
call clearmariojump
call clearmariorun
jmp chk_mario_die
.endif

;(mstart_row>=209 && mstart_col<220 && mstart_col>110) || (mstart_row>=173 && mstart_col<365 && mstart_col>260)||(mstart_row>=205 && mstart_col<515 && mstart_col>410);
.if bull2_y>280  || ( bull2_x<210  &&  bull2_x>125 && bull2_y>230) || (bull2_x<360 && bull2_x>280 && bull2_y>190) || (bull2_x<535 && bull2_x>430 && bull2_y>225)
bulsnt2::
call clear_bullet
_movx bull2_is,0
.endif

.endif
;====================bullet 3 =========
.if bull3_is>0
.if bull3_is==1
_movx bull3_x,kstart_col
_movx bull3_y, 100
inc bull3_is
.else
_movx bulletstart_col,bull3_x
_movx bulletstart_row, bull3_y
call clear_bullet
add bull3_y,5
.endif 
_movx bulletstart_col,bull3_x
_movx bulletstart_row, bull3_y

call mk_bullet


mov ax, mstart_col
mov dx, ax
sub dx, 6
add ax, 18
mov bx, bulletstart_row
add bx, 32
.if (dx<=bulletstart_col && ax>=bulletstart_col && bx>=mstart_row)
_movx bulletsent, 3
call clearmario
call clearmariojump
call clearmariorun
jmp chk_mario_die
.endif

.if bull3_y>280|| ( bull3_x<210  &&  bull3_x>125 && bull3_y>230) || (bull3_x<360 && bull3_x>280 && bull3_y>190) || (bull3_x<535 && bull3_x>430 && bull3_y>225)
bulsnt3::
call clear_bullet
_movx bull3_is,0
.endif

.endif
;=========================================



.endif 

.if  !e1_die && e1_drawn
mov ax,e1_r
mov bx,e1_c

call clearenemy
_movx e1_drawn,0
jmp enemy1gone
.endif

.if level>0  && e1_die
;----------------------------
;------ENEMY 1 MOVEMENT------
;----------------------------

mov ax, e1_c 			;left bound
mov bx, ax
sub ax, 36				; incorp mario width to left bound
add bx , 20				;right bound

mov dx, mstart_row			; height
add  dx, 32

.if (mstart_col>=ax && mstart_col<=bx && dx>=e1_r && mstart_row<270)  ;collisions
mov e1_die,0
mov ax,e1_r
mov bx,e1_c
call clearenemy
.endif 

.if (mstart_col>=ax && mstart_col<=bx && mstart_row>=270)

chk_mario_die::
.if (lives==0)
jmp _out
.endif 

_movx lstart_col, 5
dec lives

mov bx, 38
mov ax, lives
mul bx 

_change_block ax,5,38,28,3
call drawblock

call clearmario
_movx mstart_col, 10
_movx mstart_row, 273

.if bulletsent==1
_movx bulletsent,0
jmp bulsnt1
.endif

.if bulletsent==2
_movx bulletsent,0
jmp bulsnt2
.endif

.if bulletsent==3
_movx bulletsent,0
jmp bulsnt3
.endif

.endif

mov ax,e1_r
mov bx,e1_c
call mk_enemy 


mov ax,e1_r
mov bx,e1_c

call clearenemy
 
mov ax,evaR1
add e1_c,ax
cmp e1_c,286			;left boundary of tunnel 2
jae e1moveL

cmp e1_c,214			;right boundary of tunnel 1
jbe e1moveR
jmp enemyend1

e1moveL:
mov evaR1,-1			;add -1 to move enemy left
jmp enemyend1

e1moveR:	
mov evaR1,1				;add 1 to move enemy right
jmp enemyend1

enemyend1:

		mov ax,e1_r
		mov bx,e1_c
		call mk_enemy 
		
.endif
enemy1gone:
		ret
mov_enemy1 endp 


mov_enemy2 proc 
.if  !e2_die && e2_drawn
mov ax,e2_r
mov bx,e2_c

call clearenemy
_movx e2_drawn,0
	
jmp enemy2gone
.endif
;----------------------------
;------ENEMY 1 MOVEMENT------
;----------------------------
.if (level>0 && e2_die)
mov ax, e2_c 			;left bound
mov bx, ax
sub ax, 36				; incorp mario width to left bound
add bx , 20				; right bound

mov dx, mstart_row		; height
add  dx, 32

.if (mstart_col>=ax && mstart_col<=bx && dx>=e2_r && mstart_row<270) 
mov e2_die,0
mov ax,e2_r
mov bx,e2_c
call clearenemy
.endif 

.if (mstart_col>=ax && mstart_col<=bx && mstart_row>=270)
.if (lives==0)
jmp _out
.endif 

_movx lstart_col, 5
dec lives

mov bx, 38
mov ax, lives
mul bx 

_change_block ax,5,38,28,3
call drawblock

call clearmario
_movx mstart_col, 10
_movx mstart_row, 273
.endif

mov ax,e2_r
mov bx,e2_c
call mk_enemy 


mov ax,e2_r
mov bx,e2_c

call clearenemy	
 
mov ax,evar2
add e2_c,ax
cmp e2_c,364			;right boundary of tunnel 2
jbe e2moveR

cmp e2_c,436			;left boundary of tunnel 3
jae e2moveL
jmp enemyend2

e2moveL:
mov evar2,-1			;add -1 to move enemy left
jmp enemyend2

e2moveR:
mov evar2,1				;add 1 to move enemy right
jmp enemyend2

enemyend2:
;----------------------------
;-----ENEMY MOVEMENT END-----
;----------------------------

mov ax,e2_r
mov bx,e2_c
call mk_enemy   
.endif
enemy2gone:
		ret
mov_enemy2 endp 

chk_keys proc
cmp ah, 48h 
je arr_up
cmp ah, 4bh
je arr_lft
cmp ah, 4dh
je arr_rt
cmp ah, 50h
je arr_dn
cmp ah, 0eh
je _out_of_game
jmp play
ret
chk_keys endp

;//////////////////////////////LEVEL UP
levelUp proc


_draw_bloc 0,0,80,80,3		;background


_draw_bloc 66,6,66,10,14	; right vertical of laam
_draw_bloc 59,10,66,10,14	; base
_draw_bloc 59,9,59,9,14		; left sub vertic
_draw_bloc 59,8,62,8,14		; wow top
_draw_bloc 62,9,62,12,14	; right sub vertic
_draw_bloc 59,12,62,12,14	; wow bottom

_draw_bloc 64,12,64,12,14	; dot
_draw_bloc 66,12,66,12,14	; dot
;--------------------------------

_draw_bloc 57,6,57,12,14	; right vertical of laam
_draw_bloc 53,12,57,12,14	; laam bottom
_draw_bloc 53,10,53,12,14	; left vertical of laam
;--------------------------------


_draw_bloc 50,8,50,10,14		; left sub vertic
_draw_bloc 43,10,51,10,14		; hey upper base
_draw_bloc 51,8,51,10,14		; right sub vertic
_draw_bloc 43,8,43,10,14		; left lower vertic

_draw_bloc 43,8,43,10,14		; left sub vertic
_draw_bloc 43,8,46,8,14		; wow top
_draw_bloc 46,8,46,12,14	; right sub vertic
_draw_bloc 43,12,46,12,14	; wow bottom

_draw_bloc 48,12,48,13,14	; punct mark
_draw_bloc 49,13,50,13,14	; punct bottom
;--------------------------------
_draw_bloc 41,7,41,12,14	; right vertical of gaaf
_draw_bloc 41,6,51,6,14		; gaaf top
_draw_bloc 41,4,51,4,14		; gaaf top
_draw_bloc 35,12,41,12,14		; gaaf bottom
_draw_bloc 35,7,35,12,14	; right vertical of gaaf

_draw_bloc 39,11,39,11,14		; gaaf dash
_draw_bloc 38,14,38,14,14		; dot
_draw_bloc 36,14,36,14,14		; dot
;--------------------------------
_draw_bloc 33,7,33,12,14	; Alif

_draw_bloc 31,5,34,5,14	; madd horizontal
_draw_bloc 34,4,34,4,14	; madd vertical
_draw_bloc 31,5,31,6,14	; madd vertical

_draw_bloc 24,10,30,10,14	; pay
_draw_bloc 30,9,30,9,14	; dash 
_draw_bloc 24,9,24,9,14	; dash

_draw_bloc 28,12,28,12,14		; dot
_draw_bloc 26,12,26,12,14		; dot
_draw_bloc 27,14,27,14,14		; dot

;--------------------------------
_draw_bloc 22,7,22,12,14	; right vertical of kaaf
_draw_bloc 22,6,29,6,14		; kaaf top
_draw_bloc 16,12,21,12,14		; kaaf base
_draw_bloc 16,6,16,12,14	; lft vertical of kaaf

;--------------------------------
_draw_bloc 11,5,11,11,14	; exclam
_draw_bloc 11,13,11,13,14	; dot

;//////////////////////TUNNELS

_movx varloop,0
_movx  fstart_col, 0
_movx fstart_row, 305
mk_floor

_movx tstart_col,20
_movx tstart_row,250

mk_tunnel 21

add tstart_col,500

mk_tunnel 21

mov ax, 273
mov bx, 225
call mk_enemy

add bx, 175
call mk_enemy

_movx mstart_col, 35
_movx mstart_row, 200

_movx kstart_col,500
_movx kstart_row,200
call mk_kamek
call mk_mario_jump

mov cx,0030H                    
mov dx,0000h                    
mov ah,86h                 
int 15h

mov ax,SEG interm_msg ; set ES segment
mov dl,25
mov dh,16
mov bl, 15
mov cx, sizeof interm_msg
call printStr

;_movx k

dec intermed_screen
call resetAllVals
mov ah,0
int 16h

; _draw_bloc 60,5,61,10,14
; mov ah,0
; int 16h

ret
levelUp endp 

;//////////////////////////////Val RESERT

resetAllVals proc 
_movx e1_die, 1
_movx e2_die,1

_movx mstart_col, 10
_movx mstart_row, 273

_movx e1_die, 1
_movx e1_r, 273  	;start position row
_movx e1_c, 250  	;start position col
_movx e2_die, 1
_movx e2_r, 273
_movx e2_c, 400

_movx  fstart_col, 0
_movx fstart_row, 305

_movx tstart_col, 150; 
_movx tstart_row, 251; 

_movx bstart_col , 162
_movx bstart_row, 120

_movx cstart_col, 162
_movx cstart_row, 88

_movx varloop, 0
_movx varloop1, 0
_movx evaR1, 1
_movx evar2, 1 

_movx lstart_col, 5

_movx kstart_col,350
_movx kstart_row,67

_movx e1_drawn,1
_movx e2_drawn,1



ret
resetAllVals endp 

printStr proc 
mov es,ax
mov ah,13h ; write string
mov al,1 ; write mode
mov bh,0 ; video page
;mov cx,(SIZEOF interm_msg) / 2 ; string length
;mov dh,str_row ; start row
;mov dl,str_column ; start column
mov bp,OFFSET interm_msg ; string offset
int 10h
ret
printStr endp 

end main 
end

