includelib kernel32.lib

includelib msvcrt.lib

ExitProcess  proto

.data
       string byte "123",0
       buffer byte 0; write to this buffer, the result be 123 as integer
.code

 

    main proc
        ; rax = result
        ; rcx = indexed string
        ; rdx = i

    xor rax, rax
    mov rdx, offset string
    mov rcx, 0

    loop_start:

        mov bl,byte ptr[ rdx+rcx] ;string indexing

        ;cl lower 8 bits of rcx
        cmp bl, 0

        jz loop_end

                imul rax, 10

                ;lea rax, [rax * 10]
                lea rax, [rax+rbx-'0'] ; combines a bunch of instructions into one!
                ;although it is often used for pointer indexing, it can be used for arithmatic!
                ;and is faster than doing individual instructions!
                ;multiplication only works on immidiate values though
                inc rcx
        jmp loop_start
    loop_end:
    mov rcx, 1 ; sucessfull termination
    call ExitProcess
    ret
    main endp
    end

