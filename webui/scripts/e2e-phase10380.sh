#!/usr/bin/env bash
# Phase-10380: STATUS mentions ssh_auth_refusal_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refusal_pair_roster|soft_fertig_ssh_auth_refusal_pair_roster' webui/STATUS.md
grep -qE 'phase10384|through 10384|e2e-phase10384' webui/STATUS.md
echo "STATUS ssh-auth-refusal-pair roster ok"; echo "cleaned"; echo "OK: phase10380 e2e passed"
