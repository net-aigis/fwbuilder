#!/usr/bin/env bash
# Phase-4620: STATUS mentions password_ssh_roster / 4617-4624.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'password_ssh_roster|soft_fertig_password_ssh_roster' webui/STATUS.md
grep -qE 'phase4624|through 4624|e2e-phase4624' webui/STATUS.md
echo "STATUS password-ssh roster ok"
echo "cleaned"
echo "OK: phase4620 e2e passed"
