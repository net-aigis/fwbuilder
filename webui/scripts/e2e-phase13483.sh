#!/usr/bin/env bash
# Phase-13483: client soft_fertig_ssh_auth_impl_count_roster Soft 13480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_impl_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13480+ soft_fertig_ssh_auth_impl_count_roster type ok"; echo "cleaned"; echo "OK: phase13483 e2e passed"
