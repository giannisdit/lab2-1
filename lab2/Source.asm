TITLE Expression calculator 
INCLUDE Irvine32.inc

.data
mCalculating	BYTE	"Calculating...",0dh,0ah,0
mAccessElement	BYTE	"The value of the element a[2,2] is:",0
mResultSum		BYTE	"The sum a[2,2]+z= ;",0
mResultDiff		BYTE	"The sum a[2,2]-z= ;",0
array1 SDWORD 00d,10d,20d,30d
ElementPerRow = ($ - array1)/TYPE array1
	   SDWORD 01d,11d,21d,31d
	   SDWORD 02d,12d,22d,32d
	   SDWORD 03d,13d,23d,33d
x bYTE	2d
y BYTE	2d
z SWORD	-30d 

.code
main PROC
		; ASKISI 1
	mov edx, OFFSET mCalculating
	call WriteString
	movzx	ebx,x
	shl		ebx,2
	movzx	ecx,y
	add		ebx,ecx
	shl		ebx,2
	mov		eax,[array1+ebx]
	mov		edx,OFFSET mAccessElement
	call	WriteString
	call	WriteInt
	call	Crlf

	movsx	ecx,z
	add		eax,ecx
	mov		edx,OFFSET mResultSum
	call	WriteString
	call	WriteInt
	call	Crlf

	mov		eax,[array1+ebx]
	sub		eax,ecx
	mov		edx,OFFSET mResultDiff
	call	WriteString
	call	WriteInt
	call	Crlf

		; ASKISI 2


	exit
main ENDP
END main