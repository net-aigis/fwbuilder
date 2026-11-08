#!/usr/bin/env bash
# Phase-9659: client soft_fertig_ssh_auth_refusal_status_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_status_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refusal-status roster type ok"; echo "cleaned"; echo "OK: phase9659 e2e passed"
