FROM python:3.11

WORKDIR /app

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

COPY . .

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
