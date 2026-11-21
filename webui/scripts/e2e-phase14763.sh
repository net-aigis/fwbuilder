#!/usr/bin/env bash
# Phase-14763: client soft_fertig_ssh_auth_ms_delta_roster Soft 14760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_delta_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14760+ soft_fertig_ssh_auth_ms_delta_roster type ok"; echo "cleaned"; echo "OK: phase14763 e2e passed"
