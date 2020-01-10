INCLUDE Irvine32.inc
INCLUDE MACROS.INC
 
 ;Password 12345
 ;Password 0000
.DATA
selection1 byte "Start Game",0
selection2 byte "Score",0
selection3 byte "Exit",0
delayAnimation dword 100				;time to display the welcome
developer byte "Developer:",0
developer1 byte "Chen Yew Seng",0
developer2 byte "Lim Jia Ying",0
developer3 byte "Tey Yong Hup",0
selected byte 1
menuPrinted byte 0				   
whiteSpace byte " "
loginPassword byte "12345",0
loginAdminPass byte "0000",0
password byte "Password: ",0
stringInput byte 6 dup (?)
passwordSize dword ?

setEdit PROTO C
setNoEdit PROTO C
begin PROTO C
menu PROTO C
game PROTO C
flappyBox PROTO C, :dword
DrawPixel PROTO C, :BYTE, :BYTE, :DWORD
DrawWelcome proto :dword
.CODE
	
begin PROC C
	
	mov eax, white + (black * 16)
		call SetTextColor
	call clrscr
	BeforeMenu:
	;================================== Draw Logo==============================
	invoke DrawWelcome, white + (white * 16)
	;================================ Waiting input=============================
	jmp welcomeRead

	welcomeRead:
		mov eax,200
		call delay
		invoke DrawWelcome, blue + (blue * 16)
		mov eax, blue + (black * 16)
		call SetTextColor
		mgotoxy 48, 20
		mov edx, offset developer
		call writestring
		mgotoxy 60, 20
		mov edx, offset developer1
		call writestring
		mgotoxy 60, 21
		mov edx, offset developer2
		call writestring
		mgotoxy 60, 22
		mov edx, offset developer3
		call writestring
		mov eax,200
		call delay
		invoke DrawWelcome, white + (white * 16)
		mov eax, white + (black * 16)
		call SetTextColor
		mgotoxy 48, 20
		mov edx, offset developer
		call writestring
		mgotoxy 60, 20
		mov edx, offset developer1
		call writestring
		mgotoxy 60, 21
		mov edx, offset developer2
		call writestring
		mgotoxy 60, 22
		mov edx, offset developer3
		call writestring
		call readKey
		jz welcomeRead
		jnz login

	;================================== Login =====================================
	login:
		INVOKE setEdit
		call clrscr
		mov bh,10
		.while bh< 21
		mov bl,45
			.while bl< 75
			.if bh == 10 || bh ==20
				INVOKE DrawPixel, bl, bh, white + (white * 16)
			.elseif bl == 45 || bl ==74
				INVOKE DrawPixel, bl, bh, white + (white * 16)
			.endif
			inc bl
			.endw
			inc bh
		.endw
		mov stringInput, 0
		mov eax, white + (black * 16)
		call SetTextColor
		mgotoxy 50, 15
		mov edx, offset password
		call  writestring
		mov edx,0
		mov eax,0 
		mov ebx,0
		mov ecx,0
		mov ecx, 5
		mReadString stringInput
		mov passwordSize, eax
		INVOKE STR_compare, ADDR stringInput, ADDR loginPassword
		je return
		INVOKE STR_compare, ADDR stringInput, ADDR loginAdminPass
		je return
		jne login
	return:
		INVOKE setNoEdit
		ret
	;checkCharacter:
	
		
	
begin ENDP


