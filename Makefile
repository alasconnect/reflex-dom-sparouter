build-example:
	cd example && nix-build -A ghcjs.example -o example-dist
	rm -rf example/web-assets
	mkdir example/web-assets
	cp -r example/example-dist/bin/example-exe.jsexe/. example/web-assets

run-example: build-example
	cd example/web-assets && nix-shell -p haskellPackages.hserv --run "hserv -p8081"
