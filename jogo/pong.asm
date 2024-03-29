# 512x512 || 4x4

.data 0x10000000
	bitmapDisplay: .word 0x10010000
	keyboard: .word 0xffff0000
	delayTime: .word 2000
	colorBlue: .word 0xff
	colorBlack: .word 0x0
	width: .word 128
 	height: .word 128
 	playerSize: .word 10
 	startPoint1: .word 63
 	startPoint2: .word 63
 	ballX: .word 63
 	ballY: .word 63
 	one: .word 1
 	zero: .word 0
.text
main:
	lw $10, bitmapDisplay
	lw $11, colorBlue
	lw $16, one
	lw $17, zero
	lw $19, keyboard
	lw $21, width
	lw $22, height
	lw $23, playerSize
	lw $26, startPoint1
	lw $27, startPoint2
	lw $28, ballX
	lw $29, ballY
	jal setup
	jal loop
	j end

setup:
	addi $7, $31, 0
	jal drawBorders
	jal drawPlayer1
	jal drawPlayer2
	jal drawBall
	addi $31, $7, 0
	jr $31
loop:
	lw $19, keyboard
	lw $19, 0($19)
	beq $19, 1, controlKeyboard
	jal controlBall
	jal moveBall
	jal delay
	j loop

controlKeyboard:
	addi $8, $31, 0
	lw $19, keyboard
	lw $19, 4($19)
	beq $19, 119, movePlayer1Up
	beq $19, 115, movePlayer1Down
	beq $19, 53, movePlayer2Up
	beq $19, 50, movePlayer2Down 
	addi $31, $8, 0	
	jr $31

movePlayer1Up:
	addi $7, $31, 0
	lw $11, colorBlack
	add $12, $26, $23
	add $13, $0, $0
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $26, $26, -1
	lw $11, colorBlue
	sub $12, $26, $23
	add $13, $0, $0
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $31, $7, 0	
	jr $31
	
movePlayer1Down:
	addi $7, $31, 0
	lw $11, colorBlack
	sub $12, $26, $23
	add $13, $0, $0
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $26, $26, 1
	lw $11, colorBlue
	add $12, $26, $23
	add $13, $0, $0
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $31, $7, 0	
	jr $31
	
movePlayer2Up:
	addi $7, $31, 0
	lw $11, colorBlack
	add $12, $27, $23
	subi $13, $21, 2
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $27, $27, -1
	lw $11, colorBlue
	sub $12, $27, $23
	subi $13, $21, 2
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $31, $7, 0	
	jr $31
	
movePlayer2Down:
	addi $7, $31, 0
	lw $11, colorBlack
	sub $12, $27, $23
	subi $13, $21, 2
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $27, $27, 1
	lw $11, colorBlue
	add $12, $27, $23
	subi $13, $21, 2
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $31, $7, 0	
	jr $31

delay:
	addi $9, $31, 0
	lw $20, delayTime
delaying:
	beq $20, $0, endDelay
	nop
	subi $20, $20, 1
	j delaying
endDelay:
	addi $31, $9, 0
	jr $31

drawBorders:
	addi $8, $31, 0
	addi $25, $22, -1

drawingBorders:
	beq $25, -1 , endDrawBorders
	addi $12, $0, 0
	add $13, $0, $25
	jal drawPixel
	add $12, $0, 1
	jal drawPixel
	sub $12, $21, 1
	jal drawPixel
	sub $12, $21, 2
	jal drawPixel
	addi $25, $25, -1
	j drawingBorders

endDrawBorders:
	addi $31, $8, 0
	jr $31

drawPlayer1:
	addi $8, $31, 0
	add $4, $0, $0
	sub $5, $26, $23
	add $6, $26, $23
	j drawingPlayer

drawPlayer2:
	addi $8, $31, 0
	subi $4, $21, 2
	sub $5, $27, $23
	add $6, $27, $23
	j drawingPlayer

drawingPlayer:
	beq $5, $6, endDrawingPlayer
	add $12, $5, $0
	add $13, $4, $0
	jal drawPixel
	add $13, $13, 1
	jal drawPixel
	addi $5, $5, 1
	j drawingPlayer

