.text
main:
	lui $10, 0x1001
	addi $21, $0, 64
	addi $22, $0, 64
	addi $11, $0, 0xffffff
	jal drawBorders
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

fim:
	nop
	j fim

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
