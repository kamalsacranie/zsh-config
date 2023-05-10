function gi() {
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@;
}

function ghcurl() {
    curl $(echo $@ | sed s/github\.com/raw\.githubusercontent\.com/g | sed s/'blob\/'/''/g)
}
