objects = waduzitdo.bin

default: all

all: waduzitdo.hex

%.bin: %.a65
	vasm6502_oldstyle -dotdir $< -o $@ -L $(basename $<).lst -Fbin -quiet -esc

%.hex: $(objects)
	srec_cat  $< -binary -offset 0x200 -output $@ -Intel -address-length=2

clean:
	@rm -f *.lst *.bin *.obj *.hex 

.PHONY: clean debug test
.PRECIOUS: %.hex %.bin
