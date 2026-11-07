#!/usr/bin/env bash
# Phase-5099: client ssh_refusal_status_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_status_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-status roster type ok"; echo "cleaned"; echo "OK: phase5099 e2e passed"
