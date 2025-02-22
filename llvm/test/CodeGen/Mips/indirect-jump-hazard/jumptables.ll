; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  < %s -mtriple=mips-mti-linux-gnu -relocation-model=static \
; RUN:   -mips-tail-calls=1 -mcpu=mips32r2 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=MIPS32R2
; RUN: llc  < %s -mtriple=mips-img-linux-gnu -relocation-model=static \
; RUN:   -mips-tail-calls=1 -mcpu=mips32r6 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=MIPS32R6
; RUN: llc  < %s -mtriple=mips64-mti-linux-gnu -relocation-model=static \
; RUN:   -mips-tail-calls=1 -mcpu=mips64r2 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=MIPS64R2
; RUN: llc  < %s -mtriple=mips64-img-linux-gnu -relocation-model=static \
; RUN:   -mips-tail-calls=1 -mcpu=mips64r6 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=MIPS64R6

; RUN: llc  < %s -mtriple=mips-mti-linux-gnu -relocation-model=pic \
; RUN:   -mips-tail-calls=1 -mcpu=mips32r2 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=PIC-MIPS32R2
; RUN: llc  < %s -mtriple=mips-img-linux-gnu -relocation-model=pic \
; RUN:   -mips-tail-calls=1 -mcpu=mips32r6 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=PIC-MIPS32R6
; RUN: llc  < %s -mtriple=mips64-mti-linux-gnu -relocation-model=pic \
; RUN:   -mips-tail-calls=1 -mcpu=mips64r2 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=PIC-MIPS64R2
; RUN: llc  < %s -mtriple=mips64-img-linux-gnu -relocation-model=pic \
; RUN:   -mips-tail-calls=1 -mcpu=mips64r6 -mattr=+use-indirect-jump-hazard \
; RUN:   -verify-machineinstrs | FileCheck %s --check-prefix=PIC-MIPS64R6

