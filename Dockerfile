FROM python:3.6.5-stretch
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -y \
    install libtiff5-dev libjpeg62-turbo-dev zlib1g-dev \
    libxml2-dev libxslt1-dev libfreetype6-dev libwebp-dev

RUN mkdir /wheels
COPY requirements.txt requirements.txt
RUN pip wheel --disable-pip-version-check --no-deps --wheel-dir /wheels -r requirements.txt

FROM python:3.6.5-slim-stretch


RUN apt-get update && apt-get install -y \
    libtiff5 libjpeg62-turbo zlib1g \
    libxml2 libxslt1.1 libopenjp2-7 libfreetype6 libwebp6 \
    &&  apt-get autoremove -y &&  apt-get clean -y

COPY --from=0 /wheels /wheels
RUN pip install --disable-pip-version-check --no-index --no-deps /wheels/* && rm -rf /wheels requirements.txt

ENTRYPOINT ["pilbox"]
