INCLUDE Irvine32.inc
INCLUDE MACROS.INC
 
.data
clearAnimation dword 50
animation dword 110

FlappyBox PROTO C
DrawPixel PROTO C, :BYTE, :BYTE, :DWORD
menu PROTO C
lose PROTO C
.code
lose proc C

	mov bh,0
	.while bh < 41
		mov bl,0
		mov eax, clearAnimation
		call delay
		.while bl < 31
			INVOKE DrawPixel, bl, bh, black + (black * 16)
			inc bl
		.endw
		inc bh
	.endw
	

	mov eax, animation
	call delay
	INVOKE DrawPixel, 3, 10, white + (white * 16)
	INVOKE DrawPixel, 4, 10, white + (white * 16)
	INVOKE DrawPixel, 5, 10, white + (white * 16)
	INVOKE DrawPixel, 6, 10, white + (white * 16)
	INVOKE DrawPixel, 11, 10, white + (white * 16)
	INVOKE DrawPixel, 15, 10, white + (white * 16)
	INVOKE DrawPixel, 16, 10, white + (white * 16)
	INVOKE DrawPixel, 20, 10, white + (white * 16)
	INVOKE DrawPixel, 21, 10, white + (white * 16)
	INVOKE DrawPixel, 23, 10, white + (white * 16)
	INVOKE DrawPixel, 24, 10, white + (white * 16)
	INVOKE DrawPixel, 25, 10, white + (white * 16)
	INVOKE DrawPixel, 26, 10, white + (white * 16)
	INVOKE DrawPixel, 27, 10, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 2, 11, white + (white * 16)
	INVOKE DrawPixel, 3, 11, white + (white * 16)
	INVOKE DrawPixel, 10, 11, white + (white * 16)
	INVOKE DrawPixel, 12, 11, white + (white * 16)
	INVOKE DrawPixel, 15, 11, white + (white * 16)
	INVOKE DrawPixel, 17, 11, white + (white * 16)
	INVOKE DrawPixel, 19, 11, white + (white * 16)
	INVOKE DrawPixel, 21, 11, white + (white * 16)
	INVOKE DrawPixel, 23, 11, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 2, 12, white + (white * 16)
	INVOKE DrawPixel, 5, 12, white + (white * 16)
	INVOKE DrawPixel, 6, 12, white + (white * 16)
	INVOKE DrawPixel, 7, 12, white + (white * 16)
	INVOKE DrawPixel, 9, 12, white + (white * 16)
	INVOKE DrawPixel, 13, 12, white + (white * 16)
	INVOKE DrawPixel, 15, 12, white + (white * 16)
	INVOKE DrawPixel, 18, 12, white + (white * 16)
	INVOKE DrawPixel, 21, 12, white + (white * 16)
	INVOKE DrawPixel, 23, 12, white + (white * 16)
	INVOKE DrawPixel, 24, 12, white + (white * 16)
	INVOKE DrawPixel, 25, 12, white + (white * 16)
	INVOKE DrawPixel, 26, 12, white + (white * 16)
	INVOKE DrawPixel, 27, 12, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 2, 13, white + (white * 16)
	INVOKE DrawPixel, 3, 13, white + (white * 16)
	INVOKE DrawPixel, 6, 13, white + (white * 16)
	INVOKE DrawPixel, 9, 13, white + (white * 16)
	INVOKE DrawPixel, 10, 13, white + (white * 16)
	INVOKE DrawPixel, 11, 13, white + (white * 16)
	INVOKE DrawPixel, 12, 13, white + (white * 16)
	INVOKE DrawPixel, 13, 13, white + (white * 16)
	INVOKE DrawPixel, 15, 13, white + (white * 16)
	INVOKE DrawPixel, 21, 13, white + (white * 16)
	INVOKE DrawPixel, 23, 13, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 3, 14, white + (white * 16)
	INVOKE DrawPixel, 4, 14, white + (white * 16)
	INVOKE DrawPixel, 5, 14, white + (white * 16)
	INVOKE DrawPixel, 6, 14, white + (white * 16)
	INVOKE DrawPixel, 9, 14, white + (white * 16)
	INVOKE DrawPixel, 13, 14, white + (white * 16)
	INVOKE DrawPixel, 15, 14, white + (white * 16)
	INVOKE DrawPixel, 21, 14, white + (white * 16)
	INVOKE DrawPixel, 23, 14, white + (white * 16)
	INVOKE DrawPixel, 24, 14, white + (white * 16)
	INVOKE DrawPixel, 25, 14, white + (white * 16)
	INVOKE DrawPixel, 26, 14, white + (white * 16)
	INVOKE DrawPixel, 27, 14, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 4, 16, white + (white * 16)
	INVOKE DrawPixel, 5, 16, white + (white * 16)
	INVOKE DrawPixel, 6, 16, white + (white * 16)
	INVOKE DrawPixel, 9, 16, white + (white * 16)
	INVOKE DrawPixel, 13, 16, white + (white * 16)
	INVOKE DrawPixel, 15, 16, white + (white * 16)
	INVOKE DrawPixel, 16, 16, white + (white * 16)
	INVOKE DrawPixel, 17, 16, white + (white * 16)
	INVOKE DrawPixel, 18, 16, white + (white * 16)
	INVOKE DrawPixel, 19, 16, white + (white * 16)
	INVOKE DrawPixel, 21, 16, white + (white * 16)
	INVOKE DrawPixel, 21, 16, white + (white * 16)
	INVOKE DrawPixel, 22, 16, white + (white * 16)
	INVOKE DrawPixel, 23, 16, white + (white * 16)
	INVOKE DrawPixel, 24, 16, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 3, 17, white + (white * 16)
	INVOKE DrawPixel, 7, 17, white + (white * 16)
	INVOKE DrawPixel, 9, 17, white + (white * 16)
	INVOKE DrawPixel, 13, 17, white + (white * 16)
	INVOKE DrawPixel, 15, 17, white + (white * 16)
	INVOKE DrawPixel, 21, 17, white + (white * 16)
	INVOKE DrawPixel, 25, 17, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 3, 18, white + (white * 16)
	INVOKE DrawPixel, 7, 18, white + (white * 16)
	INVOKE DrawPixel, 9, 18, white + (white * 16)
	INVOKE DrawPixel, 13, 18, white + (white * 16)
	INVOKE DrawPixel, 15, 18, white + (white * 16)
	INVOKE DrawPixel, 16, 18, white + (white * 16)
	INVOKE DrawPixel, 17, 18, white + (white * 16)
	INVOKE DrawPixel, 18, 18, white + (white * 16)
	INVOKE DrawPixel, 19, 18, white + (white * 16)
	INVOKE DrawPixel, 21, 18, white + (white * 16)
	INVOKE DrawPixel, 22, 18, white + (white * 16)
	INVOKE DrawPixel, 23, 18, white + (white * 16)
	INVOKE DrawPixel, 25, 18, white + (white * 16)
	INVOKE DrawPixel, 24, 18, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 3, 19, white + (white * 16)
	INVOKE DrawPixel, 7, 19, white + (white * 16)
	INVOKE DrawPixel, 10, 19, white + (white * 16)
	INVOKE DrawPixel, 12, 19, white + (white * 16)
	INVOKE DrawPixel, 15, 19, white + (white * 16)
	INVOKE DrawPixel, 19, 20, white + (white * 16)
	INVOKE DrawPixel, 21, 19, white + (white * 16)
	INVOKE DrawPixel, 24, 19, white + (white * 16)
	mov eax, animation
	call delay
	INVOKE DrawPixel, 4, 20, white + (white * 16)
	INVOKE DrawPixel, 5, 20, white + (white * 16)
	INVOKE DrawPixel, 6, 20, white + (white * 16)
	INVOKE DrawPixel, 11, 20, white + (white * 16)
	INVOKE DrawPixel, 15, 20, white + (white * 16)
	INVOKE DrawPixel, 16, 20, white + (white * 16)
	INVOKE DrawPixel, 17, 20, white + (white * 16)
	INVOKE DrawPixel, 18, 20, white + (white * 16)
	INVOKE DrawPixel, 21, 20, white + (white * 16)
	INVOKE DrawPixel, 25, 20, white + (white * 16)
	
	mgotoxy 2, 30
	call waitMsg
	ret
	;INVOKE menu
lose ENDP
END