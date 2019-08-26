installer = Install\ macOS\ Mojave
target = .

macos.sparseimage:
	hdiutil create -o $@ -size 8G -layout SPUD -fs HFS+J -type SPARSE

/Volumes/install_build: macos.sparseimage
	hdiutil attach $< -noverify -mountpoint $@

create: /Volumes/install_build
	sudo /Applications/$(installer).app/Contents/Resources/createinstallmedia --volume $<; \
	hdiutil detach /Volumes/$(installer)

macos.iso.cdr: macos.sparseimage create
	hdiutil convert $< -format UDTO -o $(<:.sparseimage=.iso)

build: macos.iso.cdr
	mv $< $(<:.cdr=)

clean:
	hdiutil detach -quiet /Volumes/install_build; \
	rm -f macos.sparseimage macos.iso.cdr

.PHONY: create build clean
