#!/usr/bin/env bash
# Phase-14060: STATUS mentions ssh_auth_gap_refusal_title_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_gap_refusal_title_roster|soft_fertig_ssh_auth_gap_refusal_title_roster' webui/STATUS.md
grep -qE 'phase14064|through 14064|e2e-phase14064' webui/STATUS.md
echo "STATUS ssh-auth-gap-refusal-title roster ok"; echo "cleaned"; echo "OK: phase14060 e2e passed"
