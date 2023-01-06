default: all

all: waduzitdo.hex ewaduzitdo.hex

%.bin: %.a65
	vasm6502_oldstyle -dotdir $< -o $@ -L $(basename $<).lst -Fbin -quiet -esc

%.hex: %.bin
	srec_cat  $< -binary -offset 0x200 -output $@ -Intel -address-length=2

clean:
	@rm -f *.lst *.bin *.obj *.hex 

.PHONY: clean debug test
.PRECIOUS: %.hex %.bin
