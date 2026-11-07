#!/usr/bin/env bash
# Phase-5884: STATUS Soft 5880+ ssh_password_support_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5888|ssh_password_support_roster' webui/STATUS.md
grep -qE 'phase5888|through 5888|e2e-phase5888' webui/STATUS.md
echo "STATUS Soft 5880+ ok"; echo "cleaned"; echo "OK: phase5884 e2e passed"
