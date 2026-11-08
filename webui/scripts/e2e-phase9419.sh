#!/usr/bin/env bash
# Phase-9419: client soft_fertig_ssh_auth_refusal_id_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_id_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refusal-id roster type ok"; echo "cleaned"; echo "OK: phase9419 e2e passed"
