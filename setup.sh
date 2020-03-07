#!/bin/bash
cat << EOT >> ../.bashrc
if [ -f ~/.customrc/alias ]; then
	. ~/.customrc/alias
fi
EOT

cp alias ../.customrc/alias
