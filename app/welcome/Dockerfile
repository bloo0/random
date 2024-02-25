FROM python:3.8-alpine

COPY . /app

WORKDIR /app

RUN apk add --update \
  && pip install --upgrade pip  \
  && pip install -r requirements.txt \
  && rm -rf /var/cache/apk/*

EXPOSE 5051

CMD python app.py