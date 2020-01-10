INCLUDE Irvine32.inc
INCLUDE Macros.inc

clearScreen PROTO C
ClearRes PROTO C
DrawPixel PROTO C, :BYTE, :BYTE, :DWORD
DrawBox PROTO C, :WORD, :DWORD
DrawObsticle PROTO C, :WORD, :DWORD
DrawBackground PROTO C
lose PROTO C

.data
inHandle HANDLE ?
outHandle HANDLE ?

boxPosition WORD ?
newBoxPosition WORD ?
obsticlePosition WORD 4 DUP (0)
newObPosition WORD LENGTHOF obsticlePosition DUP (0)

obsticleRange DWORD 0
boxFrame DWORD 0
go BYTE 0

score SDWORD 0

bgColor DWORD lightCyan + (lightCyan * 16)
boxColor DWORD yellow + (yellow * 16)
obsticleColor DWORD green + (green * 16)

.code
game PROC C
;============================== Initial Settings =============================
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov outHandle, eax
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov inHandle, eax

	mov ah, 14		; box X-axis
	mov al, 20		; box Y-axis
	mov newBoxPosition, ax
	mov boxPosition, ax

	mov eax, bgColor
	call SetTextColor
	call Clrscr
	call DrawBackground
	call ClearRes

;============================== Starting Point =============================
start:
	call input

draw:
	pushad
	INVOKE Sleep, 30
	mov dx, newBoxPosition
 	inc boxFrame
	mov bh, dh
	inc bh
	
	mov edi, OFFSET obsticlePosition
	mov esi, OFFSET newObPosition
	mov ecx, LENGTHOF newObPosition

	.WHILE ecx > 0
		push ecx
		mov ax, [esi]
		mov cx, [edi]

		.IF ax != 0 && ax != cx
			pushad
			sub al, 3
			mov cl, al
			sub cl, 6
			
			.IF (dh == ah || bh == ah) && (dl > al || dl < cl)
				inc go
			.ELSEIF bh == ah
				inc score
			.ENDIF
			popad

			push eax
			.IF cx != 0
				INVOKE DrawObsticle, WORD PTR [edi], bgColor
			.ENDIF
			INVOKE DrawObsticle, WORD PTR [esi], obsticleColor
			pop eax
			
			mov ax, [esi]
			mov [edi], ax
		.ENDIF
			
		add esi, TYPE newObPosition
		add edi, TYPE obsticlePosition
		pop ecx
		dec ecx
	.ENDW

	INVOKE DrawBox, boxPosition, bgColor
	INVOKE DrawBox, newBoxPosition, boxColor

	mov boxPosition, dx

	mov eax, white + (brown * 16)
	call SetTextColor
	mGotoxy 10, 1
	mWrite "Score:"
	mov eax, score
	call WriteInt
	

	.IF go > 0
		jmp gameover
	.ENDIF
	
	popad
	ret

;============================== INPUT =============================
input:
.WHILE TRUE
	call ClearRes
	call ReadKey

	mov ax, newBoxPosition
	
	.IF al < 35
		inc al
		mov newBoxPosition, ax
	.ELSE
		jmp gameover
	.ENDIF

	.IF dx == VK_SPACE
		mov ebx, 6		; jump height
		.WHILE ebx > 0
			.IF al > 3
				dec al
				mov newBoxPosition, ax
				pushad
				call background
				popad
				
				dec ebx
			.ELSE
				jmp gameover
			.ENDIF
		.ENDW
	.ENDIF

	call background
.ENDW

;============================== Background =============================
background:
	mov eax, boxFrame
	.IF eax == 2
		mov esi, OFFSET newObPosition
		inc obsticleRange
		mov edx, obsticleRange

		.IF edx == 25
			mov ecx, LENGTHOF newObPosition
			.WHILE ecx > 0
				mov eax, [esi]
				.IF	eax == 0
					push eax
					mov eax, 12
					call RandomRange
					add eax, 19
					mov ch, 28
					mov cl, al
					pop eax
					mov [esi], cx
					mov obsticleRange, 0
					jmp continue
				.ENDIF
				add esi, TYPE newObPosition
				dec ecx
			.ENDW
		.ENDIF

	continue:
		mov esi, OFFSET newObPosition
		mov ecx, LENGTHOF newObPosition

		.WHILE ecx > 0
			mov ax, [esi]
			.IF ax != 0
				dec ah
				.IF ah <= 0
					pushad
					inc ah
					INVOKE DrawObsticle, ax, bgColor
					popad
					mov ax, 0
				.ENDIF
				mov [esi], ax
			.ENDIF
			add esi, TYPE newObPosition
			dec ecx
		.ENDW
		mov boxFrame, 0
		
	.ENDIF

	call draw
	ret

gameover:
	Invoke lose
	ret
game ENDP


END