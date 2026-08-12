FROM ghcr.io/containerpak/gtk:main

ADD --checksum=sha256:c35c75854d92e8a303215eb4859582be984b813e6a34a544770a50039838e057 \
    https://github.com/rafatosta/zapzap/archive/refs/tags/v4.5.2.tar.gz \
    /tmp/zapzap.tar.gz

RUN apt update && \
    apt install -y --no-install-recommends python3-setuptools python3-pyqt6 python3-pyqt6.qtwebengine python3-pyqt6.qtsvg python3-dbus && \
    mkdir /tmp/zapzap && \
    tar -xzf /tmp/zapzap.tar.gz --strip-components=1 -C /tmp/zapzap && \
    cd /tmp/zapzap && \
    python3 setup.py install && \
    install -Dm644 share/applications/com.rtosta.zapzap.desktop /usr/share/applications/com.rtosta.zapzap.desktop && \
    rm -rf /tmp/zapzap /tmp/zapzap.tar.gz && \
    cpak-clean-junk
