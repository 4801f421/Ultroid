# 1. Base Image
FROM python:3.9-slim

# 2. Set Environment Variables
ENV TZ=Asia/Tehran

# 3. Install system dependencies
RUN apt-get update &&     apt-get install -y --no-install-recommends     git     ffmpeg     mediainfo     neofetch     && rm -rf /var/lib/apt/lists/*

# 4. Copy project files
WORKDIR /root/TeamUltroid
COPY . .

# 5. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt &&     pip install --no-cache-dir -r resources/startup/optional-requirements.txt &&     pip install --no-cache-dir redis hiredis

# 6. Set the entrypoint
CMD ["bash", "startup"]