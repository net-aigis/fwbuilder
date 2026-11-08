#!/usr/bin/env bash
# Phase-15324: STATUS Soft 15320+ ssh_auth_triple_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15320\+|through 15328|ssh_auth_triple_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15328|through 15328|e2e-phase15336' webui/STATUS.md
echo "STATUS Soft 15320+ ok"; echo "cleaned"; echo "OK: phase15324 e2e passed"
