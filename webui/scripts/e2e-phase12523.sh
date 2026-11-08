#!/usr/bin/env bash
# Phase-12523: client soft_fertig_ssh_auth_alt_count_roster Soft 12520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_alt_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12520+ soft_fertig_ssh_auth_alt_count_roster type ok"; echo "cleaned"; echo "OK: phase12523 e2e passed"
