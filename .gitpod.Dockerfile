FROM gitpod/workspace-full-vnc
RUN sudo apt-get update && \
    sudo apt-get install -y libgtk-3-dev && \
    sudo rm -rf /var/lib/apt/lists/*
#RUN sudo apt-get update && sudo apt-get install -y libx11-dev libxkbfile-dev libsecret-1-dev libgconf2–4 libnss3 && sudo rm -rf /var/lib/apt/lists/*

# This will pull the official Gitpod `vnc` image
# which has much of what you need to start
#FROM gitpod/workspace-full-vnc

#USER gitpod

# Install wxPython dependencies
#RUN sudo apt-get -q update && \
#    sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev libnotify-dev libsdl2-dev libwebkit2gtk-4.0-dev libxtst-dev libgtk2.0-dev && \
#    sudo rm -rf /var/lib/apt/lists/*

# Install wxPython
#RUN pip3 install -U -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/ wxPython
