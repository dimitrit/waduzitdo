default: all

all: waduzitdo.pap ewaduzitdo.pap

%.bin: %.a65
	vasm6502_oldstyle -dotdir $< -o $@ -L $(basename $<).lst -Fbin -quiet -esc

%.obj: %.a65
	vasm6502_oldstyle -dotdir $< -o $@ -L $(basename $<).lst -Fsrec -s19 -quiet -esc

%.pap: %.obj
	srec_cat $< -output $@ -MOS_Technologies -CRLF

%.hex: %.bin
	srec_cat  $< -binary -offset 0x200 -output $@ -Intel -address-length=2

clean:
	@rm -f *.lst *.bin *.obj *.hex *.pap

.PHONY: clean debug test
.PRECIOUS: %.hex %.bin
