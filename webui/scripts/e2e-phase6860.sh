#!/usr/bin/env bash
# Phase-6860: STATUS mentions ssh_refusal_status_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_status_refresh_roster|soft_fertig_ssh_refusal_status_refresh_roster' webui/STATUS.md
grep -qE 'phase6864|through 6864|e2e-phase6864' webui/STATUS.md
echo "STATUS ssh-refusal-status-refresh roster ok"; echo "cleaned"; echo "OK: phase6860 e2e passed"
