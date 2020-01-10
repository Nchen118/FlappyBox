INCLUDE Irvine32.inc
INCLUDE Macros.inc

ClearRes PROTO C
DrawPixel PROTO C, :BYTE, :BYTE, :DWORD
DrawBox PROTO C, :WORD, :DWORD
DrawObsticle PROTO C, :WORD, :DWORD

.CODE

ClearRes PROC C

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	ret

ClearRes ENDP

;============================== Drawing =============================
DrawPixel PROC C x:BYTE, y:BYTE, color:DWORD
	
	mov eax, color
	call SetTextColor
	mGotoxy x, y
	mWriteSpace 1
	mov eax, white + (black * 16)
	call SetTextColor
	ret

DrawPixel ENDP

DrawBox PROC C boxPos:WORD, color:DWORD

	mov ax, boxPos
	push eax
	INVOKE DrawPixel, ah, al, color
	pop eax
	inc al
	push eax
	INVOKE DrawPixel, ah, al, color
	pop eax
	mov ax, boxPos
	inc ah
	push eax
	INVOKE DrawPixel, ah, al, color
	pop eax
	inc al
	push eax
	INVOKE DrawPixel, ah, al, color
	pop eax
	ret

DrawBox ENDP

DrawObsticle PROC C obPos:WORD, color:DWORD

	mov ebx, 0
	mov ax, obPos
	mov ecx, 37
	sub cl, al

	.WHILE ebx < 2
		push ecx
		.WHILE ecx > 0
			push eax
			INVOKE DrawPixel, ah, al, color
			pop eax
			inc al
			dec ecx
		.ENDW
		pop ecx
		mov ax, obPos
		inc ah
		add ebx, 1
	.ENDW
	
	mov ebx, 0

	mov ax, obPos
	movzx ecx, al
	sub ecx, 12
	mov al, 3
	mov obPos, ax

	.WHILE ebx < 2
		push ecx
		.WHILE ecx > 0
			push eax
			INVOKE DrawPixel, ah, al, color
			pop eax
			inc al
			dec ecx
		.ENDW
		pop ecx
		mov ax, obPos
		inc ah
		mov obPos, ax
		add ebx, 1
	.ENDW
	ret

DrawObsticle ENDP

DrawBackground PROC C

	mov ch, 0
	.WHILE ch < 30
		mov cl, 0
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		mov cl, 1
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		mov cl, 2
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		mov cl, 37
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		mov cl, 38
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		mov cl, 39
		push ecx
		INVOKE DrawPixel, ch, cl, brown + (brown * 16)
		pop ecx
		inc ch
	.ENDW
	ret
	
DrawBackground ENDP

END