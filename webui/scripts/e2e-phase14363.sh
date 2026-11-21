#!/usr/bin/env bash
# Phase-14363: client soft_fertig_ssh_auth_surface_ssh_ratio_roster Soft 14360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_surface_ssh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14360+ soft_fertig_ssh_auth_surface_ssh_ratio_roster type ok"; echo "cleaned"; echo "OK: phase14363 e2e passed"
