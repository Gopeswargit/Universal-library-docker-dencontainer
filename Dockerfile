# উবুন্টু বেস ইমেজ ব্যবহার করছি
FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

# প্রয়োজনীয় প্যাকেজ ইন্সটল করা
RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    nodejs npm \
    cmake make g++ \
    libgl1-mesa-dev libglfw3-dev \
    git curl wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# কাজের ডিরেক্টরি সেট করা
WORKDIR /workspace
