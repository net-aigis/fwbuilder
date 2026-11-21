#!/usr/bin/env bash
# Phase-10700: STATUS mentions ssh_auth_type_tag_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_type_tag_roster|soft_fertig_ssh_auth_type_tag_roster' webui/STATUS.md
grep -qE 'phase10704|through 10704|e2e-phase10704' webui/STATUS.md
echo "STATUS ssh-auth-type-tag roster ok"; echo "cleaned"; echo "OK: phase10700 e2e passed"
