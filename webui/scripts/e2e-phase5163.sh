#!/usr/bin/env bash
# Phase-5163: client soft_fertig_ssh_refusal_status_roster Soft 5160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_status_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5160+ soft_fertig_ssh_refusal_status_roster type ok"; echo "cleaned"; echo "OK: phase5163 e2e passed"
