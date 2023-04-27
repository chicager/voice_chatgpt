FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10-slim

WORKDIR /

ENV MAX_WORKERS=5
ENV PIP_ROOT_USER_ACTION=ignore
ENV OPENAI_API_KEY='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'

COPY ./requirements.txt /app/requirements.txt

RUN apt-get update && apt-get install apt-utils
RUN apt-get update && apt-get install dialog apt-utils -y
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y ffmpeg

COPY ./app /app