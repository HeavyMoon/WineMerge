#######################################
#   WineMerge
#######################################
FROM ubuntu:latest

# SETUP
RUN useradd -ms /bin/bash winemerge
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install wine32 wine64 wget unzip
RUN wget -NP /home/winemerge https://downloads.sourceforge.net/winmerge/winmerge-2.16.4-x64-exe.zip && \
    unzip -ud /home/winemerge /home/winemerge/winmerge-2.16.4-x64-exe.zip
#    chown -R winemerge.winemerge /home/winemerge

# START
USER winemerge
CMD wineboot -u && /usr/bin/wine64 /home/winemerge/WinMerge/WinMergeU.exe
