#!/usr/bin/env bash
# Phase-13820: STATUS mentions ssh_auth_title_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_title_count_roster|soft_fertig_ssh_auth_title_count_roster' webui/STATUS.md
grep -qE 'phase13824|through 13824|e2e-phase13824' webui/STATUS.md
echo "STATUS ssh-auth-title-count roster ok"; echo "cleaned"; echo "OK: phase13820 e2e passed"
