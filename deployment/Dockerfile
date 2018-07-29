FROM quay.io/baguette.io/baguette-base:latest
# Install the module
USER 1890
RUN pip install --user baguette-messaging
RUN pip install --user baguette-git
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/home/baguette/.local/bin/farine" ,"--start=frasage"]
