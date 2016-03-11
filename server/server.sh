#!/bin/bash

# Simple helper script to try to run one of several simple one-command
# web servers.
#
# Reference: https://gist.github.com/willurd/5720255

# Port the server uses
PORT=8000

set -e

if [ -z "$BASH_VERSION" ]; then
    echo "This script must be run with bash."
    exit 1
fi

# Switch to the presentation root.
cd $(dirname $0)/..

# Test if the given executable is in the path
has() {
    if `type -t "$1" >/dev/null 2>&1 ` ; then
        echo "Found '$1'"
        return 0
    fi

    return 1
}

# Run the arguments as a command.  If the command exits and appeared
# to run successfully, exit with a success status; otherwise return.
# Success is defined as both returning a 0 (success) status and
# running for more than a few seconds.  Otherwise, it's an error and
# the script lives on to try again.
run() {
    local before=`date +%s`

    echo "Trying $1"
    if eval "$@"; then
        local after=`date +%s`
        
        # If this ran for less than 3 seconds; we assume it failed.
        if (( $(expr $after - $before) < 3 )); then
            echo "Server failed!"
            return 0
        fi
        exit 0
    fi
}


# Try various server options and see if we can get one that works.
echo "Preferred port is $PORT"
if has webfsd; then
    # OS/X (at least) doesn't seem to have a global mime.types, so I
    # provide my own to covert the important stuff.
    run webfsd -F -p $PORT -l - -m server/mime.types
elif has plackup; then
    run plackup -MPlack::App::Directory -e 'Plack::App::Directory->new(root=>".");' -p $PORT
elif has twistd; then
    run twistd -n web -p $PORT --path .
elif has ruby; then
    # Requires >= 1.9.2
    run ruby -run -ehttpd . -p$PORT
elif has python; then
    # Assuming python 2 here
    run python -m SimpleHTTPServer $PORT
elif has busybox; then
    run busybox httpd -f -p $PORT
fi
    
echo "Couldn't find a server."
exit 1
