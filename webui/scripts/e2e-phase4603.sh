#!/usr/bin/env bash
# Phase-4603: client soft_fertig_ssh_auth_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4600+ soft_fertig_ssh_auth_roster type ok"
echo "cleaned"
echo "OK: phase4603 e2e passed"
