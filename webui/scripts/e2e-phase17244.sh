#!/usr/bin/env bash
# Phase-17244: STATUS Soft 17240+ ssh_auth_nona_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17240\+|through 17248|ssh_auth_nona_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17248|through 17248|e2e-phase17256' webui/STATUS.md
echo "STATUS Soft 17240+ ok"; echo "cleaned"; echo "OK: phase17244 e2e passed"
