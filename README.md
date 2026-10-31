# em-fceux-site

https://bitbucket.org/tsone/em-fceux-site/

Nintendo Entertainment System/Famicom (NES/FC) emulator on the web.

Try it at https://tsone.kapsi.fi/em-fceux/.

The emulator uses [em-fceux](https://github.com/soltune/fceux/tree/emscripten/src/drivers/em), an
[Emscripten](http://emscripten.org) port of the [FCEUX](http://www.fceux.com/)
emulator.

## Build

Setup:

1. Have [npm](https://www.npmjs.com/get-npm).
2. Clone [FCEUX with em-fceux](https://github.com/soltune/fceux) to `../fceux`.
   em-fceux is used from `../fceux/src/drivers/em` instead of the npm registry.
3. Install [Emscripten](https://emscripten.org/docs/getting_started/downloads.html)
   to `../emsdk`, or run `source emsdk_env.sh` before building.
4. Run `npm install`.

`FCEUX_DIR` and `EMSDK_DIR` environment variables override the default
locations.

For development, run `npm start` to build em-fceux and start
`webpack-dev-server` at http://localhost:8080/. The dev server copies em-fceux
only at startup, so restart it after rebuilding em-fceux with
`npm run build:fceux`.

For release, run `npm run build` to build em-fceux and create a deployable site
in `dist/`.

## Browser Requirements

- [WebAssembly](https://webassembly.org/).
- [WebGL](https://www.khronos.org/webgl/).
- [Web Audio API](https://www.w3.org/TR/webaudio/).
- [Web Storage API (localStorage)](https://html.spec.whatwg.org/multipage/webstorage.html).
- [Gamepad API](https://www.w3.org/TR/gamepad/).

## Contact

Authored by Valtteri "tsone" Heikkilä.

Please submit bugs and feature requests in the
[em-fceux issue tracker](https://bitbucket.org/tsone/em-fceux/issues?status=new&status=open).

## License

Licensed under [GNU GPL 2](https://www.gnu.org/licenses/gpl-2.0.txt) excluding
the built-in games. The games are distributed by permission from the authors.
