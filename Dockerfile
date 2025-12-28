# Użyj obrazu Alpine z OpenVPN
FROM alpine:latest

# Zainstaluj OpenVPN
RUN apk update && apk add openvpn

# Skopiuj plik konfiguracyjny
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Komenda uruchamiająca OpenVPN z pliku konfiguracyjnego
CMD ["/run.sh"]
