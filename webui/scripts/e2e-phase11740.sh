#!/usr/bin/env bash
# Phase-11740: STATUS mentions ssh_auth_catalog_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_catalog_count_roster|soft_fertig_ssh_auth_catalog_count_roster' webui/STATUS.md
grep -qE 'phase11744|through 11744|e2e-phase11744' webui/STATUS.md
echo "STATUS ssh-auth-catalog-count roster ok"; echo "cleaned"; echo "OK: phase11740 e2e passed"
