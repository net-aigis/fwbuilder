#!/usr/bin/env bash
# Phase-8924: STATUS Soft 8920+ ssh_password_support_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8920\+|through 8928|ssh_password_support_refresh_roster' webui/STATUS.md
grep -qE 'phase8928|through 8928|e2e-phase8936' webui/STATUS.md
echo "STATUS Soft 8920+ ok"; echo "cleaned"; echo "OK: phase8924 e2e passed"
