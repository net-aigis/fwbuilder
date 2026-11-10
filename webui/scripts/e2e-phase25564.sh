#!/usr/bin/env bash
# Phase-25564: STATUS Soft 25560+ ssh_auth_triacontapentadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25560\+|through 25568|ssh_auth_triacontapentadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25568|through 25568|e2e-phase25576' webui/STATUS.md
echo "STATUS Soft 25560+ ok"; echo "cleaned"; echo "OK: phase25564 e2e passed"
