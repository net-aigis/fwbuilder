#!/usr/bin/env bash
# Phase-11900: STATUS mentions ssh_auth_hard_gap_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_hard_gap_count_roster|soft_fertig_ssh_auth_hard_gap_count_roster' webui/STATUS.md
grep -qE 'phase11904|through 11904|e2e-phase11904' webui/STATUS.md
echo "STATUS ssh-auth-hard-gap-count roster ok"; echo "cleaned"; echo "OK: phase11900 e2e passed"
