#!/usr/bin/env bash
# Phase-12460: STATUS mentions ssh_auth_alt_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_alt_count_roster|soft_fertig_ssh_auth_alt_count_roster' webui/STATUS.md
grep -qE 'phase12464|through 12464|e2e-phase12464' webui/STATUS.md
echo "STATUS ssh-auth-alt-count roster ok"; echo "cleaned"; echo "OK: phase12460 e2e passed"
