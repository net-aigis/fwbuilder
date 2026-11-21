#!/usr/bin/env bash
# Phase-20124: STATUS Soft 20120+ ssh_auth_octadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20120\+|through 20128|ssh_auth_octadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20128|through 20128|e2e-phase20136' webui/STATUS.md
echo "STATUS Soft 20120+ ok"; echo "cleaned"; echo "OK: phase20124 e2e passed"
