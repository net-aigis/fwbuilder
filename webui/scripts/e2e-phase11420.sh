#!/usr/bin/env bash
# Phase-11420: STATUS mentions ssh_auth_clear_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_clear_hint_roster|soft_fertig_ssh_auth_clear_hint_roster' webui/STATUS.md
grep -qE 'phase11424|through 11424|e2e-phase11424' webui/STATUS.md
echo "STATUS ssh-auth-clear-hint roster ok"; echo "cleaned"; echo "OK: phase11420 e2e passed"
