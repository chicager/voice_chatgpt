FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10-slim

WORKDIR /

ENV MAX_WORKERS=5
ENV PIP_ROOT_USER_ACTION=ignore
ENV OPENAI_API_KEY=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

COPY ./requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install apt-utils
RUN apt-get update && apt-get install dialog apt-utils -y
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y ffmpeg

COPY ./app /app
