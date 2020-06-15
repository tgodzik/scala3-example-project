 #!/bin/bash

METALS_DIR="$GITPOD_REPO_ROOT/.metals"
METALS_VERSION="0.9.0"

mkdir -p $METALS_DIR

export PATH=$PATH:/usr/local/openjdk-8/bin

echo "-Dsbt.coursier.home=$METALS_DIR/coursier" >> .jvmopts
echo "-Dcoursier.cache=$METALS_DIR/coursier" >> .jvmopts
echo "-sbt-dir $METALS_DIR/sbt" >> .sbtopts
echo "-sbt-boot $METALS_DIR/sbt/boot" >> .sbtopts
echo "-ivy $METALS_DIR/.ivy2" >> .sbtopts

curl -Lo $METALS_DIR/cs https://git.io/coursier-cli-linux && chmod +x $METALS_DIR/cs

$METALS_DIR/cs launch org.scalameta:metals_2.12:$METALS_VERSION -- -J-Dcoursier.cache=./output -M scala.meta.metals.DownloadDependencies

$METALS_DIR/cs install --install-dir $METALS_DIR --only-prebuilt=true bloop
$METALS_DIR/cs install --install-dir $METALS_DIR sbt

alias sbt=$METALS_DIR/sbt
alias bloop=$METALS_DIR/bloop

sbt -Dbloop.export-jar-classifiers=sources bloopInstall
bloop compile --cascade root