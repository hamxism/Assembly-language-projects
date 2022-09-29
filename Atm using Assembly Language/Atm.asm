
include emu8086.inc
org 100h

.data
main_menu DB 0dh,0ah,'........ATM....... ',0dh,0ah,0dh,0ah
          DB "Input 1 to Withdraw the amount... ",0dh,0ah
          DB "Input 2 for checking the total Balance.. ",0dh,0ah
          DB "Input 3 to Close the ATM",0dh,0ah
          DB "Enter your choice: ",'$'
                              
p      dw 5000  
q      dw 0

.code 
 

main proc


start: 
mov ah,09h
mov dx,offset main_menu
int 21h
mov ah,1h
int 21h
 
cmp al,'1'
je call w_d


cmp al,'2'
je call t_b        

cmp al,'3'
je call P_END           


main endp

w_d proc
     
print 10
print 13   

print 'Enter the amount you want to withdraw:'
call scan_num
mov q,cx     

print 10
print 13  

  
mov bx,q  
mov ax,p   
sub ax,bx 
print 'Remaining amount is: '
call print_num      
mov p,ax   
print 10
print 13
jmp start   
w_d endp          
 
t_b proc 
mov ax,p 
print 10
print 13  
print 'The total Amount =  ' 
call print_num         
print 10
print 13

jmp start   
t_b endp
  
P_END proc  
ret main
P_END endp                     
define_print_num
define_print_num_uns
define_scan_num
end

