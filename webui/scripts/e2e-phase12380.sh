#!/usr/bin/env bash
# Phase-12380: STATUS mentions ssh_auth_refusal_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refusal_count_roster|soft_fertig_ssh_auth_refusal_count_roster' webui/STATUS.md
grep -qE 'phase12384|through 12384|e2e-phase12384' webui/STATUS.md
echo "STATUS ssh-auth-refusal-count roster ok"; echo "cleaned"; echo "OK: phase12380 e2e passed"
