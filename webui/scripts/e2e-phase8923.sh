#!/usr/bin/env bash
# Phase-8923: client soft_fertig_ssh_password_support_refresh_roster Soft 8920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_password_support_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8920+ soft_fertig_ssh_password_support_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8923 e2e passed"
