FROM python:3.8.6-alpine3.12

# =============================================================================
# 타임존 설정
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone

# =============================================================================
# 의존성 설치
ADD requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

# =============================================================================
# 소스코드 복사
RUN mkdir -p /root/src
ADD src /root/src

# =============================================================================
EXPOSE 5000

# =============================================================================
WORKDIR /root/src
CMD ["python", "app.py"]