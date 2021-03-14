# ----------------------
# Function Section
# ----------------------
fa(){
    alias | grep $1
}

# Weather Check
weather(){
    $1=1
    $2=Boyolali
    curl wttr.in/$2\?$1
}

