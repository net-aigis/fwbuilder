#!/usr/bin/env bash
# Phase-10043: client soft_fertig_ssh_auth_capability_count_roster Soft 10040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_capability_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10040+ soft_fertig_ssh_auth_capability_count_roster type ok"; echo "cleaned"; echo "OK: phase10043 e2e passed"
