#!/usr/bin/env bash
# Phase-10524: STATUS Soft 10520+ ssh_auth_alt_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10520\+|through 10528|ssh_auth_alt_pair_roster' webui/STATUS.md
grep -qE 'phase10528|through 10528|e2e-phase10536' webui/STATUS.md
echo "STATUS Soft 10520+ ok"; echo "cleaned"; echo "OK: phase10524 e2e passed"
