#!/bin/bash
echo "Project Auto-Detection in progress..."

if [ -f "requirements.txt" ]; then
    echo "Python project detected. Installing dependencies..."
    pip install -r requirements.txt
elif [ -f "CMakeLists.txt" ]; then
    echo "C++ project detected. Building..."
    mkdir -p build && cd build && cmake .. && make
elif [ -f "package.json" ]; then
    echo "Node.js project detected. Installing..."
    npm install
else
    echo "No standard project file found. Manual setup required."
fi

