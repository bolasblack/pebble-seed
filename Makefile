.PHONY : init build install

init :
	npm install

build :
	rm -rf src
	`npm bin`/gulp
	pebble build

install : build
	pebble install
	pebble logs
