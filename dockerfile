FROM python:3.14-slim

WORKDIR /app

RUN useradd --create-home --uid 10001 appuser

COPY requirements.txt requirements.txt

RUN pip3 install --no-cache-dir --only-binary :all: -r requirements.txt

COPY app.py bot.py chain.py config.py ingest.py prompts.py verify.py it_sector.txt ./

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8501 

CMD ["streamlit", "run", "app.py"] 