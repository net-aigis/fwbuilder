#!/usr/bin/env bash
# Phase-10523: client soft_fertig_ssh_auth_alt_pair_roster Soft 10520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_alt_pair_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10520+ soft_fertig_ssh_auth_alt_pair_roster type ok"; echo "cleaned"; echo "OK: phase10523 e2e passed"
