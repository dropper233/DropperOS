; Variables.
KERNEL_SRC := ./src/kernel
BUILD := ./build
K_OBJ_ASM := $(BUILD)/boot.bin
K_OBJ := $(K_OBJ_ASM)

; Compile the objects.
$(K_OBJ_ASM): $(KERNEL_SRC)/boot.asm
	@-mkdir -p BUILD
	@echo "Compiling the asm files..."
	nasm $^ -o $@ -f bin
	@echo "Compile done!"

; Write the objects to "dropperos.img"
dropperos.img: $(BUILD)/boot.bin
	@ehco "Writing the files to the image file..."
	qemu-img create $@ -o size=64M -q
	dd if=$(BUILD)/boot.bin of=$@ bs=512 count=1 conv=notrunc
	@ehco "Write done!"

all: $(K_OBJ_ASM) dropperos.img

.PHONY: clean qemu

clean:
	@rm -rf BUILD dropperos.img
	@clear
	@echo "Here are the folders and files in this workspace:"
	@ls

; Start the qemu to running the system.
qemu:
	@qemu-system-x86_64 -m 1024M -hda dropperos.img