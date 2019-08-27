clover.tar:
	curl -Lk https://sourceforge.net/projects/cloverefiboot/files/Bootable_ISO/CloverISO-4533.tar.lzma/download -o clover.tar.lzma && \
		xz -d clover.tar.lzma && \
		tar xf clover.tar

clover.iso: clover.tar
	bash ./create_dmg.sh

create: clover.iso

clean:
	rm -f Clover-v2.4k-4533-X64.iso clover.tar clover.dmg clover.iso

.PHONY: clean create
