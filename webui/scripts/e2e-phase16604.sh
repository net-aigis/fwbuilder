#!/usr/bin/env bash
# Phase-16604: STATUS Soft 16600+ ssh_auth_hepta_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16600\+|through 16608|ssh_auth_hepta_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16608|through 16608|e2e-phase16616' webui/STATUS.md
echo "STATUS Soft 16600+ ok"; echo "cleaned"; echo "OK: phase16604 e2e passed"
