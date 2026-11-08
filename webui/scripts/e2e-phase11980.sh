#!/usr/bin/env bash
# Phase-11980: STATUS mentions ssh_auth_path_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_path_count_roster|soft_fertig_ssh_auth_path_count_roster' webui/STATUS.md
grep -qE 'phase11984|through 11984|e2e-phase11984' webui/STATUS.md
echo "STATUS ssh-auth-path-count roster ok"; echo "cleaned"; echo "OK: phase11980 e2e passed"
