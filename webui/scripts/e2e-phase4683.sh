#!/usr/bin/env bash
# Phase-4683: client soft_fertig_password_ssh_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_password_ssh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4680+ soft_fertig_password_ssh_roster type ok"
echo "cleaned"
echo "OK: phase4683 e2e passed"
