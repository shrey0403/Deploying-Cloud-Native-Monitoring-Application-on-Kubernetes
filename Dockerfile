FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y gcc libc-dev \
    && pip3 install --no-cache-dir -r requirements.txt
    
COPY . .

ENV FLASK_RUN_HOST=127.0.0.1

EXPOSE 5002

CMD ["flask", "run"]