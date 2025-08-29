# 1. Base Image
FROM python:3.13-slim

# 2. Set Environment Variables
ENV TZ=Asia/Tehran

# 3. Install system dependencies
RUN apt-get update &&     apt-get install -y --no-install-recommends     git     ffmpeg     mediainfo     && rm -rf /var/lib/apt/lists/*

# 4. Set workdir
WORKDIR /root/TeamUltroid

# 5. Copy requirements first to leverage Docker layer caching
COPY requirements.txt ./
COPY resources/startup/optional-requirements.txt ./resources/startup/optional-requirements.txt

# 6. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt &&     pip install --no-cache-dir -r resources/startup/optional-requirements.txt &&     pip install --no-cache-dir redis hiredis

# 7. Copy the rest of the application code
COPY . .

# 8. Set the entrypoint
CMD ["bash", "startup"]
