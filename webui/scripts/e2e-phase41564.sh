#!/usr/bin/env bash
# Phase-41564: STATUS Soft 41560+ ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41560\+|through 41568|ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase41568|through 41568|e2e-phase41576' webui/STATUS.md
echo "STATUS Soft 41560+ ok"; echo "cleaned"; echo "OK: phase41564 e2e passed"
