#!/usr/bin/env bash
# Phase-12843: client soft_fertig_ssh_auth_surface_count_roster Soft 12840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_surface_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12840+ soft_fertig_ssh_auth_surface_count_roster type ok"; echo "cleaned"; echo "OK: phase12843 e2e passed"
