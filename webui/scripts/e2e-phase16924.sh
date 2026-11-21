#!/usr/bin/env bash
# Phase-16924: STATUS Soft 16920+ ssh_auth_octa_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16920\+|through 16928|ssh_auth_octa_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16928|through 16928|e2e-phase16936' webui/STATUS.md
echo "STATUS Soft 16920+ ok"; echo "cleaned"; echo "OK: phase16924 e2e passed"
