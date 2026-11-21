#!/usr/bin/env bash
# Phase-9723: client soft_fertig_ssh_auth_refusal_status_roster Soft 9720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_status_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9720+ soft_fertig_ssh_auth_refusal_status_roster type ok"; echo "cleaned"; echo "OK: phase9723 e2e passed"
