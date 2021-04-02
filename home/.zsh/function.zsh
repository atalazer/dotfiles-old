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

# clone subdirectory using subversion
git-svn() {
  if [[ ! -z "$1" && ! -z "$2" ]]; then
    echo "Starting clone/copy..."
    repo=$(echo $1 | sed 's/\/$\|.git$//')
    svn export "$repo/trunk/$2"
  else
    echo "Use: git-svn <repository> <subdir>"
  fi
}

