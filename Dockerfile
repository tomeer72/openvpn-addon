# Użyj obrazu Alpine z OpenVPN
FROM alpine:latest

# Zainstaluj OpenVPN
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add jq openvpn && \
    rm -rf /tmp/*

# Skopiuj plik konfiguracyjny
COPY run.sh /run.sh
RUN /bin/chmod +ax /run.sh

# Komenda uruchamiająca OpenVPN z pliku konfiguracyjnego
CMD ["/run.sh"]
