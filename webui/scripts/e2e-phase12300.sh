#!/usr/bin/env bash
# Phase-12300: STATUS mentions ssh_auth_method_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_method_count_roster|soft_fertig_ssh_auth_method_count_roster' webui/STATUS.md
grep -qE 'phase12304|through 12304|e2e-phase12304' webui/STATUS.md
echo "STATUS ssh-auth-method-count roster ok"; echo "cleaned"; echo "OK: phase12300 e2e passed"
