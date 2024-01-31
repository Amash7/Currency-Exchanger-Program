dosseg
.model small
.stack 100h
.data
str db "-----Welcome to Currency Exchange-----$"

;strings for after priting
pkr1 db "Amount of USD in PKR:$"
pkr2 db "Amount of CAD in PKR:$"
pkr3 db "Amount of AUD in PKR:$"
pkr4 db "Amount of POUNDS in PKR:$"
pkr5 db "Amount of INR in PKR:$"
pkr6 db "Amount of YUAN in PKR:$"
pkr7 db "Amount of YEN in PKR:$"
pkr8 db "Amount of WAN in PKR:$"
pkr9 db "Amount of LIRA in PKR:$"
pkr10 db "Amount of RIYALS in PKR:$"

;strings for menu
usa db "-----1)Amount in US Dollars-----$"
canada db "-----2)Amount in CANADIAN Dollars-----$"
australia db "-----3)Amount in AUSTRALIAN Dollars-----$"
england db "-----4)Amount in UK POUNDS-----$"
india db "-----5)Amount in INDIAN RUPEE-----$"
china db "-----6)Amount in CHINESE YUAN-----$"
japan db "-----7)Amount in JAPANESE YEN-----$"
korea db "-----8)Amount in KOREAN WAN-----$"
turkey db "-----9)Amount in TURKISH LIRA-----$"
saudi db "-----10)Amount in SAUDI RIYALS-----$"
choice db "-----CHOICE:-----$"

.code
main proc

mov ax,@data
mov ds,ax

;calling menu driven strings
mov dx, offset str
call string
mov dx, offset usa
call string
mov dx, offset canada
call string
mov dx, offset australia
call string
mov dx, offset england
call string
mov dx, offset india
call string
mov dx, offset china
call string
mov dx, offset japan
call string
mov dx, offset korea
call string
mov dx, offset turkey
call string
mov dx, offset saudi
call string
mov dx, offset choice
call string

;choice input
mov ah, 1
int 21h
mov bl, al

;comparisons
cmp bl,'1'
je L1
mov bl, al
cmp bl,'2'
je L2
cmp bl,'3'
je L3
cmp bl,'4'
je L4
cmp bl,'5'
je L5
cmp bl,'6'
je L6
cmp bl,'7'
je L7
cmp bl,'8'
je L8
cmp bl,'9'
je L9

;all the labels
L1:
      mov dx, offset pkr1
      call string
      call multiply
      jmp skip
L2:
      mov dx, offset pkr2
      call string
      call multiply
      jmp skip
L3:
      mov dx, offset pkr3
      call string
      call multiply
      jmp skip
L4:
      mov dx, offset pkr4
      call string
      call multiply
      jmp skip
L5:
      mov dx, offset pkr5
      call string
      call multiply
      jmp skip
L6:
      mov dx, offset pkr6
      call string
      call multiply
      jmp skip
L7:
      mov dx, offset pkr7
      call string
      call multiply
      jmp skip
L8:
      mov dx, offset pkr8
      call string
      call multiply
      jmp skip
L9:
      mov dx, offset pkr9
      call string
      call multiply
      jmp skip
L10:
      mov dx, offset pkr10
      call string
      call multiply
      jmp skip

;skip label to exit
skip:

mov ah,4ch
int 21h

main endp

;multiplicaton procedure
multiply proc
mov ax,5
mov bx,5 
mul bl   
;ASCII ADJUSTMENT FOR MULTIPLICATION
aam       
mov ch,ah
mov cl,al
mov dl,ch 
add dl,48 
mov ah,2  
int 21h
mov dl,cl
add dl,48
mov ah,2
int 21h
mov ah,4ch
int 21h
ret

;string procedure
string proc
mov ah,9
int 21h
call print
ret

;print procedure
print proc
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
ret

end main
