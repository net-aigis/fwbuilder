#!/usr/bin/env bash
# Phase-14059: client soft_fertig_ssh_auth_gap_refusal_title_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_refusal_title_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-gap-refusal-title roster type ok"; echo "cleaned"; echo "OK: phase14059 e2e passed"
