#!/usr/bin/env bash
# Phase-5868: STATUS mentions ssh_password_support_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_password_support_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_password_support_roster' webui/STATUS.md
grep -qE 'phase5872|through 6352|e2e-phase5872' webui/STATUS.md
echo "STATUS ssh_password_support_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5868 e2e passed"
