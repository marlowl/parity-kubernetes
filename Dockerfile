FROM parity/parity:stable

COPY ./config /home/parity/
COPY ./config/passwords /home/parity/password/

USER root
RUN chown -R parity:parity /home/parity/password/node.pwds \
    /home/parity/

USER parity
