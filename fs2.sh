#!/bin/bash
test -e ~/.coursier/cr || (mkdir -p ~/.coursier && wget -q -O ~/.coursier/cr https://git.io/vgvpD && chmod +x ~/.coursier/cr)
CLASSPATH="$(~/.coursier/cr fetch -q -p -r https://oss.sonatype.org/content/repositories/snapshots \
  \
  co.fs2:fs2-core_2.11:0.9.0-SNAPSHOT\
  com.lihaoyi:ammonite-repl_2.11.7:0.5.2 \
  \
)" java ammonite.repl.Main --predef 'import fs2._'
