FROM openjdk:11 as BUILDER

WORKDIR /app
COPY ./src .
RUN javac ./main/Main.java

FROM openjdk:11-jre

WORKDIR /app
COPY --from=BUILDER /app .

EXPOSE 9999
CMD ["java", "main.Main"]
