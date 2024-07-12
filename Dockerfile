From golang:alpine As build
WORKDIR /src
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o ./demoapp

FROM scratch
WORKDIR /app
COPY --from=build /src/demoapp /app/demoapp
EXPOSE 8080
ENTRYPOINT [ "/app/demoapp" ]
