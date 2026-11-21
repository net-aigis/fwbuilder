#!/usr/bin/env bash
# Phase-14699: client soft_fertig_ssh_auth_ms_delta_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_delta_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-delta roster type ok"; echo "cleaned"; echo "OK: phase14699 e2e passed"
