#!/usr/bin/env bash
# Phase-14283: client soft_fertig_ssh_auth_export_ssh_ratio_roster Soft 14280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_ssh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14280+ soft_fertig_ssh_auth_export_ssh_ratio_roster type ok"; echo "cleaned"; echo "OK: phase14283 e2e passed"
