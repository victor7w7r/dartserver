FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
RUN dart compile exe bin/main.dart -o bin/server

FROM alpine:latest
COPY --from=build /runtime /
COPY --from=build /app/bin/server /app/

RUN apk update
RUN apk add --no-cache bash nano
VOLUME /xma

EXPOSE 8080
CMD ["/app/server"]
