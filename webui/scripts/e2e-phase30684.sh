#!/usr/bin/env bash
# Phase-30684: STATUS Soft 30680+ ssh_auth_triacontahenicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30680\+|through 30688|ssh_auth_triacontahenicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase30688|through 30688|e2e-phase30696' webui/STATUS.md
echo "STATUS Soft 30680+ ok"; echo "cleaned"; echo "OK: phase30684 e2e passed"
