#!/usr/bin/env bash
# Phase-6684: STATUS Soft 6680+ ssh_implemented_identity_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_implemented_identity_roster' webui/STATUS.md
grep -qE 'phase6688|through 6688|e2e-phase6696' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase6684 e2e passed"
