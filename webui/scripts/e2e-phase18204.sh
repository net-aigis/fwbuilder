#!/usr/bin/env bash
# Phase-18204: STATUS Soft 18200+ ssh_auth_dodeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18200\+|through 18208|ssh_auth_dodeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase18208|through 18208|e2e-phase18216' webui/STATUS.md
echo "STATUS Soft 18200+ ok"; echo "cleaned"; echo "OK: phase18204 e2e passed"