DrawWelcome proc x:dword
	
	ownDelay:
		mov eax,delayAnimation
		call delay
	Welcome:
		;W
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 24,10, x
		INVOKE DrawPixel, 24,11, x 
		INVOKE DrawPixel, 24,12, x 
		INVOKE DrawPixel, 24,13, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 25,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 27,13, x 
		mov eax,delayAnimation
		call delay
 		INVOKE DrawPixel, 29,12, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 31,13, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 33,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 34,13, x 
		INVOKE DrawPixel, 34,12, x 
		INVOKE DrawPixel, 34,11, x 
		INVOKE DrawPixel, 34,10, x 
		;E
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 38,10, x 
		INVOKE DrawPixel, 38,11, x 
		INVOKE DrawPixel, 38,12, x 
		INVOKE DrawPixel, 38,13, x 
		INVOKE DrawPixel, 38,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 39,10, x 
		INVOKE DrawPixel, 39,12, x 
		INVOKE DrawPixel, 39,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 40,10, x 
		INVOKE DrawPixel, 40,12, x 
		INVOKE DrawPixel, 40,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 41,10, x 
		INVOKE DrawPixel, 41,12, x 
		INVOKE DrawPixel, 41,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 42,10, x 
		INVOKE DrawPixel, 42,12, x 
		INVOKE DrawPixel, 42,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 43,10, x 
		INVOKE DrawPixel, 43,12, x 
		INVOKE DrawPixel, 43,14, x 
		
		
		;L
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 47,10, x 
		INVOKE DrawPixel, 47,11, x 
		INVOKE DrawPixel, 47,12, x 
		INVOKE DrawPixel, 47,13, x 
		INVOKE DrawPixel, 47,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 48,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 49,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 50,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 51,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 52,14, x 

		;c
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 56,11, x 
		INVOKE DrawPixel, 56,12, x 
		INVOKE DrawPixel, 56,13, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 57,10, x 
		INVOKE DrawPixel, 57,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 58,10, x 
		INVOKE DrawPixel, 58,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 59,10, x  
		INVOKE DrawPixel, 59,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 60,10, x 
		INVOKE DrawPixel, 60,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 61,10, x 
		INVOKE DrawPixel, 61,14, x 
		;o 
		INVOKE DrawPixel, 65,11, x 
		INVOKE DrawPixel, 65,12, x 
		INVOKE DrawPixel, 65,13, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 66,10, x 
		INVOKE DrawPixel, 66,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 67,10, x 
		INVOKE DrawPixel, 67,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 68,10, x 
		INVOKE DrawPixel, 68,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 69,10, x 
		INVOKE DrawPixel, 69,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 70,10, x 
		INVOKE DrawPixel, 70,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 71,10, x 
		INVOKE DrawPixel, 71,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 73,11, x 
		INVOKE DrawPixel, 73,12, x 
		INVOKE DrawPixel, 73,13, x 
		;M
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 77,11, x 
		INVOKE DrawPixel, 77,12, x 
		INVOKE DrawPixel, 77,13, x 
		INVOKE DrawPixel, 77,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 78,10, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 80,11, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 82,12, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 84,11, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 86,10, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 88,11, x 
		INVOKE DrawPixel, 88,12, x 
		INVOKE DrawPixel, 88,13, x 
		INVOKE DrawPixel, 88,14, x 

		;E
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 92,10, x 
		INVOKE DrawPixel, 92,11, x 
		INVOKE DrawPixel, 92,12, x 
		INVOKE DrawPixel, 92,13, x 
		INVOKE DrawPixel, 92,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 93,10, x 
		INVOKE DrawPixel, 93,12, x 
		INVOKE DrawPixel, 93,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 94,10, x 
		INVOKE DrawPixel, 94,12, x 
		INVOKE DrawPixel, 94,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 95,10, x 
		INVOKE DrawPixel, 95,12, x 
		INVOKE DrawPixel, 95,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 96,10, x 
		INVOKE DrawPixel, 96,14, x 
		mov eax,delayAnimation
		call delay
		INVOKE DrawPixel, 97,10, x 
		INVOKE DrawPixel, 97,12, x 
		INVOKE DrawPixel, 97,14, x 
		mov eax, white + (black * 16)
		call SetTextColor
		mov eax, white + (black * 16)
		call SetTextColor

		;Developer info
		mgotoxy 48, 20
		mov edx, offset developer
		mov eax,delayAnimation
		call delay
		call writestring
		mgotoxy 60, 20
		mov edx, offset developer1
		call writestring
		mgotoxy 60, 21
		mov edx, offset developer2
		mov eax,delayAnimation
		call delay
		call writestring
		mgotoxy 60, 22
		mov edx, offset developer3
		mov eax,delayAnimation
		call delay
		call writestring
		mov eax,0
		mov delayAnimation, eax
		ret
