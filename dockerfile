# Використовуємо офіційний базовий образ Python
FROM python:3.11

# Встановлюємо перемінну середовища
ENV APP_HOME /app

# Встановлюємо робочий каталог в контейнері
WORKDIR $APP_HOME

# Встановимо залежності всередині контейнера
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install


# Копіюємо файли проекту в контейнер
COPY . .


# Команда для запуску додатку
    CMD ["python", "console_helper/CLI.py"]
