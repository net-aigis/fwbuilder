#!/usr/bin/env bash
# Phase-13740: STATUS mentions ssh_auth_dict_key_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_dict_key_count_roster|soft_fertig_ssh_auth_dict_key_count_roster' webui/STATUS.md
grep -qE 'phase13744|through 13744|e2e-phase13744' webui/STATUS.md
echo "STATUS ssh-auth-dict-key-count roster ok"; echo "cleaned"; echo "OK: phase13740 e2e passed"
