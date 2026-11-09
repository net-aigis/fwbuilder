#!/usr/bin/env bash
# Phase-19484: STATUS Soft 19480+ ssh_auth_hexadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 19480\+|through 19488|ssh_auth_hexadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase19488|through 19488|e2e-phase19496' webui/STATUS.md
echo "STATUS Soft 19480+ ok"; echo "cleaned"; echo "OK: phase19484 e2e passed"
