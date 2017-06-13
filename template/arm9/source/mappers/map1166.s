@---------------------------------------------------------------------------------
.section .text,"ax"
@---------------------------------------------------------------------------------
	#include "equates.h"
@---------------------------------------------------------------------------------
	.global mapper11init
	.global mapper66init
@---------------------------------------------------------------------------------
mapper11init:
@---------------------------------------------------------------------------------
	.word write11,write11,write11,write11
	mov pc,lr
@---------------------------------------------------------------------------------
mapper66init:
@---------------------------------------------------------------------------------
	.word write66,write66,write66,write66

	ldr r1,mapper66init
	str_ r1,writemem_tbl+12

	ldrb_ r0,cartflags
	orr r0,r0,#MIRROR
	strb r0,[r1]

	mov pc,lr
@---------------------------------------------------------------------------------
write11:
@---------------------------------------------------------------------------------
	stmfd sp!,{r0,lr}
	bl map89ABCDEF_
	ldmfd sp!,{r0,lr}
	mov r0,r0,lsr#4
	b chr01234567_
@---------------------------------------------------------------------------------
write66:
@---------------------------------------------------------------------------------
	stmfd sp!,{r0,lr}
	bl chr01234567_
	ldmfd sp!,{r0,lr}
	mov r0,r0,lsr#4
	b map89ABCDEF_
@---------------------------------------------------------------------------------
