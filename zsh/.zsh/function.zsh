# ----------------------
# Function Section
# ----------------------
# Alias Finder
fa(){
    alias | rg --smart-case $1 
}

# Weather Check
weather(){
    curl wttr.in/${2:-Boyolali}\?${1:-1}
}

d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}

