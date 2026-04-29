FROM trzeci/emscripten:sdk-tag-1.35.0-64bit AS build

WORKDIR /src
COPY . /src/

ENV TERM=screen
RUN make release PLATFORM=js

FROM scratch AS artifact
COPY --from=build /src/build/release-js-js/ioquake3.js /quake_game.externjs
