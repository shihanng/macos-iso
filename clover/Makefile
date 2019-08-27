clover.tar:
	curl -Lk https://sourceforge.net/projects/cloverefiboot/files/Bootable_ISO/CloverISO-4533.tar.lzma/download -o clover.tar.lzma && \
		xz -d clover.tar.lzma && \
		tar xf clover.tar

test: clover.tar

clean:
	rm -f Clover-v2.4k-4533-X64.iso clover.tar

.PHONY: clean test
