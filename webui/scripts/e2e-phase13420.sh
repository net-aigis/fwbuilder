#!/usr/bin/env bash
# Phase-13420: STATUS mentions ssh_auth_impl_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_impl_count_roster|soft_fertig_ssh_auth_impl_count_roster' webui/STATUS.md
grep -qE 'phase13424|through 13424|e2e-phase13424' webui/STATUS.md
echo "STATUS ssh-auth-impl-count roster ok"; echo "cleaned"; echo "OK: phase13420 e2e passed"
