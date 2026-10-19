# Użyj obrazu Alpine z OpenVPN
#FROM alpine:latest
ARG BUILD_FROM
FROM $BUILD_FROM

# Zainstaluj OpenVPN
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add jq openvpn && \
    rm -rf /tmp/*

# Skopiuj plik konfiguracyjny
COPY rootfs /
COPY run.sh /run.sh
RUN /bin/chmod +x /run.sh
WORKDIR /
# Komenda uruchamiająca OpenVPN z pliku konfiguracyjnego
CMD ["/run.sh"]

