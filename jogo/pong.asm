# 512x512 || 4x4

.data 0x10000000
	color: .word 0xff
	width: .word 128
 	height: .word 128
 	playerSize: .word 10
 	startPoint1: .word 63
 	startPoint2: .word 63
 	ballX: .word 63
 	ballY: .word 63
.text
main:
	lui $10, 0x1001
	lw $11, color
	lw $21, width
	lw $22, height
	lw $23, playerSize
	lw $26, startPoint1
	lw $27, startPoint2
	lw $28, ballX
	lw $29, ballY
	jal drawBorders
	jal drawPlayer1
	jal drawPlayer2
	jal drawBall
	j fim

drawBorders:
	addi $8, $31, 0

drawingBorders:
	beq $25, $22, endDrawBorders
	addi $12, $0, 0
	add $13, $0, $25
	jal drawPixel
	add $12, $0, 1
	jal drawPixel
	sub $12, $21, 1
	jal drawPixel
	sub $12, $21, 2
	jal drawPixel
	addi $25, $25, 1
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

drawBall:
	add $8, $31, $0
	add $12, $28, $0
	add $13, $29, $0
	jal drawPixel
	subi $12, $12, 1
	jal drawPixel
	add $12, $28, $0
	addi $12, $12, 1
	jal drawPixel
	add $12, $28, $0
	subi $13, $13, 1
	jal drawPixel
	add $13, $29, $0
	addi $13, $13, 1
	jal drawPixel
	add $13, $29, $0
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
	
fim:
	li $v0,10
	syscall
