ARG PORT=3000
FROM python:3.9.14-bullseye

WORKDIR /app

COPY python .

RUN pip install -r requirements.txt

ENV INSTANCE_NAME="hello-dove-bear"
ENV INSTANCE_HASH="1337"
EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD "curl localhost:${PORT}/healthz"

ENTRYPOINT ["./run.sh"]
