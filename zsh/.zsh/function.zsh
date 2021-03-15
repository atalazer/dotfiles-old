# ----------------------
# Function Section
# ----------------------
fa(){
    alias | rg --smart-case $1 
}

# Weather Check
weather(){
    curl wttr.in/${2:-Boyolali}\?${1:-1}
}

