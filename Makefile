SOURCE="https://download.zotero.org/client/release/5.0.87/Zotero-5.0.87_linux-x86_64.tar.bz2"
DESTINATION="zotero.tar.bz2"
OUTPUT="Zotero.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	tar -xf $(DESTINATION)
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r Zotero_linux-x86_64/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf Zotero_linux-x86_64
