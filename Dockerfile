FROM movecrew/one4ubot:alpine-latest

RUN mkdir /Archivicore1.0 && chmod 777 /Archivicore1.0
ENV PATH="/Archivicore1.0/bin:$PATH"
WORKDIR /Archivicore1.0

RUN git clone https://github.com/AllianceProjects/Archivicore1.0 -b sql-extended /Archivicore1.0

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /Archivicore1.0/

#
# Make open port TCP
#
EXPOSE 80 443

#
# Finalization
#
CMD ["python3","-m","userbot"]
