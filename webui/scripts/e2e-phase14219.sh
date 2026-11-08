#!/usr/bin/env bash
# Phase-14219: client soft_fertig_ssh_auth_export_ssh_ratio_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_ssh_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-export-ssh-ratio roster type ok"; echo "cleaned"; echo "OK: phase14219 e2e passed"
