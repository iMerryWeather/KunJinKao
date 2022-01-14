build:
	swift build -c release
install:
	install .build/release/KunJinKao /usr/local/bin/
.PHONY: clean
clean:
	swift package clean