drawWelcome ENDP
;================================== Display Menu =============================		
menu proc C
	displayMenu:
		mov al, 1
		mov menuPrinted,al
		mov eax, lightCyan + (lightCyan * 16)
		call SetTextColor
		call clrscr
		INVOKE FlappyBox, white + (white * 16)

		
		call writeString
		call selected1
		call selected2
		call selected3
		call selecting

	selected1:
		MOV EAX,0
		mov al, 24
		.while al < 27
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, black + (black * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, white + (black * 16)
		call SetTextColor
		mgotoxy 10,25
		mov edx, offset selection1
		call writestring
		ret

	selected2:
		MOV EAX,0
		mov al, 27
		.while al < 30
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, black + (black * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, white + (black * 16)
		call SetTextColor
		mgotoxy 10,28
		mov edx, offset selection2
		call writestring
		ret

	selected3:
		MOV EAX,0
		mov al, 30
		.while al < 33
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, black + (black * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, white + (black * 16)
		call SetTextColor
		mgotoxy 10,31 
		mov edx, offset selection3
		call writestring
		ret
	
	selected1A:
		MOV EAX,0
		mov al, 24
		.while al < 27
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, white + (white * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, black + (white * 16)
		call SetTextColor
		mgotoxy 10,25
		mov edx, offset selection1
		call writestring
		ret

	selected2A:
		MOV EAX,0
		mov al, 27
		.while al < 30
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, white + (white * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, black + (white * 16)
		call SetTextColor
		mgotoxy 10,28
		mov edx, offset selection2
		call writestring
		ret

	selected3A:
		MOV EAX,0
		mov al, 30
		.while al < 33
			mov ah, 8
			.while ah < 22
				push eax
				INVOKE DrawPixel, ah, al, white + (white * 16)
				pop eax
				inc ah
			.endw
			inc al
		.endW
		mov eax, black + (white * 16)
		call SetTextColor
		mgotoxy 10,31
		mov edx, offset selection3
		call writestring
		ret

	selecting:
		.IF SELECTED == 1
			mov eax, 250
			call delay
			call selected1A
			mov eax, 250
			call delay
			call selected1
		.ELSEIF SELECTED == 2
			mov eax, 250
			call delay
			call selected2A
			mov eax, 250
			call delay
			call selected2
		.ELSEIF SELECTED == 3
			mov eax, 250
			call delay
			call selected3A
			mov eax, 250
			call delay
			call selected3
		.ENDIF
		call dataIn
		jmp selecting

	DOWNSELECTED:
		.if selected == 3
		ret
		.endif
		MOV al, SELECTED
		INC al
		MOV SELECTED, al
		ret

	UPSELECTED:
		.if selected == 1 
		ret
		.endif
		MOV al, SELECTED
		dec al
		MOV SELECTED, al
		ret

	dataIn:
		mov dx, 0
		call readkey
		.if menuPrinted == 0
			jmp displayMenu
		.endif
		.if dx == VK_SPACE
			mov al,0
			mov menuPrinted, al
			.if selected == 1
				INVOKE Game
			.elseif selected == 2
				ret
			.elseif selected == 3
				ret
			.endif
		.elseif dx == 'W'
			jmp upselected
		.elseif dx == 'S'
			jmp downselected
		.endif
		jmp selecting
menu ENDP
FlappyBox PROC C color:dword
	INVOKE DrawPixel, 1, 10, color
	INVOKE DrawPixel, 2, 10, color
	INVOKE DrawPixel, 3, 10, color
	INVOKE DrawPixel, 1, 11, color
	INVOKE DrawPixel, 2, 12, color
	INVOKE DrawPixel, 1, 12, color
	INVOKE DrawPixel, 1, 13, color

	INVOKE DrawPixel, 5, 10, color
	INVOKE DrawPixel, 5, 11, color
	INVOKE DrawPixel, 5, 12, color
	INVOKE DrawPixel, 5, 13, color
	INVOKE DrawPixel, 6, 13, color 
	INVOKE DrawPixel, 7, 13, color

	INVOKE DrawPixel, 9, 13, color
	INVOKE DrawPixel, 9, 12, color
	INVOKE DrawPixel, 9, 11, color
	INVOKE DrawPixel, 10, 10, color
	INVOKE DrawPixel, 10, 12, color
	INVOKE DrawPixel, 11, 10, color
	INVOKE DrawPixel, 11, 12, color
	INVOKE DrawPixel, 12, 11, color
	INVOKE DrawPixel, 12, 12, color
	INVOKE DrawPixel, 12, 13, color

	INVOKE DrawPixel, 14, 10, color
	INVOKE DrawPixel, 14, 11, color
	INVOKE DrawPixel, 14, 12, color
	INVOKE DrawPixel, 14, 13, color
	INVOKE DrawPixel, 15, 10, color
	INVOKE DrawPixel, 16, 10, color
	INVOKE DrawPixel, 17, 11, color
	INVOKE DrawPixel, 16, 12, color
	INVOKE DrawPixel, 15, 12, color


	INVOKE DrawPixel, 19, 10, color
	INVOKE DrawPixel, 19, 11, color
	INVOKE DrawPixel, 19, 12, color
	INVOKE DrawPixel, 19, 13, color
	INVOKE DrawPixel, 20, 10, color
	INVOKE DrawPixel, 21, 10, color
	INVOKE DrawPixel, 22, 11, color
	INVOKE DrawPixel, 21, 12, color
	INVOKE DrawPixel, 20, 12, color


	INVOKE DrawPixel, 24, 10, color
	INVOKE DrawPixel, 25, 11, color
	INVOKE DrawPixel, 26, 12, color
	INVOKE DrawPixel, 26, 13, color
	INVOKE DrawPixel, 28, 10, color
	INVOKE DrawPixel, 27, 11, color


	INVOKE DrawPixel, 7, 16, color
	INVOKE DrawPixel, 7, 17, color
	INVOKE DrawPixel, 7, 18, color
	INVOKE DrawPixel, 7, 19, color
	INVOKE DrawPixel, 7, 20, color
	INVOKE DrawPixel, 8, 16, color
	INVOKE DrawPixel, 9, 16, color
	INVOKE DrawPixel, 10, 17, color
	INVOKE DrawPixel, 9, 18, color
	INVOKE DrawPixel, 8, 18, color
	INVOKE DrawPixel, 10, 19, color
	INVOKE DrawPixel, 9, 20, color
	INVOKE DrawPixel, 8, 20, color


	INVOKE DrawPixel, 12, 17, color
	INVOKE DrawPixel, 12, 18, color
	INVOKE DrawPixel, 12, 19, color
	INVOKE DrawPixel, 13, 16, color
	INVOKE DrawPixel, 14, 16, color

	INVOKE DrawPixel, 13, 20, color
	INVOKE DrawPixel, 14, 20, color
	INVOKE DrawPixel, 15, 17, color
	INVOKE DrawPixel, 15, 18, color
	INVOKE DrawPixel, 15, 19, color

	INVOKE DrawPixel, 17, 16, color
	INVOKE DrawPixel, 17, 20, color
	INVOKE DrawPixel, 18, 17, color
	INVOKE DrawPixel, 18, 19, color
	INVOKE DrawPixel, 19, 18, color
	INVOKE DrawPixel, 21, 16, color
	INVOKE DrawPixel, 21, 20, color
	INVOKE DrawPixel, 20, 17, color
	INVOKE DrawPixel, 20, 19, color

	ret

FlappyBox ENDP
	END 