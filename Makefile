macos.sparseimage:
	bash ./create_spareimage.sh

macos.iso.cdr: macos.sparseimage
	hdiutil convert $< -format UDTO -o $(<:.sparseimage=.iso)

build: macos.iso.cdr
	mv $< $(<:.cdr=)

clean:
	rm -f macos.sparseimage macos.iso.cdr macos.iso && \
	$(MAKE) -C clover clean


clover:
	$(MAKE) -C clover create

.PHONY: create build clean clover
