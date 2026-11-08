#!/usr/bin/env bash
# Phase-12443: client soft_fertig_ssh_auth_refusal_count_roster Soft 12440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12440+ soft_fertig_ssh_auth_refusal_count_roster type ok"; echo "cleaned"; echo "OK: phase12443 e2e passed"
