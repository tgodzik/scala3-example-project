 #!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"

export PATH=$PATH:/usr/local/openjdk-8/bin

alias sbt=$METALS_DIR/sbt
alias bloop=$METALS_DIR/bloop

bloop about