@.str = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.7 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define ptr @_Z3fooi(i32 signext %Letter) {
; MIPS32R2-LABEL: _Z3fooi:
; MIPS32R2:       # %bb.0: # %entry
; MIPS32R2-NEXT:    addiu $sp, $sp, -16
; MIPS32R2-NEXT:    .cfi_def_cfa_offset 16
; MIPS32R2-NEXT:    sltiu $1, $4, 7
; MIPS32R2-NEXT:    beqz $1, $BB0_6
; MIPS32R2-NEXT:    sw $4, 4($sp)
; MIPS32R2-NEXT:  # %bb.1: # %entry
; MIPS32R2-NEXT:    sll $1, $4, 2
; MIPS32R2-NEXT:    lui $2, %hi($JTI0_0)
; MIPS32R2-NEXT:    addu $1, $1, $2
; MIPS32R2-NEXT:    lw $1, %lo($JTI0_0)($1)
; MIPS32R2-NEXT:    jr.hb $1
; MIPS32R2-NEXT:    nop
; MIPS32R2-NEXT:  $BB0_2: # %sw.bb
; MIPS32R2-NEXT:    lui $1, %hi($.str)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_3: # %sw.bb4
; MIPS32R2-NEXT:    lui $1, %hi($.str.4)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.4)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_4: # %sw.bb2
; MIPS32R2-NEXT:    lui $1, %hi($.str.2)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.2)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_5: # %sw.bb3
; MIPS32R2-NEXT:    lui $1, %hi($.str.3)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.3)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_6: # %sw.epilog
; MIPS32R2-NEXT:    lui $1, %hi($.str.7)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.7)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_7: # %sw.bb1
; MIPS32R2-NEXT:    lui $1, %hi($.str.1)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.1)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_8: # %sw.bb5
; MIPS32R2-NEXT:    lui $1, %hi($.str.5)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.5)
; MIPS32R2-NEXT:    j $BB0_10
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_9: # %sw.bb6
; MIPS32R2-NEXT:    lui $1, %hi($.str.6)
; MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.6)
; MIPS32R2-NEXT:    sw $1, 8($sp)
; MIPS32R2-NEXT:  $BB0_10: # %return
; MIPS32R2-NEXT:    lw $2, 8($sp)
; MIPS32R2-NEXT:    jr $ra
; MIPS32R2-NEXT:    addiu $sp, $sp, 16
;
; MIPS32R6-LABEL: _Z3fooi:
; MIPS32R6:       # %bb.0: # %entry
; MIPS32R6-NEXT:    addiu $sp, $sp, -16
; MIPS32R6-NEXT:    .cfi_def_cfa_offset 16
; MIPS32R6-NEXT:    sltiu $1, $4, 7
; MIPS32R6-NEXT:    beqz $1, $BB0_6
; MIPS32R6-NEXT:    sw $4, 4($sp)
; MIPS32R6-NEXT:  # %bb.1: # %entry
; MIPS32R6-NEXT:    sll $1, $4, 2
; MIPS32R6-NEXT:    lui $2, %hi($JTI0_0)
; MIPS32R6-NEXT:    addu $1, $1, $2
; MIPS32R6-NEXT:    lw $1, %lo($JTI0_0)($1)
; MIPS32R6-NEXT:    jr.hb $1
; MIPS32R6-NEXT:    nop
; MIPS32R6-NEXT:  $BB0_2: # %sw.bb
; MIPS32R6-NEXT:    lui $1, %hi($.str)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_3: # %sw.bb4
; MIPS32R6-NEXT:    lui $1, %hi($.str.4)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.4)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_4: # %sw.bb2
; MIPS32R6-NEXT:    lui $1, %hi($.str.2)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.2)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_5: # %sw.bb3
; MIPS32R6-NEXT:    lui $1, %hi($.str.3)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.3)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_6: # %sw.epilog
; MIPS32R6-NEXT:    lui $1, %hi($.str.7)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.7)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_7: # %sw.bb1
; MIPS32R6-NEXT:    lui $1, %hi($.str.1)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.1)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_8: # %sw.bb5
; MIPS32R6-NEXT:    lui $1, %hi($.str.5)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.5)
; MIPS32R6-NEXT:    j $BB0_10
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_9: # %sw.bb6
; MIPS32R6-NEXT:    lui $1, %hi($.str.6)
; MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.6)
; MIPS32R6-NEXT:    sw $1, 8($sp)
; MIPS32R6-NEXT:  $BB0_10: # %return
; MIPS32R6-NEXT:    lw $2, 8($sp)
; MIPS32R6-NEXT:    jr $ra
; MIPS32R6-NEXT:    addiu $sp, $sp, 16
;
; MIPS64R2-LABEL: _Z3fooi:
; MIPS64R2:       # %bb.0: # %entry
; MIPS64R2-NEXT:    daddiu $sp, $sp, -16
; MIPS64R2-NEXT:    .cfi_def_cfa_offset 16
; MIPS64R2-NEXT:    dext $2, $4, 0, 32
; MIPS64R2-NEXT:    sltiu $1, $2, 7
; MIPS64R2-NEXT:    beqz $1, .LBB0_6
; MIPS64R2-NEXT:    sw $4, 4($sp)
; MIPS64R2-NEXT:  # %bb.1: # %entry
; MIPS64R2-NEXT:    dsll $1, $2, 3
; MIPS64R2-NEXT:    lui $2, %highest(.LJTI0_0)
; MIPS64R2-NEXT:    daddiu $2, $2, %higher(.LJTI0_0)
; MIPS64R2-NEXT:    dsll $2, $2, 16
; MIPS64R2-NEXT:    daddiu $2, $2, %hi(.LJTI0_0)
; MIPS64R2-NEXT:    dsll $2, $2, 16
; MIPS64R2-NEXT:    daddu $1, $1, $2
; MIPS64R2-NEXT:    ld $1, %lo(.LJTI0_0)($1)
; MIPS64R2-NEXT:    jr.hb $1
; MIPS64R2-NEXT:    nop
; MIPS64R2-NEXT:  .LBB0_2: # %sw.bb
; MIPS64R2-NEXT:    lui $1, %highest(.L.str)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_3: # %sw.bb4
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.4)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.4)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.4)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.4)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_4: # %sw.bb2
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.2)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.2)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.2)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.2)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_5: # %sw.bb3
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.3)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.3)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.3)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.3)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_6: # %sw.epilog
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.7)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.7)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.7)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.7)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_7: # %sw.bb1
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.1)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.1)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.1)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.1)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_8: # %sw.bb5
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.5)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.5)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.5)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.5)
; MIPS64R2-NEXT:    j .LBB0_10
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_9: # %sw.bb6
; MIPS64R2-NEXT:    lui $1, %highest(.L.str.6)
; MIPS64R2-NEXT:    daddiu $1, $1, %higher(.L.str.6)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %hi(.L.str.6)
; MIPS64R2-NEXT:    dsll $1, $1, 16
; MIPS64R2-NEXT:    daddiu $1, $1, %lo(.L.str.6)
; MIPS64R2-NEXT:    sd $1, 8($sp)
; MIPS64R2-NEXT:  .LBB0_10: # %return
; MIPS64R2-NEXT:    ld $2, 8($sp)
; MIPS64R2-NEXT:    jr $ra
; MIPS64R2-NEXT:    daddiu $sp, $sp, 16
;
; MIPS64R6-LABEL: _Z3fooi:
; MIPS64R6:       # %bb.0: # %entry
; MIPS64R6-NEXT:    daddiu $sp, $sp, -16
; MIPS64R6-NEXT:    .cfi_def_cfa_offset 16
; MIPS64R6-NEXT:    dext $2, $4, 0, 32
; MIPS64R6-NEXT:    sltiu $1, $2, 7
; MIPS64R6-NEXT:    beqz $1, .LBB0_6
; MIPS64R6-NEXT:    sw $4, 4($sp)
; MIPS64R6-NEXT:  # %bb.1: # %entry
; MIPS64R6-NEXT:    dsll $1, $2, 3
; MIPS64R6-NEXT:    lui $2, %highest(.LJTI0_0)
; MIPS64R6-NEXT:    daddiu $2, $2, %higher(.LJTI0_0)
; MIPS64R6-NEXT:    dsll $2, $2, 16
; MIPS64R6-NEXT:    daddiu $2, $2, %hi(.LJTI0_0)
; MIPS64R6-NEXT:    dsll $2, $2, 16
; MIPS64R6-NEXT:    daddu $1, $1, $2
; MIPS64R6-NEXT:    ld $1, %lo(.LJTI0_0)($1)
; MIPS64R6-NEXT:    jr.hb $1
; MIPS64R6-NEXT:    nop
; MIPS64R6-NEXT:  .LBB0_2: # %sw.bb
; MIPS64R6-NEXT:    lui $1, %highest(.L.str)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_3: # %sw.bb4
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.4)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.4)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.4)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.4)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_4: # %sw.bb2
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.2)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.2)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.2)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.2)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_5: # %sw.bb3
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.3)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.3)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.3)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.3)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_6: # %sw.epilog
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.7)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.7)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.7)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.7)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_7: # %sw.bb1
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.1)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.1)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.1)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.1)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_8: # %sw.bb5
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.5)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.5)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.5)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.5)
; MIPS64R6-NEXT:    j .LBB0_10
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_9: # %sw.bb6
; MIPS64R6-NEXT:    lui $1, %highest(.L.str.6)
; MIPS64R6-NEXT:    daddiu $1, $1, %higher(.L.str.6)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %hi(.L.str.6)
; MIPS64R6-NEXT:    dsll $1, $1, 16
; MIPS64R6-NEXT:    daddiu $1, $1, %lo(.L.str.6)
; MIPS64R6-NEXT:    sd $1, 8($sp)
; MIPS64R6-NEXT:  .LBB0_10: # %return
; MIPS64R6-NEXT:    ld $2, 8($sp)
; MIPS64R6-NEXT:    jr $ra
; MIPS64R6-NEXT:    daddiu $sp, $sp, 16
;
; PIC-MIPS32R2-LABEL: _Z3fooi:
; PIC-MIPS32R2:       # %bb.0: # %entry
; PIC-MIPS32R2-NEXT:    lui $2, %hi(_gp_disp)
; PIC-MIPS32R2-NEXT:    addiu $2, $2, %lo(_gp_disp)
; PIC-MIPS32R2-NEXT:    addiu $sp, $sp, -16
; PIC-MIPS32R2-NEXT:    .cfi_def_cfa_offset 16
; PIC-MIPS32R2-NEXT:    addu $2, $2, $25
; PIC-MIPS32R2-NEXT:    sltiu $1, $4, 7
; PIC-MIPS32R2-NEXT:    beqz $1, $BB0_6
; PIC-MIPS32R2-NEXT:    sw $4, 4($sp)
; PIC-MIPS32R2-NEXT:  # %bb.1: # %entry
; PIC-MIPS32R2-NEXT:    sll $1, $4, 2
; PIC-MIPS32R2-NEXT:    lw $3, %got($JTI0_0)($2)
; PIC-MIPS32R2-NEXT:    addu $1, $1, $3
; PIC-MIPS32R2-NEXT:    lw $1, %lo($JTI0_0)($1)
; PIC-MIPS32R2-NEXT:    addu $1, $2, $1
; PIC-MIPS32R2-NEXT:    jr.hb $1
; PIC-MIPS32R2-NEXT:    nop
; PIC-MIPS32R2-NEXT:  $BB0_2: # %sw.bb
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_3: # %sw.bb4
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.4)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.4)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_4: # %sw.bb2
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.2)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.2)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_5: # %sw.bb3
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.3)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.3)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_6: # %sw.epilog
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.7)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.7)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_7: # %sw.bb1
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.1)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.1)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_8: # %sw.bb5
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.5)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.5)
; PIC-MIPS32R2-NEXT:    b $BB0_10
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_9: # %sw.bb6
; PIC-MIPS32R2-NEXT:    lw $1, %got($.str.6)($2)
; PIC-MIPS32R2-NEXT:    addiu $1, $1, %lo($.str.6)
; PIC-MIPS32R2-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R2-NEXT:  $BB0_10: # %return
; PIC-MIPS32R2-NEXT:    lw $2, 8($sp)
; PIC-MIPS32R2-NEXT:    jr $ra
; PIC-MIPS32R2-NEXT:    addiu $sp, $sp, 16
;
; PIC-MIPS32R6-LABEL: _Z3fooi:
; PIC-MIPS32R6:       # %bb.0: # %entry
; PIC-MIPS32R6-NEXT:    lui $2, %hi(_gp_disp)
; PIC-MIPS32R6-NEXT:    addiu $2, $2, %lo(_gp_disp)
; PIC-MIPS32R6-NEXT:    addiu $sp, $sp, -16
; PIC-MIPS32R6-NEXT:    .cfi_def_cfa_offset 16
; PIC-MIPS32R6-NEXT:    addu $2, $2, $25
; PIC-MIPS32R6-NEXT:    sltiu $1, $4, 7
; PIC-MIPS32R6-NEXT:    beqz $1, $BB0_6
; PIC-MIPS32R6-NEXT:    sw $4, 4($sp)
; PIC-MIPS32R6-NEXT:  # %bb.1: # %entry
; PIC-MIPS32R6-NEXT:    sll $1, $4, 2
; PIC-MIPS32R6-NEXT:    lw $3, %got($JTI0_0)($2)
; PIC-MIPS32R6-NEXT:    addu $1, $1, $3
; PIC-MIPS32R6-NEXT:    lw $1, %lo($JTI0_0)($1)
; PIC-MIPS32R6-NEXT:    addu $1, $2, $1
; PIC-MIPS32R6-NEXT:    jr.hb $1
; PIC-MIPS32R6-NEXT:    nop
; PIC-MIPS32R6-NEXT:  $BB0_2: # %sw.bb
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_3: # %sw.bb4
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.4)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.4)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_4: # %sw.bb2
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.2)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.2)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_5: # %sw.bb3
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.3)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.3)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_6: # %sw.epilog
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.7)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.7)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_7: # %sw.bb1
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.1)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.1)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_8: # %sw.bb5
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.5)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.5)
; PIC-MIPS32R6-NEXT:    b $BB0_10
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_9: # %sw.bb6
; PIC-MIPS32R6-NEXT:    lw $1, %got($.str.6)($2)
; PIC-MIPS32R6-NEXT:    addiu $1, $1, %lo($.str.6)
; PIC-MIPS32R6-NEXT:    sw $1, 8($sp)
; PIC-MIPS32R6-NEXT:  $BB0_10: # %return
; PIC-MIPS32R6-NEXT:    lw $2, 8($sp)
; PIC-MIPS32R6-NEXT:    jr $ra
; PIC-MIPS32R6-NEXT:    addiu $sp, $sp, 16
;
; PIC-MIPS64R2-LABEL: _Z3fooi:
; PIC-MIPS64R2:       # %bb.0: # %entry
; PIC-MIPS64R2-NEXT:    daddiu $sp, $sp, -16
; PIC-MIPS64R2-NEXT:    .cfi_def_cfa_offset 16
; PIC-MIPS64R2-NEXT:    lui $1, %hi(%neg(%gp_rel(_Z3fooi)))
; PIC-MIPS64R2-NEXT:    daddu $1, $1, $25
; PIC-MIPS64R2-NEXT:    daddiu $2, $1, %lo(%neg(%gp_rel(_Z3fooi)))
; PIC-MIPS64R2-NEXT:    dext $3, $4, 0, 32
; PIC-MIPS64R2-NEXT:    sltiu $1, $3, 7
; PIC-MIPS64R2-NEXT:    beqz $1, .LBB0_6
; PIC-MIPS64R2-NEXT:    sw $4, 4($sp)
; PIC-MIPS64R2-NEXT:  # %bb.1: # %entry
; PIC-MIPS64R2-NEXT:    dsll $1, $3, 3
; PIC-MIPS64R2-NEXT:    ld $3, %got_page(.LJTI0_0)($2)
; PIC-MIPS64R2-NEXT:    daddu $1, $1, $3
; PIC-MIPS64R2-NEXT:    ld $1, %got_ofst(.LJTI0_0)($1)
; PIC-MIPS64R2-NEXT:    daddu $1, $2, $1
; PIC-MIPS64R2-NEXT:    jr.hb $1
; PIC-MIPS64R2-NEXT:    nop
; PIC-MIPS64R2-NEXT:  .LBB0_2: # %sw.bb
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_3: # %sw.bb4
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.4)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.4)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_4: # %sw.bb2
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.2)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.2)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_5: # %sw.bb3
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.3)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.3)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_6: # %sw.epilog
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.7)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.7)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_7: # %sw.bb1
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.1)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.1)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_8: # %sw.bb5
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.5)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.5)
; PIC-MIPS64R2-NEXT:    b .LBB0_10
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_9: # %sw.bb6
; PIC-MIPS64R2-NEXT:    ld $1, %got_page(.L.str.6)($2)
; PIC-MIPS64R2-NEXT:    daddiu $1, $1, %got_ofst(.L.str.6)
; PIC-MIPS64R2-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R2-NEXT:  .LBB0_10: # %return
; PIC-MIPS64R2-NEXT:    ld $2, 8($sp)
; PIC-MIPS64R2-NEXT:    jr $ra
; PIC-MIPS64R2-NEXT:    daddiu $sp, $sp, 16
;
; PIC-MIPS64R6-LABEL: _Z3fooi:
; PIC-MIPS64R6:       # %bb.0: # %entry
; PIC-MIPS64R6-NEXT:    daddiu $sp, $sp, -16
; PIC-MIPS64R6-NEXT:    .cfi_def_cfa_offset 16
; PIC-MIPS64R6-NEXT:    lui $1, %hi(%neg(%gp_rel(_Z3fooi)))
; PIC-MIPS64R6-NEXT:    daddu $1, $1, $25
; PIC-MIPS64R6-NEXT:    daddiu $2, $1, %lo(%neg(%gp_rel(_Z3fooi)))
; PIC-MIPS64R6-NEXT:    dext $3, $4, 0, 32
; PIC-MIPS64R6-NEXT:    sltiu $1, $3, 7
; PIC-MIPS64R6-NEXT:    beqz $1, .LBB0_6
; PIC-MIPS64R6-NEXT:    sw $4, 4($sp)
; PIC-MIPS64R6-NEXT:  # %bb.1: # %entry
; PIC-MIPS64R6-NEXT:    dsll $1, $3, 3
; PIC-MIPS64R6-NEXT:    ld $3, %got_page(.LJTI0_0)($2)
; PIC-MIPS64R6-NEXT:    daddu $1, $1, $3
; PIC-MIPS64R6-NEXT:    ld $1, %got_ofst(.LJTI0_0)($1)
; PIC-MIPS64R6-NEXT:    daddu $1, $2, $1
; PIC-MIPS64R6-NEXT:    jr.hb $1
; PIC-MIPS64R6-NEXT:    nop
; PIC-MIPS64R6-NEXT:  .LBB0_2: # %sw.bb
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_3: # %sw.bb4
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.4)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.4)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_4: # %sw.bb2
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.2)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.2)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_5: # %sw.bb3
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.3)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.3)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_6: # %sw.epilog
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.7)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.7)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_7: # %sw.bb1
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.1)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.1)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_8: # %sw.bb5
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.5)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.5)
; PIC-MIPS64R6-NEXT:    b .LBB0_10
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_9: # %sw.bb6
; PIC-MIPS64R6-NEXT:    ld $1, %got_page(.L.str.6)($2)
; PIC-MIPS64R6-NEXT:    daddiu $1, $1, %got_ofst(.L.str.6)
; PIC-MIPS64R6-NEXT:    sd $1, 8($sp)
; PIC-MIPS64R6-NEXT:  .LBB0_10: # %return
; PIC-MIPS64R6-NEXT:    ld $2, 8($sp)
; PIC-MIPS64R6-NEXT:    jr $ra
; PIC-MIPS64R6-NEXT:    daddiu $sp, $sp, 16
entry:
  %retval = alloca ptr, align 8
  %Letter.addr = alloca i32, align 4
  store i32 %Letter, ptr %Letter.addr, align 4
  %0 = load i32, ptr %Letter.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
    i32 4, label %sw.bb4
    i32 5, label %sw.bb5
    i32 6, label %sw.bb6
  ]

sw.bb:
  store ptr @.str, ptr %retval, align 8
  br label %return

sw.bb1:
  store ptr @.str.1, ptr %retval, align 8
  br label %return

sw.bb2:
  store ptr @.str.2, ptr %retval, align 8
  br label %return

sw.bb3:
  store ptr @.str.3, ptr %retval, align 8
  br label %return

sw.bb4:
  store ptr @.str.4, ptr %retval, align 8
  br label %return

sw.bb5:
  store ptr @.str.5, ptr %retval, align 8
  br label %return

sw.bb6:
  store ptr @.str.6, ptr %retval, align 8
  br label %return

sw.epilog:
  store ptr @.str.7, ptr %retval, align 8
  br label %return

return:
  %1 = load ptr, ptr %retval, align 8
  ret ptr %1
}
