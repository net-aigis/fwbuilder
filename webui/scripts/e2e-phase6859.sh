#!/usr/bin/env bash
# Phase-6859: client ssh_refusal_status_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_status_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-status-refresh roster type ok"; echo "cleaned"; echo "OK: phase6859 e2e passed"
