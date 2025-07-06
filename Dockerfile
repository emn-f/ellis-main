FROM python:3.13.5-alpine3.22

# Diretório do trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependencias
# Usando --no-cache-dir pra evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia restante do código da aplicação para o diretório do trabalho
COPY . .

# Expõe a porta 8000 para o host
EXPOSE 8000

# Rodar aplicação utilizando uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
