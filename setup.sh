#!/bin/bash

# যদি কোনো প্রজেক্ট ফোল্ডার না থাকে, তবে ইউজারকে জিজ্ঞেস করবে
if [ ! -d "my-project" ]; then
    echo "কোনো প্রজেক্ট পাওয়া যায়নি। ক্লোন করতে চাইলে URL দিন (অথবা এন্টার দিন):"
    read -r repo_url
    if [ ! -z "$repo_url" ]; then
        git clone "$repo_url" my-project
    fi
fi

# এখন প্রজেক্টের ভেতর ঢুকে অটোমেটিক রান করার লজিক
if [ -d "my-project" ]; then
    cd my-project
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    elif [ -f "CMakeLists.txt" ]; then
        mkdir -p build && cd build && cmake .. && make
    elif [ -f "package.json" ]; then
        npm install
    fi
fi

