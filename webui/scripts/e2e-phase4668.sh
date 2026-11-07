#!/usr/bin/env bash
# Phase-4668: STATUS mentions password_ssh_roster sessionStorage / 4665-4672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'password_ssh_roster.*(sessionStorage|Clear)|sessionStorage.*password_ssh_roster' webui/STATUS.md
grep -qE 'phase4672|through 4672|e2e-phase4672' webui/STATUS.md
echo "STATUS password_ssh_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4668 e2e passed"