endDrawingPlayer:
	addi $31, $8, 0
	jr $31

moveBall:
	add $7, $31, $0
	lw $11, colorBlack
	jal drawBall
	lw $11, colorBlue
	add $28, $28, $16
	add $29, $29, $17
	jal drawBall
	add $31, $7, $0
	jr $31

controlBall:
	add $8, $31, $0
	add $24, $0, 4
	ble $28, $24, checkPlayer1
	subi $24, $21, 4
	bge $28, $24, checkPlayer2
	subi $24, $22, 5
	bge $29, $24, checkCornerY
	add $24, $0, 5
	ble $29, $24, checkCornerY
	add $31, $8, $0
	jr $31
	
checkPlayer1:
	add $3, $31, $0
	add $24, $26, $23
	addi $24, $24, 1
	bgt $29, $24, gameOver
	sub $24, $26, $23
	sub $24, $24, 1
	blt $29, $24, gameOver
	sub $17, $26, $29
	div $17, $17, 2
	andi $18, $16, -1
	li $5, 3
	li $2, 42
	syscall
	addi $16, $4, 0
	or $16, $16, $18
	jal checkCornerX
	add $31, $3, $0
	jr $31

checkPlayer2:
	add $3, $31, $0
	add $24, $27, $23
	addi $24, $24, 1
	bgt $29, $24, gameOver
	sub $24, $27, $23
	sub $24, $24, 1
	ble $29, $24, gameOver
	sub $17, $27, $29
	div $17, $17, 2
	andi $18, $16, -1
	li $5, 3
	li $2, 42
	syscall
	addi $16, $4, 0
	or $16, $16, $18
	jal checkCornerX
	add $31, $3, $0
	jr $31	

gameOver:
	j end

checkCornerX:
	add $6, $31, $0
	add $24, $0, 3
	ble $29, $24, revertBallAllAxis
	subi $24, $22, 5
	bge $29, $24, revertBallAllAxis
	jal revertBallXAxis
	add $31, $6, $0
	jr $31
	
checkCornerY:
	add $6, $31, $0
	add $24, $0, 3
	ble $28, $24, revertBallAllAxis
	subi $24, $21, 5
	bge $28, $24, revertBallAllAxis
	jal revertBallYAxis
	add $31, $6, $0
	jr $31

checkCornerXLeft:
	add $6, $31, $0
	add $24, $0, 3
	ble $29, $24, revertBallAllAxis
	
	bge $29, $24, revertBallAllAxis
	jal revertBallXAxis
	add $31, $6, $0
	jr $31
	
revertBallAllAxis:
	add $7, $31, $0
	mul $16, $16, -1
	mul $17, $17, -1
	add $31, $7, $0
	jr $31

revertBallXAxis:
	add $7, $31, $0
	mul $16, $16, -1
	add $31, $7, $0
	jr $31

revertBallYAxis:
	add $7, $31, $0
	mul $17, $17, -1
	add $31, $7, $0
	jr $31

drawBall:
	add $8, $31, $0
	add $12, $29, $0
	add $13, $28, $0
	jal drawPixel
	subi $12, $12, 1
	jal drawPixel
	add $12, $29, $0
	addi $12, $12, 1
	jal drawPixel
	add $12, $29, $0
	subi $13, $13, 1
	jal drawPixel
	add $13, $28, $0
	addi $13, $13, 1
	jal drawPixel
	add $13, $28, $0
	addi $12, $12, 1
	addi $13, $13, 1
	jal drawPixel
	subi $12, $12, 2
	jal drawPixel
	subi $13, $13, 2
	jal drawPixel
	addi $12, $12, 2
	jal drawPixel
	add $31, $8, $0
	jr $31

drawPixel:
	add $9, $31, $0
	mul $14, $22, 4
	mul $14, $14, $12
	mul $15, $13, 4
	add $14, $14, $15
	add $14, $14, $10
	sw $11, 0($14)
	add $31, $9, $0
	jr $31

end:
	li $v0 ,10
	syscall
