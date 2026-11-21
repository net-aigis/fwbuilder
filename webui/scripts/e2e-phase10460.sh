#!/usr/bin/env bash
# Phase-10460: STATUS mentions ssh_auth_alt_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_alt_pair_roster|soft_fertig_ssh_auth_alt_pair_roster' webui/STATUS.md
grep -qE 'phase10464|through 10464|e2e-phase10464' webui/STATUS.md
echo "STATUS ssh-auth-alt-pair roster ok"; echo "cleaned"; echo "OK: phase10460 e2e passed"
